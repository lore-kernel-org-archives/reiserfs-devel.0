From: Hans Reiser <reiser@namesys.com>
Subject: Re: resizefs.reiser4
Date: Mon, 05 Jul 2004 15:47:05 -0700
Message-ID: <40E9DA69.3070100@namesys.com>
References: <11fc6a25040705102557444d20@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19519-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <11fc6a25040705102557444d20@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sean Johnson <gutenpress@gmail.com>
Cc: reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>, Alexander Zarochentcev <zam@namesys.com>

This is not functional code, but a stub that wasn't removed properly.  
We can't get people to buy support contracts for reiser4 unless we make 
some non-essential piece of it proprietary due to the weird psychology 
of free software, and we are flat broke, so....

ext2 also had a proprietary resizer (though not an online one).

Sean Johnson wrote:

>>From looking at the help, it appears that all I need to do to resize a
>reiserfs4 partition to 15G is:
>
>resizefs.reiser4 /dev/device 15G
>
>Unfortunately, when I do that, it just spits back the options to me.
>This is an lvm device, that I just expanded from 10G to 15G. I've
>tried a dozen different variations, and looked at the man page, but
>there doesn't seem to be any information about what I'm doing wrong.
>
>Any suggestions would be much appreciated.
>
>Thanks,
>
>Sean
>
>
>  
>

