From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 1/2] reiserfs: locking, handle nested locks properly
Date: Tue, 06 Aug 2013 17:13:51 -0400
Message-ID: <5201670F.7000708@suse.com>
References: <20130806001216.080404663@suse.com> <20130806001314.727159902@suse.com> <20130806204608.GB11383@quack.suse.cz> <5201663E.5030600@suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="Jl0WOE3od5AwEvwDqBOts5LDjWhATFmIN"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5201663E.5030600@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: reiserfs-devel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Jl0WOE3od5AwEvwDqBOts5LDjWhATFmIN
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 8/6/13 5:10 PM, Jeff Mahoney wrote:
> On 8/6/13 4:46 PM, Jan Kara wrote:
>> On Mon 05-08-13 20:12:17, Jeff Mahoney wrote:
>>> The reiserfs write lock replaced the BKL and uses similar semantics.
>>>
>>> Frederic's locking code makes a distinction between when the lock is =
nested
>>> and when it's being acquired/released, but I don't think that's the r=
ight
>>> distinction to make.
>>>
>>> The right distinction is between the lock being released at end-of-us=
e and
>>> the lock being released for a schedule. The unlock should return the =
depth
>>> and the lock should restore it, rather than the other way around as i=
t is now.
>>>
>>> This patch implements that and adds a number of places where the lock=

>>> should be dropped.
>> ...
>>
>>> --- a/fs/reiserfs/reiserfs.h	2013-08-05 20:08:59.258412220 -0400
>>> +++ b/fs/reiserfs/reiserfs.h	2013-08-05 20:09:52.537601042 -0400
>>> @@ -630,8 +630,8 @@ static inline int __reiserfs_is_journal_
>>>   */
>>>  void reiserfs_write_lock(struct super_block *s);
>>>  void reiserfs_write_unlock(struct super_block *s);
>>> -int reiserfs_write_lock_once(struct super_block *s);
>>> -void reiserfs_write_unlock_once(struct super_block *s, int lock_dept=
h);
>>> +int __must_check reiserfs_write_unlock_nested(struct super_block *s)=
;
>>> +void reiserfs_write_lock_nested(struct super_block *s, int depth);
>>> =20
>>>  #ifdef CONFIG_REISERFS_CHECK
>>>  void reiserfs_lock_check_recursive(struct super_block *s);
>>> @@ -666,45 +666,54 @@ static inline void reiserfs_lock_check_r
>>>   * - The journal lock
>>>   * - The inode mutex
>>>   */
>>> -static inline void reiserfs_mutex_lock_safe(struct mutex *m,
>>> -			       struct super_block *s)
>>> +
>>> +#define reiserfs_safe(sb, action)			\
>>> +do {							\
>>> +	struct super_block *__sb =3D (sb);		\
>>> +	int __depth;					\
>>> +	__depth =3D reiserfs_write_unlock_nested(__sb);	\
>>> +	(action);					\
>>> +	reiserfs_write_lock_nested(__sb, __depth);	\
>>> +} while(0)
>>> +
>>> +#define reiserfs_mutex_lock_safe(mtx, s) reiserfs_safe(s, mutex_lock=
(mtx))
>>> +#define reiserfs_mutex_lock_nested_safe(mtx, subclass, s) \
>>> +	reiserfs_safe(s, mutex_lock_nested(mtx, subclass))
>>> +#define reiserfs_down_read_safe(sem, s) reiserfs_safe(s, down_read(s=
em))
>>> +
>>> +/*
>>> + * When we schedule, we usually want to also release the write lock,=

>>> + * according to the previous bkl based locking scheme of reiserfs.
>>> + */
>>> +static inline void reiserfs_cond_resched(struct super_block *s)
>>>  {
>>> -	reiserfs_lock_check_recursive(s);
>>> -	reiserfs_write_unlock(s);
>>> -	mutex_lock(m);
>>> -	reiserfs_write_lock(s);
>>> +	if (need_resched())
>>> +		reiserfs_safe(s, schedule());
>>>  }
>>> =20
>>> -static inline void
>>> -reiserfs_mutex_lock_nested_safe(struct mutex *m, unsigned int subcla=
ss,
>>> -			       struct super_block *s)
>>> +static inline struct buffer_head *
>>> +reiserfs_safe_sb_bread(struct super_block *s, sector_t block)
>>>  {
>>> -	reiserfs_lock_check_recursive(s);
>>> -	reiserfs_write_unlock(s);
>>> -	mutex_lock_nested(m, subclass);
>>> -	reiserfs_write_lock(s);
>>> +	int depth;
>>> +	struct buffer_head *bh;
>>> +
>>> +	depth =3D reiserfs_write_unlock_nested(s);
>>> +	bh =3D sb_bread(s, block);
>>> +	reiserfs_write_lock_nested(s, depth);
>>> +
>>> +	return bh;
>>>  }
>>>
>>> +void reiserfs_safe_lock_buffer(struct buffer_head *bh);
>>> +
>>>  static inline void
>>> -reiserfs_down_read_safe(struct rw_semaphore *sem, struct super_block=
 *s)
