From: Matthew Bloch <matthew@bytemark.co.uk>
Subject: Re: How to recover data with a dead journal?
Date: Fri, 6 Sep 2002 14:55:46 +0100
Message-ID: <200209061455.46176.matthew@bytemark.co.uk>
References: <200209061313.24892.matthew@bytemark.co.uk> <200209061343.04582.matthew@bytemark.co.uk> <200209061543.50567.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11388-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200209061543.50567.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Friday 06 September 2002 14:43, Dieter N=FCtzel wrote:
> On Friday 06 September 2002 14:43, Matthew Bloch wrote:
> > On Friday 06 September 2002 13:17, Oleg Drokin wrote:
> > > Hello!
> > >
> > > On Fri, Sep 06, 2002 at 01:13:24PM +0100, Matthew Bloch wrote:
> > > > Here's a problem; my drive is on its way out but the latest corrupt
> > > > sector is the ReiserFS journal (from the ReiserFS in kernel 2.4.18):
> > >
> > > Usually we deal with HW problems based on
> > > http://namesys.com/support.html terms.
> > > Similar questions were answered on this list already, though, so you
> > > might want to check the archive.
> >
> > Fair enough; I thought there might be some experienced users here who
> > could help as well.  I'm trying dd with a different set of options
>
> NO, NO, NO!
> Read what Oleg told you and READ the archive!

I read what he said about dd, so I tried dd with bs=3D512, sync and noerror=
=20
options, and the image it created mounted perfectly (because 'sync' ensured=
=20
that holes are left, and bs=3D512 meant that the holes were as small as the=
y=20
could be).  It's only a small disc so it didn't take long.  I'll remember=20
dd_rescue for next time, though disc recovery in general is dull and=20
potentially heartbreaking ;-) so I think I'll just splash out on a mirror=20
drive so there is no next time!

thanks,

--=20
Matthew Bloch         Bytemark Computer Consulting Limited
                                http://www.bytemark.co.uk/
                                  tel. +44 (0) 8707 455026

