From: "Masthan, Dudekula (STSD)" <dudekula.masthan@hp.com>
Subject: BUG: reiserfsck --check fails exit status=6
Date: Mon, 19 Jun 2006 14:50:19 +0530
Message-ID: <4EEB5A4713E61F49A759A504BECCBC0A027682F1@bgeexc01.asiapacific.cpqcorp.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28814-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-dev@namesys.com
Cc: reiserfs-list@namesys.com



Hi,

I am using SUSE 10 beta version. I ran reiserfsck command with the
following options


           reiserfsck --check -q -y -n /dev/sdb1  2>&1
          =20
O/p of the command look like this.

             reiserfsck 3.6.19 (2003 www.namesys.com)
                      =20
                * If you are using the latest reiserfsprogs and  it
fails **
                * please  email bug reports to
reiserfs-list@namesys.com, **
                * providing  as  much  information  as  possible --
your **
                * hardware,  kernel,  patches,  settings,  all
reiserfsck **
                * messages  (including version),  the reiserfsck
logfile, **
                * check  the  syslog file  for  any  related
information. **
                * If you would like advice on using this program,
support **
                * is available  for $25 at
www.namesys.com/support.html. **
=20
*************************************************************
                Will read-only check consistency of the filesystem on
/dev/sdb1
                Will put log info to 'stdout'
                reiserfsck --check started at Mon May 29 13:16:40 2006
                Relaying journal..
                Reiserfs journal '/dev/sdb1' in blocks [18..8211]: 0
transactions replayed
                checking internal tree..finished
                Comparing bitmaps..Checking Semantic tree:
                finished
                26 found corruptions can be fixed when running with
--fix-fixable
                reiserfsck finished at Mon May 29 13:16:44 2006
                    =20
                       reiserfsck exit status =3D 6


Can any one Explain this ..Why it happened ?

Your help is appreciated
Regards,
Masthan=20
