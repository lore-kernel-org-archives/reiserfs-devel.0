From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 snapshot for August 26th.
Date: Wed, 27 Aug 2003 00:28:52 +0400
Message-ID: <3F4BC304.5070707@namesys.com>
References: <20030826102233.GA14647@namesys.com>	 <1061922037.1670.3.camel@spc9.esa.lanl.gov>	 <20030826182609.GO5448@backtop.namesys.com>	 <1061926566.1076.2.camel@teapot.felipe-alfaro.com>	 <20030826194321.GA25730@namesys.com> <1061927482.1666.36.camel@spc9.esa.lanl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15440-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1061927482.1666.36.camel@spc9.esa.lanl.gov>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steven Cole <elenstev@mesatop.com>
Cc: Oleg Drokin <green@namesys.com>, Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>, Alex Zarochentsev <zam@namesys.com>, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, LKML <linux-kernel@vger.kernel.org>

Steven Cole wrote:

>On Tue, 2003-08-26 at 13:43, Oleg Drokin wrote:
>  
>
>>Hello!
>>
>>On Tue, Aug 26, 2003 at 09:36:07PM +0200, Felipe Alfaro Solana wrote:
>>    
>>
>>>>Disable "reiser4 system call" (CONFIG_REISER4_FS_SYSCALL) support, it is 
>>>>not ready.
>>>>        
>>>>
>>>[...]
>>>arch/i386/kernel/built-in.o(.data+0x7c4): In function `sys_call_table':
>>>: undefined reference to `sys_reiser4'
>>>make[2]: *** [.tmp_vmlinux1] Error 1
>>>make[1]: *** [vmlinux] Error 2
>>>[...]
>>>CONFIG_REISER4_FS=m
>>>      
>>>
>>Building as module is also not yet supported.
>>
>>    
>>
>Fine, then here's a patch:
>
>--- linux-2.6.0-test4-r4/fs/Kconfig.orig	2003-08-26 13:44:38.165059616 -0600
>+++ linux-2.6.0-test4-r4/fs/Kconfig	2003-08-26 13:46:43.672979512 -0600
>@@ -203,6 +203,9 @@
> 	tristate "Reiser4 (EXPERIMENTAL very fast general purpose filesystem)"
> 	depends on EXPERIMENTAL
> 	---help---
>+	  Building as a module is not yet supported, so don't say 'M'
>+          unless you're a developer.
>+
> 	  Reiser4 is more than twice as fast for both reads and writes as
> 	  ReiserFS.  That means it is four times as fast as NTFS by Microsoft.
> 	  (Proper benchmarks will appear in a few months at
>
>Meanwhile, reiser4 seems to be working fine and is nice and fast.
>
>I did a "time bk -r co" for the current 2.6 tree, and here
>are the results for reiser4 and ext3 on 2.6.0-test4:
>
>Reiser4:
>real    1m55.077s
>user    0m30.740s
>sys     0m36.558s
>
>Ext3:
>real    3m48.438s
>user    0m26.400s
>sys     0m13.205s
>
>Steven
>
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>Please read the FAQ at  http://www.tux.org/lkml/
>
>
>  
>
Better to disable it entirely.  Features too broken to compile should 
not be warned of, they should be invisible and not selectable in the 
menu.  Thanks Steven and Mike.

-- 
Hans


