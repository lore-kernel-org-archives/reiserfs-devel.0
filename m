From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 bug
Date: Mon, 28 Feb 2005 17:45:18 +0300
Message-ID: <20050228144518.GK8161@backtop.namesys.com>
References: <422220B3.8000800@cpc.wmin.ac.uk>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <422220B3.8000800@cpc.wmin.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Szabolcs Illes <illes@cpc.wmin.ac.uk>
Cc: reiserfs-list@namesys.com

On Sun, Feb 27, 2005 at 07:34:11PM +0000, Szabolcs Illes wrote:
> Hi All,
> 
> I have been using reiser4fs for 4 months without any problem since 
> today. After tryinig to open a movie with mplayer a have this in my log:

no other reiser4 messages in the log for 4 months?  like delimiting keys
mismatch reports?

there was wrong bitmap checksum.  actually I haven't seen such reports until
now.  are you sure your computer's disk/ram work well?

> 
> Feb 27 14:00:22 sunset kernel: reiser4[mc(9192)]: 
> write_sd_by_inode_common (fs/reiser4/plugin/object.c:480)[nikita-2221]:
> Feb 27 14:00:22 sunset kernel: WARNING: Failed to save sd for 1599330: -5
> Feb 27 14:00:22 sunset kernel: reiser4[mc(9192)]: create_child_common 
> (fs/reiser4/plugin/dir/dir.c:501)[nikita-2219]:
> Feb 27 14:00:22 sunset kernel: WARNING: Failed to create sd for 1599330
> Feb 27 14:00:23 sunset kernel: reiser4[cupsd(3296)]: parse_node40 
> (fs/reiser4/plugin/node/node40.c:767)[nikita-494]:
> Feb 27 14:00:23 sunset kernel: WARNING: Wrong level found in node: 1 != 95
> Feb 27 14:00:23 sunset kernel: reiser4[cupsd(3296)]: parse_node40 
> (fs/reiser4/plugin/node/node40.c:767)[nikita-494]:
> Feb 27 14:00:23 sunset kernel: WARNING: Wrong level found in node: 1 != 95
> Feb 27 14:00:24 sunset kernel: reiser4[cupsd(3296)]: parse_node40 
> (fs/reiser4/plugin/node/node40.c:767)[nikita-494]:
> Feb 27 14:00:24 sunset kernel: WARNING: Wrong level found in node: 1 != 95
> ......
> 1000x times

were there unclear reboots?  That shouldn't be a problem unless disk write
caching is disabled. 

> After trying to reboot:
> 
> http://nuk.teteny.elte.hu/~selli/dscf0437.jpg  (using 2.6.9-cko3)
> http://nuk.teteny.elte.hu/~selli/dscf0438.jpg
> http://nuk.teteny.elte.hu/~selli/dscf0439.jpg
> 
> I had to install a new root filesystem, and using that I was able to fix 
> the filesystem. ( --build-sb, build-fs, and fix )
> I have lost some file but fortunatly I was able to use my system again.
> 
> The affair happend when I was using 2.6.10 with reiser4 patch(from 
> namesys.com). I tried to reboot with my previos kernel (2.6.9-cko3) but 
> had the some bug (see screenshots). Sorry but I forgot to save the 
> outout of the fsck prog :(.
> 
> If U need any information do not hesitate contacting me.( I am not on 
> the mailing list)
> 
> Some info in advanve:
> Hardware: Dell Inpiron 8600c (1600Mhz Centrion processor)
> 
> Kernel config:
[...] 

-- 
Alex.
