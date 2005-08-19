From: Adam McLellan <alphanos@gmail.com>
Subject: Error in reiserfsck 3.6.19
Date: Fri, 19 Aug 2005 04:14:55 -0400
Message-ID: <b73471a5050819011424c46437@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25568-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Unless I'm doing something wrong, there is an error in reiserfsck
3.6.19.  It's actually kind of a humourous error; it doesn't divide
correctly :-).  I've been going through a somewhat lengthly process to
diagnose the problem with my reiserfs filesystem, and finally got to
the point where I'm ready to rebuild the superblock.  Here's the
output:


=3D=3D> root@0[knoppix]# reiserfsck --rebuild-sb /dev/md0
=3D=3D> reiserfsck 3.6.19 (2003 www.namesys.com)
=3D=3D>=20
=3D=3D> *************************************************************
=3D=3D> ** If you are using the latest reiserfsprogs and  it fails **
=3D=3D> ** please  email bug reports to reiserfs-list@namesys.com, **
=3D=3D> ** providing  as  much  information  as  possible --  your **
=3D=3D> ** hardware,  kernel,  patches,  settings,  all reiserfsck **
=3D=3D> ** messages  (including version),  the reiserfsck logfile, **
=3D=3D> ** check  the  syslog file  for  any  related information. **
=3D=3D> ** If you would like advice on using this program, support **
=3D=3D> ** is available  for $25 at  www.namesys.com/support.html. **
=3D=3D> *************************************************************
=3D=3D>=20
=3D=3D> Will check superblock and rebuild it if needed
=3D=3D> Will put log info to 'stdout'
=3D=3D>=20
=3D=3D> Do you want to run this program?[N/Yes] (note need to type Yes if
you do):Yes
=3D=3D>=20
=3D=3D> reiserfs_open: the reiserfs superblock cannot be found on /dev/md0.
=3D=3D>=20
=3D=3D> what the version of ReiserFS do you use[1-4]
=3D=3D>         (1)   3.6.x
=3D=3D>         (2) >=3D3.5.9 (introduced in the middle of 1999) (if you us=
e
linux 2.2, choose
=3D=3D> this one)
=3D=3D>         (3) < 3.5.9 converted to new format (don't choose if unsure=
)
=3D=3D>         (4) < 3.5.9 (this is very old format, don't choose if unsur=
e)
=3D=3D>         (X)   exit
=3D=3D> 1
=3D=3D>=20
=3D=3D> Enter block size [4096]:
=3D=3D> 16384
=3D=3D> rebuild_sb: wrong block size specified, only divisible by 1024 are
supported
=3D=3D> currently
=3D=3D>=20
=3D=3D> root@0[knoppix]#

So far as I know, 1024 * 16 =3D 16384.  I'm currently running on a
Knoppix 3.9 CD, using the included reiserfsprogs package.  It uses the
2.6.11 linux kernel.  My system doesn't have any stability issues that
should cause it to divide incorrectly :-).  Since this appears to be
an interface error rather than an operation error, I don't think my
kernel modules are relevant, but a log of sorts listing all of the
steps I've taken to diagnose my problems since they started can be
found at http://forums.gentoo.org/viewtopic-t-371570.html.  It
contains a lot of information about my current setup, but much of the
early text refers to attempts to check for hardware problems and to
fix a software raid problem.

If/when I can get past this error message, I hope I am correct in
assuming the the program shouldn't have any trouble actually
performing the superblock rebuild with a block size of 16384?  I've
been running this filesystem for two years with that block size, and
am not ready to give up the data on it just yet :-).

Thanks for any help with this problem, and also for the wonderul file
system :-).
Alphanos
