From: Yury Umanets <umka@namesys.com>
Subject: Re: build problem BK reiser4progs: /usr/include/features.h:218:52:
 operator '==' has no left operand
Date: Thu, 16 Jan 2003 15:16:38 +0300
Message-ID: <3E26A2A6.702@namesys.com>
References: <20030116102742.I7526@humilis> <3E268CFD.5080604@namesys.com> <20030116120230.J7526@humilis> <3E2692AE.2030704@namesys.com> <20030116121007.L7526@humilis> <3E269499.2090909@namesys.com> <20030116123949.N7526@humilis>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12384-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030116123949.N7526@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ookhoi@humilis.net
Cc: Reiserfs-List <reiserfs-list@namesys.com>

Ookhoi wrote:

>Yury Umanets wrote (ao):
>  
>
>>Ookhoi wrote:
>>
>>    
>>
>>>Yury Umanets wrote (ao):
>>>
>>>
>>>      
>>>
>>>>Do bk pull first of course :)
>>>>        
>>>>
>>>Of course :-)  (Nothing to pull)
>>>
>>>Thank you!
>>>
>>>      
>>>
>>Strange :) There must be changes in configure.in
>>    
>>
>
>ookhoi $ l configure.in
>-rw-rw-r--    1 ookhoi   src          7389 Jan 16 10:01 configure.in
>ookhoi $ wc -l configure.in
>    305 configure.in
>ookhoi $ md5sum configure.in
>d926d877f4218d926dbab3e8296d2d90  configure.in
>ookhoi $ bk pull
>Nothing to pull from bk://namesys.com/bk/reiser4progs
>
>But you are right, something is wrong:
>
>ookhoi $ l `which mkfs.reiser4`
>-rwxr-xr-x    2 root     staff      747454 Jan 16 12:16 /usr/local/sbin/mkfs.reiser4*
>ookhoi $ ldd `which mkfs.reiser4`
>        libncurses.so.5 => /lib/libncurses.so.5 (0x40017000)
>        libreadline.so.4 => /lib/libreadline.so.4 (0x40057000)
>        libc.so.6 => /lib/libc.so.6 (0x40080000)
>        /lib/ld-linux.so.2 => /lib/ld-linux.so.2 (0x40000000)
>
>With the snapshot mkfs.reiser4 it also uses libaal-0.1.so.0 and
>libreiser4-0.1.so.0
>
Please remove all previous versions of reiser4progs. Everything, libaal, 
libreiser4, etc.

>When I try to mkfs.reiser4 /dev/sda1 it says:
>
>ookhoi $ mkfs.reiser4 /dev/sda1
>mkfs.reiser4 0.2.0
>Copyright (C) 2001, 2002 by Hans Reiser, licensing governed by reiser4progs/COPYING.
>Fatal: Can't initialize plugin factory.
>Error: Can't initialize libreiser4.
>ookhoi $ echo $?
>8
>
>
>  
>
It is because libreiser4 was unable to found any plugins (built-in and 
separate *.so). I will make error messages more detailed.

-- 
Yury Umanets


