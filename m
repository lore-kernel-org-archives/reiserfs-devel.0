From: Jeff Mahoney <jeffm@novell.com>
Subject: Re: warning: Invalid hash for xattr (system.posix_acl_access) associated
 with [1070 1541 0x0 SD] after extending device
Date: Wed, 17 Nov 2004 17:12:27 -0500
Message-ID: <419BCCCB.40103@novell.com>
References: <200411171931.52943.js@jetsys.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22401-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200411171931.52943.js@jetsys.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?J=F6rg_Spilker?= <js@jetsys.de>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

J=F6rg Spilker wrote:
| Hello,
|
| i recently extended a LVM device and also resized the reiserfs. Now i
find
| lots of messages like this in my log:
|
| Nov 17 04:08:59 lotus kernel: ReiserFS: dm-5: warning: Invalid hash
for xattr
| (system.posix_acl_access) associated with [1070 1541 0x0 SD]
| Nov 17 04:08:59 lotus kernel: ReiserFS: dm-5: warning: Invalid hash
for xattr
| (system.posix_acl_access) associated with [1070 1541 0x0 SD]
|
| they don't seem to cause any harm. reiserfsck doesn't report any
errors. Can i
| fix the problem without reformatting the whole device?
|
| Kernel is the original kernel from SuSE 9.2 (with all available patches
| 2.6.8-24.3) and the reiserfs tools coming with the distribution.
|
| Greetings, J=F6rg
|

It's definately fixable without reformatting.

When I designed the on-disk ACL/xattr format, I built in a magic number
and a checksum to catch things like corrupted entries wreaking havoc on
the system. That's what you're hitting.

Somehow, an entry wasn't fully written to disk or was corrupted somehow.
~ Whether it was part of the extending process or not, I couldn't tell you.

You can use debugreiserfs to track down the file with that key by using
debugreiserfs -d <device> and looking for the objectid. Once you find
the directory listing with that key, you should be able to find the file.

When you've located the filename, a setfattr -x system.posix_acl_access
<file> followed by the appropriate setfacl command will reset the ACL.

- -Jeff


- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBm8zLLPWxlyuTD7IRAss6AJ9ELG9BbPjgqF78dG5aXrgZ4MQpGQCeLZ7o
pmbxrva+nXv6MU3w0UQ1Y78=3D
=3Dwpwc
-----END PGP SIGNATURE-----
