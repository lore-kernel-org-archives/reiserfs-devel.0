From: Sam Vilain <sam@vilain.net>
Subject: Re: Reserved Blocks
Date: Mon, 16 Sep 2002 17:14:12 +0100
Message-ID: <20020916161413.05CFC297C@hofmann.snowcra.sh>
References: <20020916102742.6538D2926@hofmann.snowcra.sh>
	<200209161450.g8GEorM4003750@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11477-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200209161450.g8GEorM4003750@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: reiserfs-list@namesys.com

On Mon, 16 Sep 2002 10:50:53 -0400
Valdis.Kletnieks@vt.edu wrote:

> > Is this essential UNIX filesystem feature implemented?
> "essential feature"?  Hardly.
> The *ORIGINAL* reason for the Berkeley FFS doing the "10% reserve"
> was to work around the fact that the original FFS code had severe fragmentation
> issues if the filesystem ran over 90% full (but at under 90%, there were
> enough free blocks usually available to not fragment TOO badly - the "knee"
> in the performance curve seems to have been around 92-94% full).  As such,
> this shouldn't be at all required for a modern filesystem, as it should be
> hardened against fragmentation to start with.
> A lot of sites have started abusing the "10% reserve" feature in order to
> protect themselves from people hosing things up by filling the disk - these
> are usually boxes that have "one big / filesystem" for everything.  I
> suggest that this is a *BAD* practice, and that the *proper* protection
> here is to have separate /, /usr, /var, /tmp and /home file systems.

I knew I'd get some fool saying this.  Let's stop this flamewar in the
making now.

Yes, I realise what you are saying.  The effect is worst on systems
where the root filesystem is writable by users and /etc and /tmp are
on the same filesystem (which is probably the default configuration of
many Linux distributions out there).  As a sysadmin, you've just taken
over one of those systems.  How, exactly, do you go about splitting
the filesystems up?

Pragmatic concerns aside, it is still necessary on systems with a
sound filesystem arrangement. /var/tmp is still on the same partition
for everyone. Programs need space in /var/tmp, /var/run, etc.
Therefore, without quotas or superuser reserved blocks, any user can
fill up /var/tmp, which may be needed to write pid files and all the
`per-system state information' we've come to expect in /var over the
years.

Besides, even a Balanced tree algorithm will not perform very well
allocating space when a partition is 99% full.  That should just stand
to reason.  If reiserfs lets me shrink the reserved blocks percentage
to 5% or 3% rather than 10%, fantastic.

If you've not administered enough systems to appreciate why you'd want
this, then fine.  But don't use statements like ``this shouldn't be at
all required for a modern filesystem, as it should be hardened against
fragmentation to start with'', because that statement is 95% truth and
5% bullshit.  And 0% consideration for real users.

Thank you for your input.
--
   Sam Vilain, sam@vilain.net     WWW: http://sam.vilain.net/
    7D74 2A09 B2D3 C30F F78E      GPG: http://sam.vilain.net/sam.asc
    278A A425 30A9 05B5 2F13

Real computer scientists love the concept of users.  Users are always
real impressed by the stuff computer scientists are talking about; it
sure sounds better than the stuff they are being forced to use now.
