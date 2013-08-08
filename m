From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch v3 2/3] reiserfs: locking, handle nested locks properly
Date: Thu, 08 Aug 2013 17:30:15 -0400
Message-ID: <52040DE7.70805@suse.com>
References: <20130807163515.986450231@suse.com> <20130807163550.503788994@suse.com> <20130807202537.GF26516@quack.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="PF0nEva2e24X7JS054BkCisThnwinoM76"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20130807202537.GF26516@quack.suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: reiserfs-devel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PF0nEva2e24X7JS054BkCisThnwinoM76
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 8/7/13 4:25 PM, Jan Kara wrote:
> On Wed 07-08-13 12:35:17, Jeff Mahoney wrote:
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
>>
>> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
>> ---
>>
>>  fs/reiserfs/bitmap.c   |    5 +-
>>  fs/reiserfs/dir.c      |    7 +--
>>  fs/reiserfs/fix_node.c |   26 ++++++------
>>  fs/reiserfs/inode.c    |   77 ++++++++++++++++--------------------
>>  fs/reiserfs/ioctl.c    |    7 +--
>>  fs/reiserfs/journal.c  |  104 ++++++++++++++++++++++++++-------------=
----------
>>  fs/reiserfs/lock.c     |   43 ++++++++++----------
>>  fs/reiserfs/namei.c    |   24 +++--------
>>  fs/reiserfs/prints.c   |    5 +-
>>  fs/reiserfs/reiserfs.h |   36 +++++++++-------
>>  fs/reiserfs/resize.c   |   10 +++-
>>  fs/reiserfs/stree.c    |   16 +++----
>>  fs/reiserfs/super.c    |    5 --
>>  13 files changed, 188 insertions(+), 177 deletions(-)
>>
>   Just one smaller comment below, otherwise the patch looks good.
>=20
>> --- a/fs/reiserfs/stree.c	2013-08-07 10:23:30.205643392 -0400
>> +++ b/fs/reiserfs/stree.c	2013-08-07 10:23:34.037585247 -0400
>> @@ -550,7 +550,8 @@ static bool search_by_key_reada(struct s
>>  		 */
>>  		if (!buffer_uptodate(bh[j])) {
>>  			if (!unlocked) {
>> -				reiserfs_write_unlock(s);
>> +				int depth =3D -1; /* avoiding __must_check */
>> +				depth =3D reiserfs_write_unlock_nested(s);
>>  				unlocked =3D true;
>>  			}
>>  			ll_rw_block(READA, 1, bh + j);
>   This is ugly. It shouldn't be too hard to either modify
> search_by_key_reada() to return lock depth or wrap more from the callsi=
te
> of search_by_key_reada() into the function so that it always returns wi=
th
> write lock locked...

Ok, I'll return lock depth instead. Dropping the lock is an operation
that may happen but doesn't always happen. Pulling more in (or pushing
it out) won't affect the complexity there.

-Jeff

>> @@ -625,7 +626,7 @@ int search_by_key(struct super_block *sb
>>  	block_number =3D SB_ROOT_BLOCK(sb);
>>  	expected_level =3D -1;
>>  	while (1) {
>> -
>> +		int depth;
>>  #ifdef CONFIG_REISERFS_CHECK
>>  		if (!(++repeat_counter % 50000))
>>  			reiserfs_warning(sb, "PAP-5100",
>> @@ -646,25 +647,26 @@ int search_by_key(struct super_block *sb
>>  		if ((bh =3D last_element->pe_buffer =3D
>>  		     sb_getblk(sb, block_number))) {
>>  			bool unlocked =3D false;
>> -
>> +			depth =3D REISERFS_SB(sb)->lock_depth;
>>  			if (!buffer_uptodate(bh) && reada_count > 1)
>>  				/* may unlock the write lock */
>>  				unlocked =3D search_by_key_reada(sb, reada_bh,
>>  						    reada_blocks, reada_count);
>> +
>>  			/*
>>  			 * If we haven't already unlocked the write lock,
>>  			 * then we need to do that here before reading
>>  			 * the current block
>>  			 */
>>  			if (!buffer_uptodate(bh) && !unlocked) {
>> -				reiserfs_write_unlock(sb);
>> +				depth =3D reiserfs_write_unlock_nested(sb);
>>  				unlocked =3D true;
>>  			}
>>  			ll_rw_block(READ, 1, &bh);
>>  			wait_on_buffer(bh);
>> =20
>>  			if (unlocked)
>> -				reiserfs_write_lock(sb);
>> +				reiserfs_write_lock_nested(sb, depth);
>>  			if (!buffer_uptodate(bh))
>>  				goto io_error;
>>  		} else {
>=20
> 								Honza
>=20


--=20
Jeff Mahoney
SUSE Labs


--PF0nEva2e24X7JS054BkCisThnwinoM76
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)

iQIcBAEBAgAGBQJSBA3qAAoJEB57S2MheeWyzGcQAJNVZDV0jaCkccYUyvsXH3V1
67M7QjXDeSNQ8M8SThkTQ1JwFtNldMYbJK2qulVhfE7xyNF15PbQv+wERzrQORN4
e6zAPqPIrJtIP9O+nRVYNN0cfhZhVK5YOzw9P1GMRt5QTqTWghNmJ2qrv5qW8oOj
+EGhBOMgqoyv7KzMMTpRv3Fz6t/AJQeXww1rIX5eAvEWcmX038XM3cv5oNJrleS3
59jw0x38IAxWyOGVPWVhd/8/ygqPR1wY/MLUxgbo2RzXJXykjBmCkF+I0X/2mXOq
sgDk0BGb0CFIbfHJOMwGd6OlWZ2bV0iBUCKNdGpBHnkmBnOLabpKbvLhdm8mBwZn
iWsXYUBd37KjQRJP3ASpf1qFjCv/AgkVeZ6WBVoK0/6q/VcPacAQh5W309VMyEZC
nuK/HvH0mbZqWTcq54Se106jusnX5Sr7Ts3iPenwcXUPht/08vydnS4W9lY2RXj9
0q4ScD0t19VX7UE2ftCO9AKm5F36ftrSK3Fls2Fu82zkf9bB+px629h9WQj6G6RA
IE3o8em3rudhmIbV6VOJAlxVUe8+uaybFYnMuhMt+1SEkn7L26aZCUNoVewC6iaN
B2EXYcdwBPzzQhiomYhpQoy3fOPuDHUK+EEeljqJdZi2nEj1KAvNmrGK9E/svLaO
VlbQoSKPhOn+Nx9Cfu80
=pDDK
-----END PGP SIGNATURE-----

--PF0nEva2e24X7JS054BkCisThnwinoM76--
