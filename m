From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: AMD64 progress?
Date: Tue, 08 Feb 2005 14:49:53 -0600
Message-ID: <1107895793.10601.31.camel@gentoo>
References: <20050114201751.GB5883@backtop.namesys.com>
	 <Pine.LNX.4.44.0501152102230.10167-100000@ccc7.wpi.edu>
	 <20050207132934.GA7482@backtop.namesys.com>
	 <1107804896.10689.17.camel@gentoo>
	 <20050207195147.GB7482@backtop.namesys.com>
	 <1107887159.12393.6.camel@gentoo>
	 <20050208191258.GF7482@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050208191258.GF7482@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

On Tue, 2005-02-08 at 22:12 +0300, Alex Zarochentsev wrote:
> On Tue, Feb 08, 2005 at 12:25:58PM -0600, Jake Maciejewski wrote:
> > On Mon, 2005-02-07 at 22:51 +0300, Alex Zarochentsev wrote:
> > > On Mon, Feb 07, 2005 at 01:34:56PM -0600, Jake Maciejewski wrote:
> > > > I'm running reiser4progs 1.0.3 and 2.6.10 patched with reiser4 from
> > > > 2.6.11-rc3-mm1 (and this patch).
> > > > 
> > > > I've been doing the simultaneous dd and kernel compilation that has
> > > > always crashed reiser4 on AMD64 in the past. After about an hour with
> > > > debugging and two hours without debugging, I'm thinking of more ways to
> > > > torture the FS. For now it looks like reiser4 is working on AMD64!
> > > 
> > > i think so.  reiser4/amd64 passed 5h of stress testing instead of crashing in
> > > first 30min.
> > > 
> > Have you been stress testing with debugging disabled? I was doing some
> > extreme testing and crashed reiser4 with this patch twice. The same test
> 
> how it crashed?  Was the fs corrupted after the crash?

As I said, it was extreme testing. I didn't keep track of my testing
procedures because I expected reiser4 to take whatever I threw at it.

Anyway, the first test involved one hard drive with a reiser4 filesystem
on a partition, and another drive with a reiser4 loopback filesystem on
a reiser4 loopback filesystem on XFS. The partition-based filesytem had
bonnie++, a kernel compile, and dd'ing a large file from /dev/zero all
going on at once, as I recall. The top-level loopback filesystem was
also running bonnie++, and I was continually cat'ing its loopback file
to /dev/null. Of course while all this was going, since I didn't expect
trouble, I was seeding about 30 torrents with Azureus (most of which are
actually stored on a Samba server mounted as SMBFS because CIFS has been
unstable ever since I added a gigabit card) and listening to MP3s with
XMMS. The music stopped, X froze, and I couldn't SSH in. After
rebooting, I discovered minor corruption on the parition-based reiser4
filesystem but neither loopback. --fix fixed it and --check after --fix
came up clean. The log from --fix:

FSCK: Directory [12557:6b636f6e666967:1257d]: can't find the object
[1257d:c673796d626f6c2e:12591] pointed by the entry [symbol.c].
FSCK: Directory [12557:6b636f6e666967:1257d]: can't find the object
[1257d:c673796d626f6c2e:12591] pointed by the entry [symbol.c]. Entry is
removed.

I probably should have checked what happened to symbol.c, but I didn't
think anything of it and continued testing on a fresh filesystem.

My next test was dd'ing a large file from /dev/zero, compiling a kernel,
running bonnie++, and "find . -type f -exec cat {} >/dev/null \;", all
looping and running simultaneously on a a fresh filesystem on a
parition, no loopback involved at all. Once again I was doing other
stuff at the time. I know I was watching a movie with mplayer, but I
don't remember if Azureus was going or not. It froze like the previous
time.

Figuring I was onto something with the above test, I tried reiserfs on
the same drive, same parition to eliminate hardware and other errors. It
ran for a few hours until I decided test reiser4 with debugging.

The same crazy combination of dd, kernel compilation, bonnie++, and
find/cat worked at least 7 hours with debugging enabled, although I
might not have been reproducing the conditions exactly because I think I
changed the options to dd so that the filesystem wouldn't fill up, as it
did several times before the crash.

At some point I tried compiling 2.6.11-rc3-mm1, but it failed. My crash
still isn't reproducible, but if I ever get something I have a 32-bit
installation to test if it's an AMD64-only problem.

> 
> > that crashed it one of the times passes on reiserfs (didn't try the
> > other), and if enable debugging, I can torture reiser4 all night and
> > still not crash it. I'll do some more tests and try to identify a
> > simple, reproducible crash scenario.
> 
> Thanks,
> Alex.
-- 
Jake Maciejewski <maciejej@msoe.edu>

