From: =?iso-8859-1?q?J=F6rg_Spilker?= <js@jetsys.de>
Subject: warning: Invalid hash for xattr (system.posix_acl_access) associated with [1070 1541 0x0 SD] after extending device
Date: Wed, 17 Nov 2004 19:31:49 +0100
Message-ID: <200411171931.52943.js@jetsys.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22399-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hello,

i recently extended a LVM device and also resized the reiserfs. Now i find=
=20
lots of messages like this in my log:

Nov 17 04:08:59 lotus kernel: ReiserFS: dm-5: warning: Invalid hash for xat=
tr=20
(system.posix_acl_access) associated with [1070 1541 0x0 SD]
Nov 17 04:08:59 lotus kernel: ReiserFS: dm-5: warning: Invalid hash for xat=
tr=20
(system.posix_acl_access) associated with [1070 1541 0x0 SD]

they don't seem to cause any harm. reiserfsck doesn't report any errors. Ca=
n i=20
fix the problem without reformatting the whole device?

Kernel is the original kernel from SuSE 9.2 (with all available patches=20
2.6.8-24.3) and the reiserfs tools coming with the distribution.

Greetings, J=F6rg
