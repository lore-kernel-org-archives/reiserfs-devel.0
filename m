From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: fix spurious multiple-fill in reiserfs_readdir_dentry
Date: Fri, 31 May 2013 16:34:19 -0400
Message-ID: <51A9094B.9070509@suse.com>
References: <51A8F508.30100@jeffreymahoney.com> <20130531193121.GA21744@quack.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2FUCCJECLPDQDBAMPWNIJ"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20130531193121.GA21744@quack.suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2FUCCJECLPDQDBAMPWNIJ
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 5/31/13 3:31 PM, Jan Kara wrote:
> On Fri 31-05-13 15:07:52, Jeff Mahoney wrote:
>> After sleeping for filldir(), we check to see if the file system has
>> changed and research. The next_pos pointer is updated but its value
>> isn't pushed into the key used for the search itself. As a result,
>> the search returns the same item that the last cycle of the loop did
>> and filldir() is called multiple times with the same data.
>>
>> The end result is that the buffer can contain the same name multiple
>> times. This can be returned to userspace or used internally in the
>> xattr code where it can manifest with the following warning:
>>
>> jdm-20004 reiserfs_delete_xattrs: Couldn't delete all xattrs (-2)
>>
>> reiserfs_for_each_xattr uses reiserfs_readdir_dentry to iterate over
>> the xattr names and ends up trying to unlink the same name twice. The
>> second attempt fails with -ENOENT and the error is returned. At some
>> point I'll need to add support into reiserfsck to remove the orphaned
>> directories left behind when this occurs.
>>
>> The fix is to push the value into the key before researching.
>   The patch looks good. I've added it to my tree.

Thanks, Jan.

I have a few other fixes that we've had in SLE11 for a while that should
probably make it into the next release as well.

I've published them at:
git://jeffreymahoney.com/linux/linux-upstream reiserfs-for-3.10

There are 3 patches, HEAD is 7c769dbb (reiserfs: fix problems with
chowning setuid file w/ xattrs)

It includes this fix.

-Jeff

>=20
> 								Honza
>>
>> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
>> ---
>>  fs/reiserfs/dir.c |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> --- a/fs/reiserfs/dir.c	2013-05-31 14:29:35.945840685 -0400
>> +++ b/fs/reiserfs/dir.c	2013-05-31 14:30:05.473952112 -0400
>> @@ -204,6 +204,8 @@ int reiserfs_readdir_dentry(struct dentr
>>  				next_pos =3D deh_offset(deh) + 1;
>> =20
>>  				if (item_moved(&tmp_ih, &path_to_entry)) {
>> +					set_cpu_key_k_offset(&pos_key,
>> +							     next_pos);
>>  					goto research;
>>  				}
>>  			}	/* for */
>>
>>
>> --=20
>> Jeff Mahoney


--=20
Jeff Mahoney
SUSE Labs


------enig2FUCCJECLPDQDBAMPWNIJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)

iQIcBAEBAgAGBQJRqQlOAAoJEB57S2MheeWyD18P/3urzWR7WgkPAkm6HqyAEJZ+
H/R0ZcZumQmTBVifF8JX9QyGrWksSZv1mdJdHK/umYWHZaV+/uuNsEs30/Doyx8p
16CDwGLdEi3i1JAMJcIC3zPEss9NCFrLxk7fdoNKZddbQ8Pphrf7j1B4YPXczLZ5
bu3fhj9TbHaDx1onJYHXWmg74p2LcAB+iyFbjOSiTMfIo+7UeHux68RF3VNZ3zDy
2IQkF83ob5VJAP+UYBDQcKvSYjD3Js/sjR6zOqLqNsx3OG9OFvr1NC5//hblaWQl
xjRbAKAlhTrHG9YNzkd9dywPOPAom0ppsEE18lKAvFynYjGb/IB9NqeP55lVq1BU
f2sanSxJnbIC8H9ji4EikKWJVOoFfmhLPv92tHHZ4pmPzjML43GKC10QFCGNXABF
NF/qgTTAN/mQZvPy1gauw2Tt/Uc/F/6mGnDtex7jhcfJX/AA3j4JxL1dnneHxAY0
JbEjGXUvgxe60166Df4mJf3wN3JSHrX20C9jTykmBYJw3dT0TCucen5Q90BxFoZN
BOiWXt6hwNrs4CFgqYwa3W4NhlSj1cavLS+2Nu/ToNuwQpOHi47Eybvw9vgl8Mjn
6kdgOh2TMPo3tYsNhFLLg01NYnmu0WMgHAxac4CQbkS0Ip5eqrxXDeQ0QJyEl2vp
HQgZARlmO7OJ0KXfU5Ce
=gaYx
-----END PGP SIGNATURE-----

------enig2FUCCJECLPDQDBAMPWNIJ--
