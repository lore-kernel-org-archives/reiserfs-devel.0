From: "Diaz Rodriguez, Eduardo" <ediaz@pk25.com>
Subject: Conversion from v3.6 to v4 of Reiserfs...
Date: Tue, 24 Feb 2004 18:30:22 +0100
Message-ID: <20040224172153.M90659@pk25.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16908-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: reiserfs-list@namesys.com

Sorry for the question from a newbie but I can'f find the answer and I find=
 in
google maillist and may sites...

I recently upgrade from 2.4.20 kernel to 2.6.3 kernel my debian testing.

I see in logs that my lvm system are using version 3.6 of resiser fs.

Feb 23 21:57:12 servidor1 kernel: found reiserfs format "3.6" with standard
journal
Feb 23 21:57:12 servidor1 kernel: Reiserfs journal params: device dm-0, size
8192, journal first block 18, max trans len 1024, max batch 900, max commit
age 30, max trans age 30
Feb 23 21:57:12 servidor1 kernel: reiserfs: checking transaction log (dm-0)
for (dm-0)
Feb 23 21:57:12 servidor1 kernel: reiserfs: replayed 23 transactions in 1 s=
econds
Feb 23 21:57:12 servidor1 kernel: Using r5 hash to sort names


I want use new version v4 but I don't want to lost my data. are there any f=
orm
to convert my fs to a new version v4??? This files are not critical for the
system, only data..

Thanks for the time and for reiserfs...

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Una part=EDcula que vuela ... buscar=E1 el ojo mas pr=F3ximo ...
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

