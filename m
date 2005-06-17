From: Wil Reichert <wil.reichert@gmail.com>
Subject: Re: hard hang with reiser4-for-2.6.11-5 and VMware Workstation 5.0
Date: Fri, 17 Jun 2005 11:11:00 -0700
Message-ID: <7a329d9105061711112f77743f@mail.gmail.com>
References: <7a329d9105061710493602114c@mail.gmail.com>
	 <20050617175452.14800.qmail@web53907.mail.yahoo.com>
Reply-To: Wil Reichert <wil.reichert@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24407-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050617175452.14800.qmail@web53907.mail.yahoo.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: scott <scottfk@yahoo.com>
Cc: "E.Gryaznova" <grev@namesys.com>, reiserfs-list@namesys.com

Currently running rc4-mm1 on Gentoo, unsure of how to tell which
patchset its using, kernel.org broken out patchsets didn't make it
obvious.  Thanks for the advice, I rely heavily on VMWare.

Wil

On 6/17/05, scott <scottfk@yahoo.com> wrote:
> I had absolutely no troubles between VMware and
> Reiser4 until I upgraded to the -5 patchset.
>=20
> Do you know which Reiser4 patchset is included in your
> -mm kernel?  If it is earlier than the -5 release, you
> might want to avoid the -5 release when it gets rolled
> into -mm since it doesn't seem like you can go back to
> a previous release.
>=20
> --- Wil Reichert <wil.reichert@gmail.com> wrote:
>=20
> > I've been running VMWare 5 on my reiser4 partition
> > for a while now and
> > haven't had any of the above issues.  Usually doing
> > CPU intensive
> > stuff too, aka WebSphere Portal servers.  I use an
> > -mm kernel, if that
> > matters.
> >
> > Wil
> >
> > On 6/17/05, E.Gryaznova <grev@namesys.com> wrote:
> > > Hello.
> > >
> > > Thank you for the report.
> > >
> > > VMWare/reiser4 is known problem, we can reproduce
> > it.  But unfortunately
> > > I can't  estimate when this will be fixed.
> > > Reiser4 format was changed in reiser4-5 patch for
> > 2.6.11, reiser4progs
> > > for this format are not ready yet.
> > >
> > > Thanks,
> > > Lena
> > >
> > > scott wrote:
> > >
> > > >Greetings,
> > > >
> > > >I have been using Reiser4 as my primary
> > filesystem for
> > > >some time now, and for the first time have
> > encountered
> > > >a problem that keeps me from doing what I want to
> > do.
> > > >
> > > >I run VMware Workstation 5.0 with the virtual
> > disk
> > > >files on my Reiser4 / partition, which happens to
> > be a
> > > >Linux md RAID1 device.  The other day I built a
> > new
> > > >kernel, upgrading to the -5 release of the
> > reiser4
> > > >patches.  Either during boot or shortly after
> > boot of
> > > >any guest OS, my workstation becomes totally
> > > >unresponsive.  Magic SysRq keys don't even work.
> > > >
> > > >
> > >
> > > >To narrow down the source of the problem, I
> > applied
> > > >the Reiser4 patch to a vanilla 2.6.11 kernel
> > tree.  I
> > > >saw the exact same issue.
> > > >
> > > >I tried reverting to a previous version of the
> > Reiser4
> > > >patch, but I get VFS errors about being unable to
> > find
> > > >a Reiser4 filesystem on my rootdisk using any
> > other
> > > >Reiser4 patchset.  Did the filesystem format
> > change?
> > > >
> > > >
> > >
> > > >I tried recompiling the -5 release with debug
> > enabled,
> > > >but since the machine is unresponsive, I don't
> > see any
> > > >output.
> > > >
> > > >My question...  is this a known issue?  Or should
> > I
> > > >just keep pounding away at this until I can get
> > some
> > > >sort of debugging information?
> > > >
> > > >Thanks to you all for the always-interesting
> > > >discussion threads on this list.  And thanks,
> > Hans,
> > > >for reiserfs and reiser4.
> > > >
> > > >be seeing you.
> > > >
> > > >scott
> > > >
> > > >
> > > >
> > >
> >
> >____________________________________________________
> > > >Yahoo! Sports
> > > >Rekindle the Rivalries. Sign up for Fantasy
> > Football
> > > >http://football.fantasysports.yahoo.com
> > > >
> > > >
> > > >
> > > >
> > >
> > >
> > >
> >
>=20
>=20
> be seeing you.
>=20
> scott
>=20
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around
> http://mail.yahoo.com
>
