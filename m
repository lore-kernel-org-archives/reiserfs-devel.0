From: Oleg Drokin <green@namesys.com>
Subject: Re: mips requires alignment for ext2_*_bit functions
Date: Fri, 29 Mar 2002 12:20:34 +0300
Message-ID: <20020329122034.A7428@namesys.com>
References: <20020328234354.GJ5732@cuzco.az.mvista.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020328234354.GJ5732@cuzco.az.mvista.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dale Farnsworth <Dale.Farnsworth@mvista.com>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Mar 28, 2002 at 04:43:54PM -0700, Dale Farnsworth wrote:

> We see immediate alignment failures using reiserfs on mips systems.
> The problems go away with the following patch.

Thank you for the report.

The question is should all MIPS processors be threated this way or
is there are smaller subset that suffers from this problems
(and I believe kernel should allow unaligned accesses from inside of the kernel
itself (by emulating perhaps). That's what I learned from lkml recently)

> -#if BITS_PER_LONG == 64 || defined(__s390__) || defined(__hppa__)
> +#if BITS_PER_LONG == 64 || defined(__s390__) || defined(__hppa__) || defined(__mips__)

Bye,
    Oleg
