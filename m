From: Andrew Clausen <clausen@gnu.org>
Subject: Re: secure delete?
Date: Sun, 21 Mar 2004 10:59:37 +1100
Message-ID: <20040320235937.GB572@gnu.org>
References: <1079697068.5812.13.camel@pear.st-and.ac.uk> <200403202345.i2KNj8VK024070@sirius.cs.pdx.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17350-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200403202345.i2KNj8VK024070@sirius.cs.pdx.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>

On Sat, Mar 20, 2004 at 03:45:08PM -0800, The Amazing Dragon wrote:
> > I guess you would have to use an encrypted swap area as well, right?
> > Would the performance be ok for that? Peter
> 
> How many orders of magnitude are disks slower than processors/memory?
> Encryption algorithms are designed to be fast to compute. Even the
> slowest processors of today will be able to encrypt/descrypt data much
> faster than the maximum throughput of hard disks. With swap you're going
> to be drowned by seeks anyway.

I don't think this is relevant.  The question probably wasn't "how much
will it slow down swap read/writes" but rather "how much will it slow
down my system in general".

You may be correct in observing that encryption/decryption won't make a
big difference in the latency on swap I/O.  (If you are getting a good
stream out of a hard disk, it might be hard for crypto to keep up, but
this is unlikely for swap)  However, it still may significantly increase
CPU usage, and hence reduce the amount of CPU available to other
processes (that aren't waiting for swap I/O).  It's not like I/O in
Linux is synchronous!

Cheers,
Andrew

