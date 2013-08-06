From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 1/2] reiserfs: locking, handle nested locks properly
Date: Tue, 06 Aug 2013 17:10:22 -0400
Message-ID: <5201663E.5030600@suse.com>
References: <20130806001216.080404663@suse.com> <20130806001314.727159902@suse.com> <20130806204608.GB11383@quack.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="jIVbCl2A1UboBe8GUsPiaaILrrV4n0CHi"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20130806204608.GB11383@quack.suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: reiserfs-devel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jIVbCl2A1UboBe8GUsPiaaILrrV4n0CHi
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 8/6/13 4:46 PM, Jan Kara wrote:
> On Mon 05-08-13 20:12:17, Jeff Mahoney wrote:
>> The reiserfs write lock replaced the BKL and uses similar semantics.
>>
>> Frederic's locking code makes a distinction between when the lock is n=
ested
>> and when it's being acquired/released, but I don't think that's the ri=
ght
>> distinction to make.
>>
>> The right distinction is between the lock being released at end-of-use=
 and
>> the lock being released for a schedule. The unlock should return the d=
epth
>> and the lock should restore it, rather than the other way around as it=
 is now.
>>
>> This patch implements that and adds a number of places where the lock
>> should be dropped.
> ...
>=20
>> --- a/fs/reiserfs/reiserfs.h	2013-08-05 20:08:59.258412220 -0400
>> +++ b/fs/reiserfs/reiserfs.h	2013-08-05 20:09:52.537601042 -0400
>> @@ -630,8 +630,8 @@ static inline int __reiserfs_is_journal_
>>   */
>>  void reiserfs_write_lock(struct super_block *s);
>>  void reiserfs_write_unlock(struct super_block *s);
>> -int reiserfs_write_lock_once(struct super_block *s);
>> -void reiserfs_write_unlock_once(struct super_block *s, int lock_depth=
);
>> +int __must_check reiserfs_write_unlock_nested(struct super_block *s);=

