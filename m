From: <pcg( Marc)@goof(A.).(Lehmann )com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Wed, 29 Dec 2004 23:27:58 +0100
Message-ID: <20041229222758.GB5206@schmorp.de>
References: <20041228221218.GA6412@schmorp.de> <41D31C22.9060400@namesys.com> <20041229214324.GA5206@schmorp.de> <200412292246.46713.chrivers@iversen-net.dk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22940-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200412292246.46713.chrivers@iversen-net.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Iversen <chrivers@iversen-net.dk>
Cc: reiserfs-list@namesys.com

On Wed, Dec 29, 2004 at 10:46:46PM +0100, Christian Iversen <chrivers@iversen-net.dk> wrote:
> > On Wed, Dec 29, 2004 at 01:05:38PM -0800, Hans Reiser <reiser@namesys.com> 
> wrote:
> > > Stefan Traby wrote:
> > > >Here a script that works independent of hash (feel free to forward it to
> > > >bugtraq - it's a showstopper bug):
> > >
> > > is not a showstopper bug
> >
> > If it keeps debian from being usable on reiserfs (mind you, xfonts-75 and
> > xfonts-100 are not unimportant packages), I'd call this a showstopper
> > indeed *g*.
> 
> Under what conditions does this occur?

Under the conditions that I already wrote about: when upgrading an
existing xfonts-75dpi package. Installing works fine, upgrading does not,
presumably because dpkg creates a backup copy of every file upgraded
first, which then exceeds some internal reiserfs limit.

> I have 5 installs of debian linux on 
> reiserfs here at home, and I have never had such problems. Is it only in 
> directories with thousands of other files?

As I understands the bug, it happens when too many filenames in the same
directory happen to hash to the same file - reiserfs requires the hash of
filenames to be "unqiue enough", otherwise it will not be able to create
more files with the same hashed name.

As the examples show, getting collisions is pretty straightforward and
easy, even with the tea hash (I can faintly remember hans reiser claiming
that this bug has been solved some years ago, and indeed this is the first
time it really bites me, albeit with a very real example).

As such, reiserfs v3 is not suitable for server operations, where such
irregular behaviour simply must not occur - consider this happening when
installing a kernel package, leaving your system in a non-bootable state
or so.

My specific case might depend on other packages - as I maintain some
i18n'ed software I have lots of extra font packages installed, although
I doubt many of them will end up in the 75dpi directory, but it might
be that my 75dpi and 100dpi dirs might be somewhat crowded - they both
contain 1888 files with similar names (and the standard hash, r5, is very
susceptible to similar names leading to similar hashes).

-- 
                The choice of a
      -----==-     _GNU_
      ----==-- _       generation     Marc Lehmann
      ---==---(_)__  __ ____  __      pcg@goof.com
      --==---/ / _ \/ // /\ \/ /      http://schmorp.de/
      -=====/_/_//_/\_,_/ /_/\_\      XX11-RIPE
