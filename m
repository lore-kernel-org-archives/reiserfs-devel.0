From: luc <xxlucas@seznam.cz>
Subject: reiser4 grub patch
Date: Fri, 3 Feb 2006 12:37:06 +0100
Message-ID: <200602031237.06515.xxlucas@seznam.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27995-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi,

i have a big trouble with the grub with reiser4 patch. Look here:

=2E/install.sh:

grub> root (hd0,0)
=A0Filesystem type is ext2fs, partition type 0x83
grub> setup (hd0)
=A0Checking if "/boot/grub/stage1" exists... yes
=A0Checking if "/boot/grub/stage2" exists... yes
=A0Checking if "/boot/grub/e2fs_stage1_5" exists... yes
=A0Running "embed /boot/grub/e2fs_stage1_5 (hd0)"... =A015 sectors are=20
embedded.
succeeded
=A0Running "install /boot/grub/stage1 (hd0) (hd0)1+15 p=20
(hd0,0)/boot/grub/stage /boot/grub/menu.lst"... failed
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 should be=20
stage2 =A0^^^^^^


without reiser4 patch works perfectly


=2D-=20
luc
Linux 2.6.12-15mdk-i686-up-4GB Intel(R) Pentium(R) M processor 2.00GHz
