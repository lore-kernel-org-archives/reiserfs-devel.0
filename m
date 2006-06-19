From: "Masthan, Dudekula (STSD)" <dudekula.masthan@hp.com>
Subject: RE: BUG: reiserfsck --check fails exit status=6
Date: Mon, 19 Jun 2006 18:43:21 +0530
Message-ID: <4EEB5A4713E61F49A759A504BECCBC0A0276850E@bgeexc01.asiapacific.cpqcorp.net>
References: <1150720984.6383.100.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28820-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-class: urn:content-classes:message
In-Reply-To: <1150720984.6383.100.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Hi Vladimir,

Thanks for your help . Now it is running fine..

Regards,
Masthan=20

-----Original Message-----
From: Vladimir V. Saveliev [mailto:vs@namesys.com]=20
Sent: Monday, June 19, 2006 6:13 PM
To: Masthan, Dudekula (STSD)
Cc: reiserfs-list@namesys.com
Subject: Re: BUG: reiserfsck --check fails exit status=3D6

Hello

On Mon, 2006-06-19 at 14:50 +0530, Masthan, Dudekula (STSD) wrote:
>=20
> Hi,
>=20
> I am using SUSE 10 beta version. I ran reiserfsck command with the=20
> following options
>=20
>=20
>            reiserfsck --check -q -y -n /dev/sdb1  2>&1
>           =20
> O/p of the command look like this.
>=20
>              reiserfsck 3.6.19 (2003 www.namesys.com)
>                       =20
>                 * If you are using the latest reiserfsprogs and  it=20
> fails **
>                 * please  email bug reports to=20
> reiserfs-list@namesys.com, **
>                 * providing  as  much  information  as  possible --=20
> your **
>                 * hardware,  kernel,  patches,  settings,  all=20
> reiserfsck **
>                 * messages  (including version),  the reiserfsck=20
> logfile, **
>                 * check  the  syslog file  for  any  related=20
> information. **
>                 * If you would like advice on using this program,=20
> support **
>                 * is available  for $25 at=20
> www.namesys.com/support.html. **
> =20
> *************************************************************
>                 Will read-only check consistency of the filesystem on
> /dev/sdb1
>                 Will put log info to 'stdout'
>                 reiserfsck --check started at Mon May 29 13:16:40 2006
>                 Relaying journal..
>                 Reiserfs journal '/dev/sdb1' in blocks [18..8211]: 0=20
> transactions replayed
>                 checking internal tree..finished
>                 Comparing bitmaps..Checking Semantic tree:
>                 finished
>                 26 found corruptions can be fixed when running with=20
> --fix-fixable
>                 reiserfsck finished at Mon May 29 13:16:44 2006
>                     =20
>                        reiserfsck exit status =3D 6
>=20
>=20
> Can any one Explain this ..

reiserfsck has 3 major modes.
By default (or with --check) it checks filesystem and either says that
everything is ok, or reiserfsck has to be run with --fix-fixable (when
filesystem can be fixed without tree rebuiling) or with --rebuild-tree
when corruptions can be recovered only via complete tree rebuild.

> Why it happened ?
>=20

Can you re-run reiserfsck --check without -n and with -l logfile and let
us see what you get in logfile?

> Your help is appreciated
> Regards,
> Masthan
>=20

