From: Chris Mason <mason@suse.com>
Subject: Re: Re: [PATCH CFT] tons of logging patches
Date: 12 Jul 2002 15:43:11 -0400
Message-ID: <1026502991.4952.136.camel@tiny>
References: <200206222202.56577.Dieter.Nuetzel@hamburg.de>
	<1024945533.9008.10.camel@tiny> 
	<200207091552.52815.Dieter.Nuetzel@hamburg.de> 
	<1026223243.5603.124.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10991-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1026223243.5603.124.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Mason <mason@suse.com>
Cc: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>, ReiserFS List <reiserfs-list@namesys.com>

On Tue, 2002-07-09 at 10:00, Chris Mason wrote:
> On Tue, 2002-07-09 at 09:52, Dieter N=FCtzel wrote:
> > On Monday, 8 July 2002 13:51, Chris Mason wrote:
> > > On Wed, 2002-07-03 at 20:28, Manuel Krause wrote:
> > >
> > > > So far the 13 prerelease works fine under rootflags boot and=20
> > > > mount/remount option "data=3Dordered" on here.
> > >
> > > I think I've got the bug, it was newly introduced in -13.  New stuff
> > > will be uploaded today.
> > >
> Sigh, further testing showed I'd only fixed half of the bug.  The other
> half is somewhere deep writepage/truncate interaction.  I'm still trying
> to find it.

Well, after a week of fixing minor things and adding debugging code,
this bug still goes unsolved.  The only good news is that I can also
trigger it on pure 2.4.19-rc1 and ext2.  The bug seems to either be in
the VM or my ram, so I'm having a little memtest86 party overnight.

I've uploaded 03-beta-data-logging-16, it should be more stable and
faster than -11 and -13 were, but includes more debugging checks to try
and make sure I'm not screwing things up.  You can grab the patches at:

ftp://ftp.suse.com/pub/people/mason/patches/data-logging

If anyone wants to try and reproduce my memory corruption bug (can and
probably will lead to FS corruption), just let 10 fsx processes run in a
loop for ~3 hours or so on an SMP machine.

-chris


