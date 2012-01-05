From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 patches and todo list
Date: Thu, 05 Jan 2012 14:53:09 +0100
Message-ID: <4F05AB45.5020003@gmail.com>
References: <28ea2828ed5cb6c7b01630c1aa548a67@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <28ea2828ed5cb6c7b01630c1aa548a67@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On 01/05/2012 11:51 AM, doiggl@velocitynet.com.au wrote:
> Hello,
> Questions:
> - Are there any plans for a reiser4 patch for Linux kernel 3.2/3.1/3.0
> series ?

Maybe for 3.2, but not sure..

fs-writeback has been changed a lot and I don't have a time to adjust
reiser4 to every stupid VFS change. Anybody care to? I'll provide the 
hints..

Thanks,
Edward.

> - Has the reiser4 todo list changed since 2009 [1] ?
>
> [1]
> https://reiser4.wiki.kernel.org/articles/t/o/d/TODO_b7b1.html
>
> Thanks Glenn
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

