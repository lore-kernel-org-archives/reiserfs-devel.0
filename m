From: Hans Reiser <reiser@namesys.com>
Subject: Re: Contribution
Date: Mon, 28 Mar 2005 09:24:32 -0800
Message-ID: <42483DD0.3020904@namesys.com>
References: <20050326085141.GA29906@sue.caltech.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23713-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050326085141.GA29906@sue.caltech.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Hiszpanski <hiszpans@its.caltech.edu>, vitaly@thebsh.namesys.com
Cc: reiserfs-list@namesys.com

Suggestion: If you want casual people to actually read code, you need to
send it as uncompressed patches.  Vitaly, please look at this.

I think we would only want to use the algorithm you describe below after
extensively warning the user that they should instead first copy it to a
working hard drive, and warning them that if fsck does not have a good
hard drive under it can make things far worse rather than better, and
having them rerun with the option
--continue-to-trust-my-data-to-failing-hardware

Thanks for the contribution, it sounds useful.

Hans

Chris Hiszpanski wrote:

>Hi,
>
>Recently, I ran a --rebuild-tree on a reiserfs partition in an attempt to
>restore several files that I had accidentally deleted. Due to my own stupidity
>I did not back up my files on the partition before doing this (!).
>
>What can go wrong did, and --rebuild-tree stopped at the first bad block,
>leaving an unmountable /home partition.
>
>I ran badblocks on the partition and passed this to reiserfsck. Some of the
>bad blocks were journal superblocks, and reiserfsck gave up at this point. Web
>documentation suggested running a dd_rescue. Since I was working on a remote
>machine and had no extra drives available this wasn't an open option.
>
>I noticed that writing to the badblocks should cause the hard disk to remap the
>blocks, making reiserfsck happy, though losing data (turned out that apparently
>not much data was stored in these blocks, and this data was inaccessible
>anyway, so not a big loss :).
>
>The non-destructive write (i.e. badblocks -n ...) didn't remap the blocks. Only
>the destructive writes (i.e. badblocks -w) did. Therefore, I modified the
>lib/io.c code with a pretty trivial update that others in this situation may
>find useful.
>
>The contribution adds two options as #define in lib/io.c, NOSUPERDIE and NODIE.
>When NOSUPERDIE is 1, the bread function calls badblocks -w to destructively
>write the bad block, hopefully remapping it (since the remapped block is
>meaningless data, I didn't worry about having bh point to meaningful data).
>When NOSUPERDIE is 0, but NODIE is 1, the bread function returns a 0, acting
>as if the block was in the bad blocks list, avoiding the need for running
>bad blocks separately. When both NOSUPERDIE and NODIE are 0, the code compiles
>unaltered.
>
>The point of this contribution is to prevent reiserfsck from dieing on bad
>blocks, to get it to finish, so that the file system, what's left of it, can
>be mounted.
>
>The results that I received were pretty good. I was able to recover most of
>my files, and the file system appears to be in tact. Can anyone tell me how
>in tact is actually is? I'm not exactly sure what was destroyed when I remapped
>the journal superblocks.
>
>I'd appreciate some feedback on this hack, any problems with it especially.
>
>Hopefully the community finds this useful.
>
>Cheers,
>Chris
>
>(attached reiserfsprogs-3.6.19-hiszpans.tar.gz)
>(http://www.its.caltech.edu/~hiszpans/pub/reiserfsprogs-3.6.19-hiszpans.tar.gz)
>
>  
>

