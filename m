From: rod@tpgi.com.au
Subject: Re: Silly question, defrag
Date: Fri, 5 Apr 2002 10:04:18 +1000
Message-ID: <3CAD76A2.19329.87D118@localhost>
References: <3CAB48E5.9050001@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020404161547.GD3990@jensbenecke.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

<snip>

> When I started with Linux, I was told that Linux did not need a
> defragger because when saving a file, the file system (ext2 in this
> case) took the file size into account when looking for free blocks.
> Fragmentation only happens when the disk is almost full, and no
> contiguous free blocks can be found any more.
> 
This should true with files were the size is known before hand.  

> Windows, OTOH, starts writing at the first free block and just skips
> used blocks, which quickly leads to BIG fragmentation.
> 
> To defragment a disk, if I thought it was absolutely necessary, I was
> told to just read and re-write all files once. Of course for this to be
> successful, you need total free space in one block that exceeds the size
> of the biggest fragmented file.

Though tests I've done with copy & delete with partitions less than 
60% full showed that both ext2 and reiserfs did not correct 
fragmentation. My guess was that cp did the job in small chunks and 
the fs wasnt told the total to allocate.  This also demonstrated that for 
the case of multiple, continually growing files the amount of free 
space was irrelevant.

> 
> Are you telling me this is different with ReiserFS? Does ReiserFS not
> try to store files in one contiguous block if possible?
>  
> 
> -- 
> mfg, Jens Benecke  /// www.hitchhikers.de, www.linuxfaq.de, www.linux.ms
> This mail is an attachment? Read http://www.jensbenecke.de/misc/outlook.html
> 


----------------------------------------------
Rod Tunks
Hardware R&D Manager
TPG Network, Canberra
rod@tpgi.com.au  (02)62851711

"bad or missing Coffee.sys - operator halted"
ICQ: 4514607
