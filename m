From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Fri, 11 Nov 2005 19:15:45 +0300
Message-ID: <4374C3B1.6000300@namesys.com>
References: <432AFB44.9060707@namesys.com> <20050916174028.GA32745@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26861-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050916174028.GA32745@infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: Reiserfs-dev <reiserfs-dev@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>, LKML <linux-kernel@vger.kernel.org>

Hello, Christoph

We have fixed most of your complains.
Would you be so kind to find some time and take a quick look at reiser4
(2.6.14-rc5-mm1 +
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.14-rc5-mm1/broken-out-3)


However, there are some problems:

Christoph Hellwig wrote:
> more trivial review comments ontop of the previous one, after looking
> at things:
> 
>  - please never use list_for_each in new code but list_for_each_entry
>  - never use kernel_thread in new code but kthread_*
>  - do_sendfile duplicates the common sendfile code.  why aren't you
>    using the generic code?
>  - there's tons of really useless assertation of the category
>    discussed in the last thread
>  - there's tons of deep pagecache messing in there.  normally this
>    shouldn't be a filesystem, and if this breaks because of VM changes you'll
>    have to fix it, don't complain..

I hope it is in better state now, still not perfect, though.

>  - you still do your plugin mess in ->readpage.  honsetly could you
>    please explain why mpage_readpage{,s} don't work for you?
>  - (issues with the read/write path already addresses in the previous thread)
>  - looking at ->d_count in ->release is wrong

this is not fixed yet, but it is on top of todo list. We need to find correct
way to understand when file can be packed.

>  - still has security plugin stuff that duplicates LSM
>  - why do underlying attributes change when VFS inode doesn't change?
>    if not please rip out most of getattr_common

Sorry, I am not sure what do you mean here. reiser4' getattr looks similar to
generic_fillattr but does few things differently. Please explain what is wrong
by your opinion.

>  - link_common S_ISDIR doesn't make sense, VFS takes care of it
>  - please use the generic_readlink infrastructure
> 
> additinoal comment is that the code is very messy, very different
> from normal kernel style, full of indirections and thus hard to read.
> real review will take some time.
> 

We are willing to improve reiser4 code in incremental way.
Please do not consider this additional comment as a major reason to not let
reiser4 to get included.

Thanks
