From: Yury Umanets <umka@namesys.com>
Subject: Re: ld.so error with mkfs.reiser4
Date: Tue, 22 Apr 2003 14:50:46 +0400
Message-ID: <3EA51E86.406@namesys.com>
References: <200304221054.28028.vibir@012.net.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13755-reiserfs=m.gmane.org@namesys.com>
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
Hello,

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
This is known issue, we are working on it. Thanks for report.

-- 
Yury Umanets




