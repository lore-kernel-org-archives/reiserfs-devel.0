From: "Dale Farnsworth" <Dale.Farnsworth@mvista.com>
Subject: Re: mips requires alignment for ext2_*_bit functions
Date: Fri, 29 Mar 2002 10:10:11 -0700
Message-ID: <20020329171011.GK5732@cuzco.az.mvista.com>
References: <20020328234354.GJ5732@cuzco.az.mvista.com> <20020329122034.A7428@namesys.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020329122034.A7428@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Dale Farnsworth <Dale.Farnsworth@mvista.com>, reiserfs-list@namesys.com

On Fri, Mar 29, 2002 at 12:20:34PM +0300, Oleg Drokin wrote:
> Hello!
> 
> On Thu, Mar 28, 2002 at 04:43:54PM -0700, Dale Farnsworth wrote:
> 
> > We see immediate alignment failures using reiserfs on mips systems.
> > The problems go away with the following patch.
> 
> Thank you for the report.
> 
> The question is should all MIPS processors be threated this way or
> is there are smaller subset that suffers from this problems
> (and I believe kernel should allow unaligned accesses from inside of the kernel
> itself (by emulating perhaps). That's what I learned from lkml recently)
> 
> > -#if BITS_PER_LONG == 64 || defined(__s390__) || defined(__hppa__)
> > +#if BITS_PER_LONG == 64 || defined(__s390__) || defined(__hppa__) || defined(__mips__)
> 
> Bye,
>     Oleg

Hi Oleg,

Indeed, if unaligned accesses were supported for all accesses across all
archectures, we wouldn't need this #if at all.

Reiserfs uses ext2_set_bit()*.  There is no requirement for this
operation to be atomic.  However, some architectures, including s390 
and little-endian mips, implement it by calling test_and_set_bit(),
which is atomic.  On little-endian mips, test_and_set_bit() uses
the ll and sc instructions which have alignment requirements and
there is no way to efficiently emulate unaligned versions.

* Similarly for ext2_clear_bit(), and ext2_test_bit().

While it may be better in the long run to modify the ext2_*_bit()
functions, adding __mips__ to the current list is expedient and
consistent with the BITS_PER_LONG==64, __s390__, and __hppa__ cases.

-Dale
