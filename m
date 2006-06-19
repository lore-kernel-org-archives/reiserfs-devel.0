From: "Masthan, Dudekula (STSD)" <dudekula.masthan@hp.com>
Subject: RE: Try to fix a  broken ReiserFS / Data Recovering?
Date: Mon, 19 Jun 2006 18:04:46 +0530
Message-ID: <4EEB5A4713E61F49A759A504BECCBC0A027684C1@bgeexc01.asiapacific.cpqcorp.net>
References: <1150720072.6383.88.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28817-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-class: urn:content-classes:message
In-Reply-To: <1150720072.6383.88.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Vladimir V. Saveliev" <vs@namesys.com>, Lars Wolff <support@sipex.de>
Cc: reiserfs-list@namesys.com



Hi,

The following paragraph is snippet of reiserfsck man page.

AN EXAMPLE OF USING reiserfsck
=20
	1. You think something may be wrong with a reiserfs partition on =
/dev/hda1 or you would just like to perform a periodic disk check.	=20
 =20
	2. Run reiserfsck --check --logfile check.log /dev/hda1. If reiserfsck =
--check exits with status 0 it means no errors were discovered.	=20
 =20
	3. If reiserfsck --check exits with status 1 (and reports about fixable =
corruptions) it means that you should run reiserfsck --fix-fixable =
--logfile fixable.log /dev/hda1.	=20
 =20
	4. If reiserfsck --check exits with status 2 (and reports about fatal =
corruptions) it means that you need to run reiserfsck --rebuild-tree. If =
reiserfsck --check fails in some way you should also run reiserfsck =
--rebuild-tree, but we also encourage you to submit this as a bug =
report.	=20
 =20
	5. Before running reiserfsck --rebuild-tree, please make a backup of =
the whole partition before proceeding. Then run reiserfsck =
--rebuild-tree --logfile rebuild.log /dev/hda1.	=20
 =20
	6. If the reiserfsck --rebuild-tree step fails or does not recover what =
you expected, please submit this as a bug report. Try to provide as much =
information as possible including your platform and Linux kernel =
version. We will try to help solve the problem.	=20

EXIT CODES
=20
	reiserfsck uses the following exit codes:
0 - No errors.
1 - File system errors corrected.
2 - Reboot is needed.
4 - File system fatal errors left uncorrected,
reiserfsck --rebuild-tree needs to be launched.
6 - File system fixable errors left uncorrected,
reiserfsck --fix-fixable needs to be launched.
8 - Operational error.
16 - Usage or syntax error.	=20

AUTHOR
=20
	This version of reiserfsck has been written by Vitaly Fertman =
<vitaly@namesys.com>.	=20

BUGS
=20
	Please report bugs to the ReiserFS developers =
<reiserfs-dev@namesys.com>, providing as much information as =
possible--your hardware, kernel, patches, settings, all printed =
messages, the logfile; check the syslog file for any related =
information.	=20

TODO
=20
	Faster recovering, signal handling.	=20

From the fourth point What I understood is, failure of  " reiserfsck =
--check "  with error code other than 1 and 2 is a bug. Is it correct ?

And the last table tells that reiserfsck still not hadling signals. Is =
it correct ?





Regards,
Masthan
=20

-----Original Message-----
From: Vladimir V. Saveliev [mailto:vs@namesys.com]=20
Sent: Monday, June 19, 2006 5:58 PM
To: Lars Wolff
Cc: reiserfs-list@namesys.com
Subject: Re: Try to fix a broken ReiserFS / Data Recovering?

Hello

On Mon, 2006-06-19 at 11:28 +0200, Lars Wolff wrote:
> Hi there,
>=20
> i am very new to this list, i just signed up today, because i got some =

> problems with a broken ReiserFS since yesterday.
>=20
> _The problem_
> Yesterday my Router/Server (Suse Linux 8.1, 40GB IDE HDD with=20
> ReiserFS) hang up. After a reboot it only starts to "load stage2 of=20
> Grub", which fails and ends up in the grub minimal bash.
>=20
> _What i do to resolve the problem_
> I downloaded the Suse Live-CD 9.1 and did a clean boot from it. I Try=20
> to mount the volume, what end up with "Falscher Dateisystemtyp,=20
> ung=FCltige Optionen, der =BBSuperblock=AB von /dev/hdb2 ist =
besch=E4digt oder=20
> es sind zu viele Dateisysteme eingeh=E4ngt" (=3Dcorrupt superblock)
>=20
> Then I tried reiserFs Check wich ends up in: Bad root block 0.=20
> (--rebuild-tree did not complete).
>=20
> Ok, i followed the instructions in the following "bad block info text" =

> and did a reiserFs -B badblocksfile --rebuild-tree. Wich aborts and=20
> said "badblock in ....".
>=20
> Right now i am doing a complete Backup image with dd_rescue, after=20
> this i would like to run /sbin/badblocks, as explained in the Faq
> (http://www.namesys.com/bad-block-handling.html) and run then reiserfs =

> -B again.
>=20
> _My Questions_
> - Am i right in doing these actions to try to resolve the problem of=20
> my harddisk, and HOPEFULLY to recover the Data?
>=20

after dd_rescue completes - please run reiserfsck (3.6.19, without any =
options but filename) on backup image and let us know what it says.

> - Is there anything i should try/do else?
>=20
> - Do you now somebody/any company, wich do a real data-recovering von=20
> ReiserFS Disk? Its only 40GB but there are some data on it wich are=20
> very important. (don't ask after the backups, they broke last week on=20
> the extern hdd! :(( )
>=20
> Hopefully you guys can help me,
> thanks a lot!!!! :)
>=20
> Lars
>=20

