From: Christian Fritze <The.Finn@sprawl.de>
Subject: FAQ 29 says to put 0s into /etc/fstab -- What if I don't?
Date: Mon, 24 Mar 2003 10:10:50 +0100 (CET)
Message-ID: <200303240910.KAA02175@chatsubo.sprawl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-list-return-13350-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: INLINE
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Christian Fritze <The.Finn@sprawl.de>

Hello everybody!

Doing forensics...

A customer has leased a low budget server for a couple of small projects.=
=20
Recently the disk in that machine failed and was replaced. The provider's
technician who did the replacement and the initial setup (up to a running
sshd where I take over such a machine) installed reiserfs systems on the
partitions that (on the old disk) had carried ext3. However he did *not*
tell me about the change *and* he put '1 1' and '1 2' resp. into fstab as
he usually does whith ext3 filesystems. And yes: I did not check in due
time, trusting in work done by others... :-(

Last weekend that machine rebooted (for no apparent reason, I'm beginning
to feel annoyed about that provider...) the first time after the hardware
replacement. Hours later my customer tells me that something seems to be=20
wrong. I look at the machine and the partition that carries project data
seems to be completely empty, not a single file or directory, nothing!

After a first moment of horror thinking came back, I checked a few things
and came across those unexpected reiserfs lines in fstab. Then I read the=
=20
FAQ and finally daring a 'reiserfsck --rebuild-tree' brought me back to=20
normal life.

Is this behaviour to be expected when putting the wrong things into fstab?=
=20
(In this case the FAQ could probably talk a bit 'louder' about it... ;-)
Or should I still search for other reasons as well? I had no time yet to
build a nice kernel after the disk failure and maybe running the standard=
=20
SuSE 2.4.19 as installed from DVD isn't such a good idea in the first place=
?


greetings
Christian


--
Gr=FC=DFe aus Europas gr=F6=DFtem       Greetings from Europe's largest
Urban Sprawl (DUDOMA -- Duisburg Dortmund Metropolitan Axis ;-)
Christian Fritze   <The.Finn@sprawl.de>   http://www.sprawl.de/

