From: Adam McLellan <alphanos@gmail.com>
Subject: Re: Error in reiserfsck 3.6.19
Date: Fri, 19 Aug 2005 14:00:32 -0400
Message-ID: <b73471a505081911006acb4c59@mail.gmail.com>
References: <b73471a5050819011424c46437@mail.gmail.com>
	 <200508191857.42370.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25576-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200508191857.42370.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

On 8/19/05, Vitaly Fertman <vitaly@namesys.com> wrote:
> On Friday 19 August 2005 12:14, Adam McLellan wrote:
> > Unless I'm doing something wrong, there is an error in reiserfsck
> > 3.6.19.  It's actually kind of a humourous error; it doesn't divide
> > correctly :-).  I've been going through a somewhat lengthly process to
> > diagnose the problem with my reiserfs filesystem, and finally got to
> > the point where I'm ready to rebuild the superblock.  Here's the
> > output:
> >
> >
> > =3D=3D> root@0[knoppix]# reiserfsck --rebuild-sb /dev/md0
> > =3D=3D> reiserfsck 3.6.19 (2003 www.namesys.com)
> > =3D=3D>
> > =3D=3D> *************************************************************
> > =3D=3D> ** If you are using the latest reiserfsprogs and  it fails **
> > =3D=3D> ** please  email bug reports to reiserfs-list@namesys.com, **
> > =3D=3D> ** providing  as  much  information  as  possible --  your **
> > =3D=3D> ** hardware,  kernel,  patches,  settings,  all reiserfsck **
> > =3D=3D> ** messages  (including version),  the reiserfsck logfile, **
> > =3D=3D> ** check  the  syslog file  for  any  related information. **
> > =3D=3D> ** If you would like advice on using this program, support **
> > =3D=3D> ** is available  for $25 at  www.namesys.com/support.html. **
> > =3D=3D> *************************************************************
> > =3D=3D>
> > =3D=3D> Will check superblock and rebuild it if needed
> > =3D=3D> Will put log info to 'stdout'
> > =3D=3D>
> > =3D=3D> Do you want to run this program?[N/Yes] (note need to type Yes =
if
> > you do):Yes
> > =3D=3D>
> > =3D=3D> reiserfs_open: the reiserfs superblock cannot be found on /dev/=
md0.
> > =3D=3D>
> > =3D=3D> what the version of ReiserFS do you use[1-4]
> > =3D=3D>         (1)   3.6.x
> > =3D=3D>         (2) >=3D3.5.9 (introduced in the middle of 1999) (if yo=
u use
> > linux 2.2, choose
> > =3D=3D> this one)
> > =3D=3D>         (3) < 3.5.9 converted to new format (don't choose if un=
sure)
> > =3D=3D>         (4) < 3.5.9 (this is very old format, don't choose if u=
nsure)
> > =3D=3D>         (X)   exit
> > =3D=3D> 1
> > =3D=3D>
> > =3D=3D> Enter block size [4096]:
> > =3D=3D> 16384
>=20
> blocksize cannot be larger than page size.
>=20
> > =3D=3D> rebuild_sb: wrong block size specified, only divisible by 1024 =
are
> > supported
> > =3D=3D> currently
>=20
> not clear message, within 512-8192 region.
>=20
> > =3D=3D>
> > =3D=3D> root@0[knoppix]#
> >
> > So far as I know, 1024 * 16 =3D 16384.  I'm currently running on a
> > Knoppix 3.9 CD, using the included reiserfsprogs package.  It uses the
> > 2.6.11 linux kernel.  My system doesn't have any stability issues that
> > should cause it to divide incorrectly :-).  Since this appears to be
> > an interface error rather than an operation error, I don't think my
> > kernel modules are relevant, but a log of sorts listing all of the
> > steps I've taken to diagnose my problems since they started can be
> > found at http://forums.gentoo.org/viewtopic-t-371570.html.  It
> > contains a lot of information about my current setup, but much of the
> > early text refers to attempts to check for hardware problems and to
> > fix a software raid problem.
> > If/when I can get past this error message, I hope I am correct in
> > assuming the the program shouldn't have any trouble actually
> > performing the superblock rebuild with a block size of 16384?
>=20
> you are right, it is not a problem for progs. however, recovery
> with the wrong blocksize will make more harm than good. if not
> sure about blocksize (or partition start), make a raw backup of the
> device (dd, dd_rescue) before rebuilding. then proceed with the
> wanted blocksize (512-8K, probably the default is the correct one)
> and rebuild the journal header if needed.
>=20
> > I've
> > been running this filesystem for two years with that block size, and
> > am not ready to give up the data on it just yet :-).
> > Thanks for any help with this problem, and also for the wonderul file
> > system :-).
> > Alphanos
> >
> >
>=20
> --
> Thanks,
> Vitaly Fertman
>=20

Thank you for the reply and clarification :).  When I first read your
message, I still thought that my block size was 16k, but I
investigated further and it appears as though this was due to a
combination of a corrupted journal, and misinterpreting the copies of
the superblock I found later on in the journal (thinking 00 10 meant
16(k), rather than 4096 with least significant byte first).  So it
turns out that if reiserfsck had worked last night the way I wanted it
to, I probably would have damaged a bunch of stuff.  Sorry for the
trouble :-).
Alphanos
