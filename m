From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: How to recover data with a dead journal?
Date: Fri, 6 Sep 2002 15:43:50 +0200
Message-ID: <200209061543.50567.Dieter.Nuetzel@hamburg.de>
References: <200209061313.24892.matthew@bytemark.co.uk> <20020906161717.A14965@namesys.com> <200209061343.04582.matthew@bytemark.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11387-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200209061343.04582.matthew@bytemark.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Matthew Bloch <matthew@bytemark.co.uk>, reiserfs-list@namesys.com

On Friday 06 September 2002 14:43, Matthew Bloch wrote:
> On Friday 06 September 2002 13:17, Oleg Drokin wrote:
> > Hello!
> >
> > On Fri, Sep 06, 2002 at 01:13:24PM +0100, Matthew Bloch wrote:
> > > Here's a problem; my drive is on its way out but the latest corrupt
> > > sector is the ReiserFS journal (from the ReiserFS in kernel 2.4.18):
> >
> > Usually we deal with HW problems based on http://namesys.com/support.ht=
ml
> > terms.
> > Similar questions were answered on this list already, though, so you
> > might want to check the archive.
>
> Fair enough; I thought there might be some experienced users here who cou=
ld
> help as well.  I'm trying dd with a different set of options

NO, NO, NO!
Read what Oleg told you and READ the archive!

First:
Start with only one disk (IDE/ATA) per channel!
Do not enable "auto detection" in the BIOS.
Let the Linux IDE kernel/module driver do the work.
Try not to mount the broken disk.

Only have a look at the partition tables (fdisk/cfdisk).

Use "dd_rescue" (created by SuSE) and copy the whole disk to a new empty di=
sk=20
of the same size or maybe bigger (cold take ages, 20~25 hours for a 20/40/6=
0=20
GB disk, bigger disks or more errors even longer). Or make "file" copies to=
 a=20
bigger disk so that you can mount with the loop device.

Make a second copy of the "good" disk (takes 1-2 hours at raw disk speed) a=
nd=20
then work on it. If you damage some things you have your second "good" one.

> to try to make
> it leave gaps where it can't read, so hopefully that should sort it.

dd_rescue do this automatically.

>  If it doesn't I'll put a few dollars your way and make an official suppo=
rt
> request out of it.
>
> cheers,

Better after your work...;-)

Regards,
	Dieter

--=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)
