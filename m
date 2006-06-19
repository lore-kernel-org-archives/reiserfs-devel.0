From: Lars Wolff <support@sipex.de>
Subject: Try to fix a  broken ReiserFS / Data Recovering?
Date: Mon, 19 Jun 2006 11:28:20 +0200
Message-ID: <44966E34.7040801@sipex.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28815-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list@namesys.com

Hi there,

i am very new to this list, i just signed up today, because i got some=20
problems with a broken ReiserFS since yesterday.

_The problem_
Yesterday my Router/Server (Suse Linux 8.1, 40GB IDE HDD with ReiserFS)=20
hang up. After a reboot it only starts to "load stage2 of Grub", which=20
fails and ends up in the grub minimal bash.

_What i do to resolve the problem_
I downloaded the Suse Live-CD 9.1 and did a clean boot from it. I Try to=20
mount the volume, what end up with "Falscher Dateisystemtyp, ung=FCltige=20
Optionen, der =BBSuperblock=AB von /dev/hdb2 ist besch=E4digt oder es sind
zu viele Dateisysteme eingeh=E4ngt" (=3Dcorrupt superblock)

Then I tried reiserFs Check wich ends up in: Bad root block 0.=20
(--rebuild-tree did not complete).

Ok, i followed the instructions in the following "bad block info text"=20
and did a reiserFs -B badblocksfile --rebuild-tree. Wich aborts and said=20
"badblock in ....".

Right now i am doing a complete Backup image with dd_rescue, after this=20
i would like to run /sbin/badblocks, as explained in the Faq=20
(http://www.namesys.com/bad-block-handling.html) and run then reiserfs=20
-B again.

_My Questions_
- Am i right in doing these actions to try to resolve the problem of my=20
harddisk, and HOPEFULLY to recover the Data?

- Is there anything i should try/do else?

- Do you now somebody/any company, wich do a real data-recovering von=20
ReiserFS Disk? Its only 40GB but there are some data on it wich are very=20
important. (don't ask after the backups, they broke last week on the=20
extern hdd! :(( )

Hopefully you guys can help me,
thanks a lot!!!! :)

Lars
