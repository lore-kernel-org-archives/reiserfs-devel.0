From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Mount fails after reiserfsck --rebuild-tree failure
Date: Thu, 18 Mar 2004 00:31:36 +0300
Message-ID: <200403180021.23171.vitaly@namesys.com>
References: <40588E59.8080002@viva-solutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17286-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40588E59.8080002@viva-solutions.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: KAA <kaa@viva-solutions.com>, reiserfs-list@namesys.com

Hello, 

> so I've unmounted array fsck'ed it (unfortunately didn't save output of
> first fsck but it failed and recommended to do --rebuild-tree)
> since that time fsck --rebuild-tree /dev/md0 fails with the same error
> all the time:
>
> build_the_tree: Nothing but leaves are expected. Block 292951 - unknown
>
> Aborted
>
> is there any way to get my data back?
> thanks in advance!

You rebuilt your raid and this problem appeared, this really looks 
like a hardware problem, check your raid again please.
If the problem in the code I can check how reiserfsck handles this 
block outside of your raid if you send it to me:
	dd if=/dev/md0 of=block.292951 count=1 bs=4096 skip=292951

-- 
Thanks,
Vitaly Fertman


