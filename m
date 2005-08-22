From: =?ISO-8859-1?Q?Xu=E2n_Baldauf?=
 <xuan--2005.08.22--reiserfs-list--namesys.com@baldauf.org>
Subject: REISERFS_MAX_NAME and ENAMETOOLONG
Date: Mon, 22 Aug 2005 11:42:44 +0200
Message-ID: <43099E14.7060902@baldauf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25602-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

when downloading something from java.sun.com (e.g.=20
http://javashoplm.sun.com/ECom/docs/Welcome.jsp?StoreId=3D22&PartDetailId=
=3Djdk-1.5.0-doc-oth-JPR&SiteId=3DJSC&TransactionId=3Dnoreg=20
), very long URLs are encountered. When trying to download using "wget",=20
wget tries to open a file with those long filenames, and fails with=20
ENAMETOOLONG (File name too long).

I think that the limit is due to the REISERFS_MAX_NAME macro=20
(http://lxr.linux.no/source/include/linux/reiserfs_fs.h?v=3D2.6.10#L1107), =

which currently resolves to "255" (which supposedly means 255 bytes).

Is it safe to change REISERFS_MAX_NAME to something larger, or does this=20
change the disk layout in an unexpected or incompatible way?

Thanks,

Xu=E2n Baldauf.