>>> +reiserfs_safe_wait_on_buffer(struct buffer_head *bh, struct super_bl=
ock *s)
>>>  {
>>> -	reiserfs_lock_check_recursive(s);
>>> -	reiserfs_write_unlock(s);
>>> -	down_read(sem);
>>> -	reiserfs_write_lock(s);
>>> -}
>>> +	int depth;
>>> =20
>>> -/*
>>> - * When we schedule, we usually want to also release the write lock,=

>>> - * according to the previous bkl based locking scheme of reiserfs.
>>> - */
>>> -static inline void reiserfs_cond_resched(struct super_block *s)
>>> -{
>>> -	if (need_resched()) {
>>> -		reiserfs_write_unlock(s);
>>> -		schedule();
>>> -		reiserfs_write_lock(s);
>>> -	}
>>> +	depth =3D reiserfs_write_unlock_nested(s);
>>> +	__wait_on_buffer(bh);
>>> +	reiserfs_write_lock_nested(s, depth);
>>>  }
>>> =20
>>>  struct fid;
>>> @@ -2463,6 +2472,15 @@ int reiserfs_commit_for_inode(struct ino
>>>  int reiserfs_inode_needs_commit(struct inode *);
>>>  void reiserfs_update_inode_transaction(struct inode *);
>>>  void reiserfs_wait_on_write_block(struct super_block *s);
>>> +static inline void reiserfs_safe_wait_on_write_block(struct super_bl=
ock *s)
>>> +{
>>> +	int depth;
>>> +
>>> +	depth =3D reiserfs_write_unlock_nested(s);
>>> +	reiserfs_wait_on_write_block(s);
>>> +	reiserfs_write_lock_nested(s, depth);
>>> +}
>>> +
>>   I didn't find where the above 'safe' functions are called...
>=20
> Whoa. WTF. Thanks for the review. These aren't the same patches as the
> ones in my repo. No idea why these got sent instead of the right ones!

Actually, they are. The end result is right but the reiserfs_safe()
macro was an idea I had and then decided against it. It shouldn't be in
the final version. I must've accidentally merged the removal in the
wrong patch.

-Jeff


--=20
Jeff Mahoney
SUSE Labs


--Jl0WOE3od5AwEvwDqBOts5LDjWhATFmIN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)

iQIcBAEBAgAGBQJSAWcPAAoJEB57S2MheeWyUcsP/A6z6dISDc0jMOA3pzqiBytA
27yk5Jrazncn2CIWIlfoARagAe8nrRw90dwWWBxfpeCF+E73ktEOk+HKRameGTj+
/Fr1gLEl1DYtDeu+IOZ69Wmv7A372Wqslaf4pjs9CilTqC3ojvSFM7rANN5qZrqR
kN2kPXzLFwHgccIM6s/9L8oAJgQGeVQROCASNEgpRcim7K8SYfU6cMr5lUOncun+
5iuFzaxmBb1GJAsCCAPxeK3sUVwcm+IVKkHuloYfU4UFWGP5htnWr74GvGeemPVL
Sf3ndq5Ph6SXfHm0BI158F4AzfRPVtRd2R/wjYsbrFRCVRY3gqv9vjeG1K7kLMLz
Ey1c8/Azm9ZQYHo5c7XbFSUzBsGZ0b75yIepjYVyif19gkNqj5SJF3RnZgUXCUkI
CVoG8kbczuyK/u5jzrkyMruQygrBeZE4PRmgI6iybjn+OI/JnKlFQgWtG6FF8xtN
5vjJFjlMMUtX9r6ChEprvRvs4SgKuwKIUvpoPAnyojQJSaeRWE7+oHSmVJjiMgFl
Trt+jTCGlv6+0n4Gp5VIY66u5AEb0KUo+Gvh/07pmuc4DMd6Xta/fxhurF/Pian7
5gUNS+bPLZwkiY8TnoqKo5asCdklkpe0SL99DTjtZjErbxJfXpLDKLbJM4V3IMsm
ZK4MQrPMtLn5LgCgUnRw
=QtpR
-----END PGP SIGNATURE-----

--Jl0WOE3od5AwEvwDqBOts5LDjWhATFmIN--
