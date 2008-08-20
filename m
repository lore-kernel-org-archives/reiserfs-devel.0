From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: next major release query
Date: Wed, 20 Aug 2008 23:54:50 +0400
Message-ID: <48AC768A.8040909@gmail.com>
References: <17724.202.168.22.19.1219239253.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <17724.202.168.22.19.1219239253.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

doiggl@velocitynet.com.au wrote:
> Hello,
>   

Hello.

> I notice on
> http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/
>   

This directory is for patches against vanilla kernels.

Actually, these patches are synchronizations with -mm tree.
If many essential changes in -mm are accumulated, then we
release a "revision" as reiser4-for-2.6.2x.y.patch

We don't prepare patches against -rc kernels:
If you need this, then feel free to do it by yourself, actively using
-mm sources. Since reiser4 is in -mm tree, preparing such patches
is a task of complexity O(1) ;)

> it is at the reiser4-for-2.6.25.* revision/level.
>
> Questions:
> - What do you think the next major revision will be ?
>   

I think it will be something like reiser4-for-2.6.27

Thanks,ward.

> - Will it include all patches up to a point in time, of your choosing ?
>
> Thanks for the info.
> Glenn
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

