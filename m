From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: RE: Bad Sectors during log replay, help?
Date: Sat, 4 May 2002 00:09:55 +0200
Message-ID: <200205040009.55437.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10229-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dax Kelson <dax@gurulabs.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On Fri, 3 May 2002 04:49, Dax Kels wrote:
> On Fri, 3 May 2002, Will Stowe wrote:
>
> > Try turning off dma using hdparm -d 0 /dev/had, then try remounting
> >
> Thanks for replying (I really *love* ezmlm mailing lists, the latency is =

> great!).
>
> I wouldn't think that this would do anything as the drive has been in
> production for the last 12 months.

Then I point at your disk it is dead (the bad block/sector thing).
Do you hear noisy head seeking?

There is a bad sector tool flowting around or try "dd_rescue" from SuSE.

/home/nuetzel> dd_rescue -h

dd_rescue Version 1.02, garloff@suse.de, GNU GPL
 ($Id: dd_rescue.c,v 1.30 2001/07/24 12:08:10 garloff Exp $)
dd_rescue copies data from one file (or block device) to another
USAGE: dd_rescue [options] infile outfile
Options: -s ipos    start position in  input file (default=3D0),
         -S opos    start position in output file (def=3Dipos);
         -b softbs  block size for copy operation (def=3D16384),
         -B hardbs  fallback block size in case of errs (def=3D512);
         -e maxerr  exit after maxerr errors (def=3D0=3Dinfinite);
         -m maxxfer maximum amount of data to be transfered (def=3D0=3Dinf);
         -l logfile name of a file to log errors and summary to (def=3D"");
         -r         reverse direction copy (def=3Dforward);
         -t         truncate output file (def=3Dno);
         -w         abort on Write errors (def=3Dno);
         -a         spArse file writing (def=3Dno),
         -A         Always write blocks, zeroed if err (def=3Dno);
         -i         interactive: ask before overwriting data (def=3Dno);
         -f         force: skip some sanity checks (def=3Dno);
         -q         quiet operation,
         -v         verbose operation;
         -V         display version and exit;
         -h         display this help and exit.
Note: Sizes may be given in units b(=3D512), k(=3D1024), M(=3D1024^2) or G(=
1024^3)=20
bytes
This program is useful to rescue data in case of I/O errors, because
 it does not necessarily abort or truncate the output.

Copy your whole disk or partition to a new disk/partition (you can do it in=
=20
reverse mode "-r", too) and then let reiserfsck (latest version is 3.x.1b) =
do=20
it's work.
Maybe you need the latest 3.x.1c-pre3 version.

Good luck.
	Dieter

--=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel@hamburg.de
