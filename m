From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Mon, 26 Sep 2005 19:03:52 +0400
Message-ID: <43380DD8.8010200@namesys.com>
References: <432AFB44.9060707@namesys.com> <20050916174028.GA32745@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26281-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050916174028.GA32745@infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS Mailing List <reiserfs-list@namesys.com>, Hans Reiser <reiser@namesys.com>

Hello

Christoph Hellwig wrote:
> more trivial review comments ontop of the previous one, after looking
> at things:
> 
>  - please never use list_for_each in new code but list_for_each_entry

done

>  - never use kernel_thread in new code but kthread_*

done

>  - do_sendfile duplicates the common sendfile code.  why aren't you
>    using the generic code?

fixed to use generic code.

>  - there's tons of really useless assertation of the category
>    discussed in the last thread
>  - there's tons of deep pagecache messing in there.  normally this
>    shouldn't be a filesystem, and if this breaks because of VM changes you'll
>    have to fix it, don't complain..

we are also not very happy with it. We will not complain, but try to simplify it.

>  - you still do your plugin mess in ->readpage.  honsetly could you
>    please explain why mpage_readpage{,s} don't work for you?

The reason is performance. Reiser4 uses a search through the filesystem tree to
access metadata of a file.
If reiser4 implemented its read/write via generic functions it would have to
repeat the search for every page being read/written.
It is especially disappointing because reiser4 uses extents with which it is
able in most cases to find all file pointers to data blocks with only one search
through the tree.
Another reason is multithread load.
Tree search includes complex part of providing correct concurrent read/write
access to the tree including deadlock avoidance algorithm. On multithread
filesystem load minimizing of a number of tree searches should have improved
filesystem throughput.

These are on todo list yet.
>  - (issues with the read/write path already addresses in the previous thread)
>  - looking at ->d_count in ->release is wrong
>  - still has security plugin stuff that duplicates LSM
>  - why do underlying attributes change when VFS inode doesn't change?
>    if not please rip out most of getattr_common
>  - link_common S_ISDIR doesn't make sense, VFS takes care of it
>  - please use the generic_readlink infrastructure
> 
> additinoal comment is that the code is very messy, very different
> from normal kernel style, full of indirections and thus hard to read.
> real review will take some time.

We hope to improve that with your help

Thanks
