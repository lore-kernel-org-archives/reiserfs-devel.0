From: Yury Umanets <umka@namesys.com>
Subject: Re: ld.so error with mkfs.reiser4
Date: Tue, 22 Apr 2003 17:32:31 +0400
Message-ID: <3EA5446F.8070309@namesys.com>
References: <200304221054.28028.vibir@012.net.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13761-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304221054.28028.vibir@012.net.il>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Veber <vibir@012.net.il>
Cc: reiserfs-list@namesys.com

Alex Veber wrote:

>Hi,
>
Hello Alex,

>Trying to run a fresh BK pulled mkfs.reiser4 I get
>
>Inconsistency detected by ld.so: ../sysdeps/i386/dl-machine.h: 611:
>elf_machine_rel_relative: Assertion `((reloc->r_info) & 0xff) == 8' failed!
>
>my system is a athlon tbird 1200, GLIBC 2.3.2 with NPTL support, GCC 3.2.2, 
>binutils 2.13.90.0.20 and kernel 2.5.67. This is the first time this sort of 
>thing happens to me.
>
>Thanks,
>	Alex Veber
>
>btw: Please CC me.
>
>
>
>
>
>  
>
We have fixed this bug in the last commit of reiser4progs and now it 
works fine on gcc -3.x too. Can you try it one more time?

-- 
Yury Umanets
"We're flying high, we're watching the world passes by..."



