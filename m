From: Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Wed, 03 Mar 2004 14:07:16 +0100
Message-ID: <1078319235.1113.2.camel@teapot.felipe-alfaro.com>
References: <4044119D.6050502@andrew.cmu.edu>
	 <40453538.8050103@animezone.org> <20040303014115.GP19111@khan.acc.umu.se>
	 <200403030700.57164.robin.rosenberg.lists@dewire.com>
	 <1078307033.904.1.camel@teapot.felipe-alfaro.com>
	 <1078308797.2641.14.camel@venus.local.navi.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17044-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1078308797.2641.14.camel@venus.local.navi.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Olaf =?iso-8859-2?Q?Fr=B1czyk?= <olaf@cbk.poznan.pl>
Cc: Robin Rosenberg <robin.rosenberg.lists@dewire.com>, David Weinehall <david@southpole.se>, Andrew Ho <andrewho@animezone.org>, Dax Kelson <dax@gurulabs.com>, Peter Nelson <pnelson@andrew.cmu.edu>, Hans Reiser <reiser@namesys.com>, linux-kernel <linux-kernel@vger.kernel.org>, ext2-devel@lists.sourceforge.net, ext3-users@redhat.com, jfs-discussion@www-124.southbury.usf.ibm.com, reiserfs-list@namesys.com, linux-xfs@oss.sgi.com

On Wed, 2004-03-03 at 11:13, Olaf Fr=C4=85czyk wrote:
> > > Recoverability matters to me. The driver could be 10 megabyte and
> > > *I* would not care. XFS seems to stand no matter how rudely the OS
> > > is knocked down.

> > But XFS easily breaks down due to media defects. Once ago I used XFS,
> > but I lost all data on one of my volumes due to a bad block on my hard
> > disk. XFS was unable to recover from the error, and the XFS recovery
> > tools were unable to deal with the error.

> You lost all data? Or you just had to restore them from backup? If you
> didn't have a backup it is your fault not XFS one :)

Well, it was a testing machine with no important data, so I could just
afford to lose everything, as it was the case.

> But even if you had no backup, why didn't you move your data (using dd
> or something else) to another (without defects) drive, and run recovery
> on new drive?

I tried, but it proved more difficult than expected, since the computer
was a laptop and I couldn't move the HDD to another computer. Using the
distro rescue CD was useless as it's kernel didn't have XFS support. All
in all, XFS recovery was a nightmare compared to ext3 recovery, for
example.