>> +void reiserfs_write_lock_nested(struct super_block *s, int depth);
>> =20
>>  #ifdef CONFIG_REISERFS_CHECK
>>  void reiserfs_lock_check_recursive(struct super_block *s);
>> @@ -666,45 +666,54 @@ static inline void reiserfs_lock_check_r
>>   * - The journal lock
>>   * - The inode mutex
>>   */
>> -static inline void reiserfs_mutex_lock_safe(struct mutex *m,
>> -			       struct super_block *s)
>> +
>> +#define reiserfs_safe(sb, action)			\
>> +do {							\
>> +	struct super_block *__sb =3D (sb);		\
>> +	int __depth;					\
>> +	__depth =3D reiserfs_write_unlock_nested(__sb);	\
>> +	(action);					\
>> +	reiserfs_write_lock_nested(__sb, __depth);	\
>> +} while(0)
>> +
>> +#define reiserfs_mutex_lock_safe(mtx, s) reiserfs_safe(s, mutex_lock(=
mtx))
>> +#define reiserfs_mutex_lock_nested_safe(mtx, subclass, s) \
>> +	reiserfs_safe(s, mutex_lock_nested(mtx, subclass))
>> +#define reiserfs_down_read_safe(sem, s) reiserfs_safe(s, down_read(se=
m))
>> +
>> +/*
>> + * When we schedule, we usually want to also release the write lock,
>> + * according to the previous bkl based locking scheme of reiserfs.
>> + */
>> +static inline void reiserfs_cond_resched(struct super_block *s)
>>  {
>> -	reiserfs_lock_check_recursive(s);
>> -	reiserfs_write_unlock(s);
>> -	mutex_lock(m);
>> -	reiserfs_write_lock(s);
>> +	if (need_resched())
>> +		reiserfs_safe(s, schedule());
>>  }
>> =20
>> -static inline void
>> -reiserfs_mutex_lock_nested_safe(struct mutex *m, unsigned int subclas=
s,
>> -			       struct super_block *s)
>> +static inline struct buffer_head *
>> +reiserfs_safe_sb_bread(struct super_block *s, sector_t block)
>>  {
>> -	reiserfs_lock_check_recursive(s);
>> -	reiserfs_write_unlock(s);
>> -	mutex_lock_nested(m, subclass);
>> -	reiserfs_write_lock(s);
>> +	int depth;
>> +	struct buffer_head *bh;
>> +
>> +	depth =3D reiserfs_write_unlock_nested(s);
>> +	bh =3D sb_bread(s, block);
>> +	reiserfs_write_lock_nested(s, depth);
>> +
>> +	return bh;
>>  }
>>
>> +void reiserfs_safe_lock_buffer(struct buffer_head *bh);
>> +
>>  static inline void
>> -reiserfs_down_read_safe(struct rw_semaphore *sem, struct super_block =
*s)
>> +reiserfs_safe_wait_on_buffer(struct buffer_head *bh, struct super_blo=
ck *s)
>>  {
>> -	reiserfs_lock_check_recursive(s);
>> -	reiserfs_write_unlock(s);
>> -	down_read(sem);
>> -	reiserfs_write_lock(s);
>> -}
>> +	int depth;
>> =20
>> -/*
>> - * When we schedule, we usually want to also release the write lock,
>> - * according to the previous bkl based locking scheme of reiserfs.
>> - */
>> -static inline void reiserfs_cond_resched(struct super_block *s)
>> -{
>> -	if (need_resched()) {
>> -		reiserfs_write_unlock(s);
>> -		schedule();
>> -		reiserfs_write_lock(s);
>> -	}
>> +	depth =3D reiserfs_write_unlock_nested(s);
>> +	__wait_on_buffer(bh);
>> +	reiserfs_write_lock_nested(s, depth);
>>  }
>> =20
>>  struct fid;
>> @@ -2463,6 +2472,15 @@ int reiserfs_commit_for_inode(struct ino
>>  int reiserfs_inode_needs_commit(struct inode *);
>>  void reiserfs_update_inode_transaction(struct inode *);
>>  void reiserfs_wait_on_write_block(struct super_block *s);
>> +static inline void reiserfs_safe_wait_on_write_block(struct super_blo=
ck *s)
>> +{
>> +	int depth;
>> +
>> +	depth =3D reiserfs_write_unlock_nested(s);
>> +	reiserfs_wait_on_write_block(s);
>> +	reiserfs_write_lock_nested(s, depth);
>> +}
>> +
>   I didn't find where the above 'safe' functions are called...

Whoa. WTF. Thanks for the review. These aren't the same patches as the
ones in my repo. No idea why these got sent instead of the right ones!

-Jeff


--=20
Jeff Mahoney
SUSE Labs


--jIVbCl2A1UboBe8GUsPiaaILrrV4n0CHi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)

iQIcBAEBAgAGBQJSAWZBAAoJEB57S2MheeWyefUP/3v43Fv1BCYSCrmfwN/VnPXI
VIt3QfMuqhqFAnbU4uyPE7bQgF5n15QKuWalAHwZRLzAEJ2ozFrcPcHaJHDTGXYK
sTN3ju+WeQW6V5+IjxcFxqMT5Drguw0YimRs+FNibIjCk/Uao/1Ooq+f1BvS4dkN
Q2JSAIeGZJglNZECWmasKJLUxD323w2dcsqX8aSv7cL3OMqRGpwcUONbj5LKROTd
MKgF+19/mSb27IOEw4QhClBwP6i7K0QEqEYQtRxIya4GuELQ5WPEhrm52u03/GEb
9cEiaLexsBETUp7vpuiBAXQh7lcF6T4J2UUAnXgB24GjHZ9SB022ajJWb6AFZ6St
DIZZJyugy5IedB3PxI3Xhj8s2vMN94TGmvRbqAQSkXKSX09bciQlppPSg4bidd3j
6UbMF01G5nfOgEpVYwzSJ771TyndOrioDFU+bRfg52gWaLDMfpZRC5T31Hjk3eAX
2N7MXQH9/ZEsGN2LOZkXnTL8R5x+waSt7SKgM8ZKD/AecXgf/oNTwm/ieyiNUt4+
+tGie7W/WqwiJDLmWdJT0mtmq3tHQnCPId5dUVMJRGZjg7Dqq/qLU1Ou3eluRboW
mRPlr94sKOG8BC/mQaCAVYdrfKdGUDFdklnpHTvC8fP3c1vU1/iQu7c3Z3A0fOWt
YjF0rVODV8mrzgHzzeYx
=q1vA
-----END PGP SIGNATURE-----

--jIVbCl2A1UboBe8GUsPiaaILrrV4n0CHi--
