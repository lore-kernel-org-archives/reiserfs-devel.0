From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: bad superblock
Date: Mon, 27 Sep 2004 09:55:57 +0200
Message-ID: <200409270955.57476.christian.mayrhuber@gmx.net>
References: <20040926155456.M25300@fh-furtwangen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21933-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040926155456.M25300@fh-furtwangen.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael.Diederich@fh-furtwangen.de, reiserfs-list@namesys.com


I guess namesys can help you, debug your filesystem/restore your data
but it looks like your harddisk is dying. For hardware errors they=20
charge $50/hour. See http://www.namesys.com/support.html
Good Luck!

On Sunday 26 September 2004 19:11, Diederich Michael WIB wrote:
> Hello!  =20
>   =20
> I am writing to you, because reiserfsck has not solved my problem.  =20
>   =20
> I tryed to boot normaly, but it stopped after hdparm and starting postfix=
=2E I  =20
> booted knoppix and tryed to mount my reiserfs partition. Doesn't work.  =
=20
>   =20
> I used reiserfschk:  =20
>   =20
> root@ttyp0[/]# reiserfsck --rebuild-sb /dev/hda3  =20
> reiserfsck 3.6.18 (2003 www.namesys.com)  =20
>   =20
> *************************************************************  =20
> ** If you are using the latest reiserfsprogs and  it fails **  =20
> ** please  email bug reports to reiserfs-list@namesys.com, **  =20
> ** providing  as  much  information  as  possible --  your **  =20
> ** hardware,  kernel,  patches,  settings,  all reiserfsck **  =20
> ** messages  (including version),  the reiserfsck logfile, **  =20
> ** check  the  syslog file  for  any  related information. **  =20
> ** If you would like advice on using this program, support **  =20
> ** is available  for $25 at  www.namesys.com/support.html. **  =20
> *************************************************************  =20
>   =20
> Will check superblock and rebuild it if needed  =20
> Will put log info to 'stdout'  =20
>   =20
> Do you want to run this program?[N/Yes] (note need to type Yes if you=20
do):Yes  =20
> bread: Cannot read the block (2): (Invalid argument).  =20
> reiserfs_open: bread failed reading block 2  =20
> bread: Cannot read the block (16): (Invalid argument).  =20
> reiserfs_open: bread failed reading block 16  =20
>   =20
> reiserfs_open: the reiserfs superblock cannot be found on /dev/hda3.  =20
>   =20
> what the version of ReiserFS do you use[1-4]  =20
>         (1)   3.6.x  =20
>         (2) >=3D3.5.9 (introduced in the middle of 1999) (if you use linu=
x=20
2.2,  =20
> choose this one)  =20
>         (3) < 3.5.9 converted to new format (don't choose if unsure)  =20
>         (4) < 3.5.9 (this is very old format, don't choose if unsure)  =20
>         (X)   exit  =20
> 1  =20
>   =20
> Enter block size [4096]:  =20
> 4096  =20
> reiserfs_create: can not create that small (0 blocks) filesystem  =20
>   =20
> I am sure, that hda3 is a reiserfs:  =20
>   =20
> output of cfdisk:  =20
>   =20
> ------------------------------------------------------------------------ =
 =20
>  hda1              Prim=E4re   Linux ext3                          41,13 =
 =20
>  hda2              Prim=E4re   Linux swap                         518,20 =
 =20
>  hda3              Prim=E4re   Linux ReiserFS                   19444,57 =
 =20
>   =20
> With "badblocks" i got a list of 17 badblocks:  =20
>   =20
> 104031366/ 19535040  =20
> 104031448/ 19535040  =20
> 10403145  =20
> 10403146  =20
> 10403147  =20
> 104031488/ 19535040  =20
> 10403149  =20
> 10403150  =20
> 10403151  =20
> 10403152  =20
> 10403153  =20
> 10403154  =20
> 10403155  =20
> 104031566/ 19535040  =20
> 104031577/ 19535040  =20
> 104031588/ 19535040  =20
> 104031599/ 19535040  =20
>   =20
> I guess, the superblock is at this part of the harddisk.   =20
> =20
> The harddisk is hda: TOSHIBA MK2018GAP, ATA DISK drive, on the harddisk i=
=20
use=20
> reiserfsprogs 3.6.18; I was using the mm-sources 2.6.8.1 with a ssuspend2=
=20
> patch for resuming my notebook. When you need more infos, i hope i can gi=
ve=20
> you them. When you have any ideas for rescueing the data files, i would l=
ike=20
> to get a message!=20
> =20
> Thanks in advance and keep up the good working!=20
>   =20
> --  =20
> Michael Diederich  =20
> Student der Wirtschaftsinformatik Bachelor  =20
> FH Furtwangen, Deutschland=20
> =20
>=20

=2D-=20
lg, Chris
http://wwwkeys.eu.pgp.net/
http://wwwkeys.pgp.net/
