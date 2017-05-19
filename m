From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Fw: release_unix_file (fs/reiser4/plugin/file/file.c:2365) BUG:
 unable to handle kernel paging request
Date: Fri, 19 May 2017 16:47:15 +0200
Message-ID: <30e3aff9-954b-cd2a-c1a5-73a5a78d0fcb@gmail.com>
References: <20170519162750.10c8f6bf@Ulf.tvoe.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=bTEpkT4s5kKFG3l0vHZOP9lg+pKNc9xrJxqUUh+kBjg=;
        b=cECeaz7NyJVuoAC8ubZKAZlJ3ibV9FCejq0hCQHUz68sw+T9TDa5SgNKnZG/fEnYZz
         5ptd5xoJMqYl2+DOzgVpzzyuAVLjN2sJPIk7ove8ODzJ6JrkYPvjwNI9EsXtCo24/j1x
         jL3m2jAAw9vhaVWaPwd17c2iCbyWXJcsFfi/MBD3zYJSEZbgGdPaJXHiukd2g4EcVv5D
         f5nvF1TK/0cB0PFL51IFYG3TvnI5x+HkltFeX5zISmg5lZseu9o69RK0tfgYK6D81SrU
         xzTm0OBKrAflJtikqVa4A7YsqDNesddkaYuMNyEyd4E1rvjCEqgKSvNXNdb6EtzU2foQ
         m/3w==
In-Reply-To: <20170519162750.10c8f6bf@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dimas000@ya.ru, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hello.

The Call Trace is not decoded, so hard to say.. Other warnings is just a 
side effect.
Important: it can be caused by silent corruptions made on kernels older 
than 4.10
because of the problem (ENOMEM during balancing) fixed in the 
Reiser4-for-4.9.3
stuff.

So, I would suggest:
1) check/repair your partition with fsck;
2) try to reproduce it on the kernel 4.10
3) report about results.
If you find out how to make Call Trace be decoded, it will be a big plus.

Thanks,
Edward.

On 05/19/2017 03:27 PM, dimas wrote:
> Hello, Edward!
> i sent this mail to the list, but it seems to get lost on its way (or still
> processing so long?), so i'm FW'ing to you
> take a look, please
>
>
> =================
> Forwarded message
> Date: 2017-05-19 11:06
> From: dimas <dimas000@ya.ru>
> To: reiserfs-devel <reiserfs-devel@vger.kernel.org>
> CC:
> Subject: release_unix_file (fs/reiser4/plugin/file/file.c:2365) BUG: unable to
> handle kernel paging request
>
>> Hello!
>> while trying to update kernel on my file-server, i've experienced some strange
>> bug, starting from somewhere between Linux 3.12 and 3.18 (3.12.7 is not
>> affected by this, 3.18.x is, 4.8 and recent 4.10.x are also affected).
>> when nmbd (Samba nameserver daemon) tries to start, i get the following:
>>
>>      387 May 16 19:08:10 srv kernel: [  206.041388] BUG: unable to handle
>> kernel 387 paging request at 000b4db6
>>      388 May 16 19:08:10 srv kernel: [  206.041493] IP: [<b10f006f>] 0xb10f006f
>>      389 May 16 19:08:10 srv kernel: [  206.041558] *pde = 00000000
>>      390 May 16 19:08:10 srv kernel: [  206.041619] Oops: 0000 [#1]
>> [...]
>>      420 May 16 19:08:10 srv kernel: [  206.052558] reiser4[nmbd(1681)]:
>> release_    420 unix_file (fs/reiser4/plugin/file/file.c:2365)[vs-44]: 421
>> May 16 19:08:10 srv kernel: [  206.052558] WARNING: out of memory? 422 May 16
>> 19:08:10 srv kernel: [  206.053035] reiser4[nmbd(1681)]: release_    422
>> unix_file (fs/reiser4/plugin/file/file.c:2365)[vs-44]: 423 May 16 19:08:10
>> srv kernel: [  206.053035] WARNING: out of memory? 424 May 16 19:08:10 srv
>> kernel: [  206.053135] reiser4[nmbd(1681)]: release_    424 unix_file
>> (fs/reiser4/plugin/file/file.c:2365)[vs-44]: 425 May 16 19:08:10 srv kernel:
>> [  206.053135] WARNING: out of memory? 426 May 16 19:08:10 srv kernel:
>> [  206.053268] reiser4[nmbd(1681)]: release_    426 unix_file
>> (fs/reiser4/plugin/file/file.c:2365)[vs-44]:
>>
>> and so on, see complete log attached, from line 387 and forth.
>> at system boot nmbd starts successfully, but then i after a while (couple of
>> days, maybe) i can find it not running. then it can restart one or two times
>> without triggering any bugs, but afterwards the above bug occurs and nmbd
>> fails to run.
>> i've tried vanilla kernels with nothing but reiser4 applied to ensure that
>> it's not brought by other patches, but everything goes the same way.
>> ah, my / is reiser4))
>> wtf is that? please let me know if any additional info is required

