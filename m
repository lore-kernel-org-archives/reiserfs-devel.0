From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: warning: Invalid hash for xattr (system.posix_acl_access) associated
 with [1070 1541 0x0 SD] after extending device
Date: Sun, 21 Nov 2004 12:31:05 -0500
Message-ID: <41A0D0D9.70306@suse.com>
References: <200411171931.52943.js@jetsys.de> <419BCCCB.40103@novell.com> <200411210905.36202.js@jetsys.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22469-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200411210905.36202.js@jetsys.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?J=F6rg_Spilker?= <js@jetsys.de>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

J=F6rg Spilker wrote:
| Am Mittwoch, 17. November 2004 23:12 schrieben Sie:
|
| Hello Jeff,
|
|
|>You can use debugreiserfs to track down the file with that key by using
|>debugreiserfs -d <device> and looking for the objectid. Once you find
|>the directory listing with that key, you should be able to find the file.
|>
|>When you've located the filename, a setfattr -x system.posix_acl_access
|><file> followed by the appropriate setfacl command will reset the ACL.
|
|
| thanks for your help. I could fix the problem using debugreiserfs

Great!

| btw: your email is bouncing (unknown user).

Yeah, it seems that my @novell.com address has been a black hole for the
past few days. Hopefully it will be fixed soon.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBoNDZLPWxlyuTD7IRAhxEAJ44ZkvDQTlBkJ91DNPIYBlE1qARLgCcC3yy
hafHa02Cn1GtoxCrvUndHGE=3D
=3D5gv3
-----END PGP SIGNATURE-----
