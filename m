From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Reiserfs versions
Date: Tue, 19 Nov 2002 17:38:24 +0100
Message-ID: <200211191738.24321.Dieter.Nuetzel@hamburg.de>
References: <3DD97831.4030607@panix.com> <200211191722.24120.Dieter.Nuetzel@hamburg.de> <20021119192647.A519@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12033-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021119192647.A519@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Oleg Drokin <green@namesys.com>
Cc: kenny gorman <kgorman@panix.com>, reiserfs-list@namesys.com

Am Dienstag, 19. November 2002 17:26 schrieb Oleg Drokin:
> Hello!
>
> On Tue, Nov 19, 2002 at 05:22:24PM +0100, Dieter N?tzel wrote:
> > I can send you my 3.6.4 SPEC file so that you can create your own
> > reiserfsprogs-3.6.4 package.
>
> Actually spec file is included with reiserfsprogs source.
> I do not know about SuSE, but I've succesfully built reiserfsprogs
> for RedHat systems using supplied spec file more than once already.

OK, yes I tried it with "time rpm -ta reiserfsprogs-3.6.4.tar.gz",again and=
 it=20
worked.

17.890u 2.730s 0:25.99 79.3%    0+0k 0+0io 161106pf+0w

There were times where it didn't worked...;-)

Don't forget the "rpm -i --force xxx" thing.

Cheers,
	Dieter

=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)
