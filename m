From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Atomicity with reiser4?
Date: Thu, 03 Feb 2005 12:13:57 +0300
Message-ID: <1107422037.3204.55.camel@tribesman.namesys.com>
References: <CMEFJOIJPCAMFCEKIEOECEPFCFAA.smallwood@maya.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <CMEFJOIJPCAMFCEKIEOECEPFCFAA.smallwood@maya.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nicolas Smallwood <smallwood@maya.com>
Cc: reiser <reiserfs-list@namesys.com>

Hello

On Wed, 2005-02-02 at 22:36, Nicolas Smallwood wrote:
> Hello,
>  
> I was running a test with some in-house database software that relies
> on fsync after transactions are complete.  I noticed severe perfomance
> lapses, and have bee profiling the software for several days.   A
> minute ago, I removed the fsync from the system, only making it think
> it had been fsyncing.  This reduced my test from 15 minutes to less
> than 40 seconds.
>  

How often do you call fsync?
If you used reiserfs or ext2 - how much would your software performance
change when fsync is removed?
Would you brifly describe what kind of load for filesystem does your
software generate?

> Obviously there is a performance hit with using fsync, but we are of
> course worried about database integrity.
>  
> Is there an avaliable paper on how reiser4 handles atomicity, or can
> it be easily explained?

http://namesys.com/v4/v4.html#atomic_fs

> Essentially, my question is whether our database (using 4k blocksizes)
> will lose data during power loss or other occurrences if we do not
> fsync?
>  

Reiser4 flushes data to disk by portions of modified data called atom.
Atom may contain modifed data of several system calls. Flushing one atom
is called atom commit.
Atom gets committed whenever it becames too old or too large. They can
be forced to commit by fsync. 

Data of all atoms which were not committed at the moment of power loss
will be lost.

> Thank You,
>  
> Nicolas Smallwood
> 
>  
> 

