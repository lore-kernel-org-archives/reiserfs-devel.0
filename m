From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Reiserfs versions
Date: Tue, 19 Nov 2002 17:22:24 +0100
Message-ID: <200211191722.24120.Dieter.Nuetzel@hamburg.de>
References: <3DD97831.4030607@panix.com> <3DDA5320.9070605@panix.com> <20021119180848.A27946@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12029-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021119180848.A27946@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: kenny gorman <kgorman@panix.com>, Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Am Dienstag, 19. November 2002 16:08 schrieb Oleg Drokin:
> Hello!
>
> On Tue, Nov 19, 2002 at 07:05:04AM -0800, kenny gorman wrote:
> > I am sorta confused.  I downloaded and compiled the latest
> > reiserfsprogs, I also updated my rpm.  How do I know what version I am
> > runnning then?
>
> reiserfsck -V will tell you what version is in your path.

SuSE systems here, too.

> > rpm -q shows reiserfs-3.x.0k_pre10-8, but in /usr/local/sbin I have the
> > latest 3.6.4 stuff.  How can I be sure my system is updated correctly?
> > Should I remove the rpm?
>
> Right now you probably have more recent version later in the path, so
> you might want to remove the rpm.
> Or you may build another RPM off our newer sources.

After "hand crafted" reiserfsprogs stuff for severall years, now, I have th=
is:

/home/nuetzel> rpm -qi reiserfsprogs
Name        : reiserfsprogs                Relocations: (not relocateable)
Version     : 3.6.4                             Vendor: Hans Reiser
Release     : 1                             Build Date: Fre 25 Okt 2002=20
21:51:04 CEST
Install date: Fre 25 Okt 2002 21:51:33 CEST      Build Host:=20
SunWave1.nuetzel.de
Group       : Unsorted                      Source RPM:=20
reiserfsprogs-3.6.4-1.src.rpm
Size        : 2684236                          License: 2002 Hans Reiser
Packager    : Dieter.Nuetzel@hamburg.de
Summary     : utilities belonging to the Reiser filesystem
Description :

The reiserfsprogs package contains programs for creating (mkreiserfs),
checking and correcting any inconsistencies (reiserfsck) and resizing
(resize_reiserfs) of a reiserfs filesystem.

Authors:
=2D-------
Hans Reiser <reiser@namesys.com>
Vitaly Fertman <vetalf@inbox.ru>
Alexander Zarochentcev <zam@namesys.com>
Vladimir Saveliev <monstr@namesys.com>

I can send you my 3.6.4 SPEC file so that you can create your own=20
reiserfsprogs-3.6.4 package.

!!! Attention !!!
You have to install it with "rpm -i --force xxx" because the interim=20
"xxx_prexxx" Version "looks" younger for your RPM tool.

Regards,
	Dieter

=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)
