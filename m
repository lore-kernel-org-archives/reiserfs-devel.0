From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Error  in compiling  application program  including reiserfs
  header files
Date: Wed, 15 Sep 2004 15:05:41 -0400
Message-ID: <41489285.7030808@suse.com>
References: <BAY16-DAV17lVrnoMUT0008bc02@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21788-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <BAY16-DAV17lVrnoMUT0008bc02@hotmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sachin Durge <sachindurge@hotmail.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Sachin Durge wrote:
| Hi All
| I  am  new  to  this list
| I  am  writting  a  user application .
| In my application i  have  included
|
| reiserfs_fs.h
| reiserfs_fs_sb.h
| reiserfs_fs_i.h
|
| It is giving  lots  of errors
| Any one has any clue

Including kernel headers in userspace programs is unsupported. There are
examples of userspace headers available in reiserfsprogs.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBSJKFLPWxlyuTD7IRAv6oAJ0Q16D+cpxH2FHXJnA6EMWFsOvmyACfUE2q
XZapVivGKe7AtKpjoao9omQ=
=3pst
-----END PGP SIGNATURE-----
