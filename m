From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: resizefs.reiser4
Date: Mon, 5 Jul 2004 23:59:50 +0400
Message-ID: <200407052359.50303.vitaly@namesys.com>
References: <11fc6a25040705102557444d20@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19517-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <11fc6a25040705102557444d20@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sean Johnson <gutenpress@gmail.com>, reiserfs-list@namesys.com

On Monday 05 July 2004 21:25, Sean Johnson wrote:
> From looking at the help, it appears that all I need to do to resize a
> reiserfs4 partition to 15G is:
>
> resizefs.reiser4 /dev/device 15G
>
> Unfortunately, when I do that, it just spits back the options to me.
> This is an lvm device, that I just expanded from 10G to 15G. I've
> tried a dozen different variations, and looked at the man page, but
> there doesn't seem to be any information about what I'm doing wrong.
>
> Any suggestions would be much appreciated.

resizer is not ready for reiser4 yet.
-- 
Thanks,
Vitaly Fertman

