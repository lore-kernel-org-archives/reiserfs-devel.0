From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: [CHECKER] Do ext2, jfs and reiserfs respect mount -o
	sync/dirsync option? (fwd)
Date: Sat, 05 Mar 2005 13:35:36 +0300
Message-ID: <1110018935.11487.64.camel@tribesman.namesys.com>
References: <Pine.GSO.4.44.0503041521590.17877-100000@elaine24.Stanford.EDU>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.GSO.4.44.0503041521590.17877-100000@elaine24.Stanford.EDU>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Junfeng Yang <yjf@stanford.edu>
Cc: reiserfs-list@namesys.com, mc@cs.Stanford.EDU

Hello

On Sat, 2005-03-05 at 02:23, Junfeng Yang wrote:
> Looks like I sent the following message to an obsolete mailing list...
> 
> ---------- Forwarded message ----------
> Date: Thu, 3 Mar 2005 22:33:40 -0800 (PST)
> From: Junfeng Yang <yjf@stanford.edu>
> To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
>      ext2-devel@lists.sourceforge.net,
>      jfs-discussion@www-124.southbury.usf.ibm.com, reiser@namesys.com
> Cc: mc@cs.stanford.edu
> Subject: [MC] [CHECKER] Do ext2,
>      jfs and reiserfs respect mount -o sync/dirsync option?
> 
> 
> Hi,
> 
> FiSC (our file system checker) emits several warnings on ext2, jfs and
> reiserfs, complaining that diretories or files are lost while FiSC
> believes they should already be persistent on disk. (ext3 behaves
> correctly.)
> 
> All warnings boil down to a single cause:  when these file systems are
> mounted -o sync or dirsync, dirty blocks are still written out
> asynchronously.  It appears to me that these mount options don't have any
> effect on these file systems.  Is this the intended behavior?
> 

I just made the follong test on reiserfs (2.6.11-rc4-mm1):
mkreiserfs /dev/hda6
mount /dev/hda6 /mnt -o sync
touch /mnt/file
mkdir /mnt/d
echo Hello > /mnt/hello
reboot -f -n

When system booted up again I mounted /dev/hda6 and all created things
are there. 

Please describe what should one do to get the problem.

> man mount shows:
> 
>               sync   All  I/O to the file system should be done
> synchronously.
> 
>               dirsync
>                      All directory updates within the file  system  should
> be
>                      done  synchronously.   This  affects the following
> system
>                      calls: creat, link, unlink, symlink, mkdir, rmdir,
> mknod
>                      and rename.
> 
> Any clafirication on this would be very helpful,
> 
> -Junfeng
> 
> 
> _______________________________________________
> MC mailing list
> MC@keeda.stanford.edu
> http://keeda.stanford.edu/cgi-bin/mailman/listinfo/mc
> 
> 

