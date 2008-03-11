From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [Build Faliure] 2.6.25-rc5-mm1 build fails
Date: Tue, 11 Mar 2008 13:56:54 +0300
Message-ID: <47D66576.6030108@gmail.com>
References: <20080311011434.ad8c8d7d.akpm@linux-foundation.org> <20080311101630.GA23757@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20080311101630.GA23757@linux.vnet.ibm.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, apw@shadowen.org, balbir@linux.vnet.ibm.com

wow, kgdb is enabled again..

Thanks!
Edward

Kamalesh Babulal wrote:

>Hi Andrew,
>
>The 2.6.25-rc5-mm1 kernel build fails with allyesconfig
>
>  LD      .tmp_vmlinux1
>fs/built-in.o: In function `reiser4_debugtrap':
>/root/kernels/linux-2.6.25-rc5/fs/reiser4/debug.c:295: undefined reference to `breakpoint'
>make: *** [.tmp_vmlinux1] Error 1
>
>This build failure has been introduced by reiser4.patch, i think the
>breakpoint() have been used instead of kgdb_breakpoint().
>
>
>--- linux-2.6.25-rc5/fs/reiser4/debug.c	2008-03-11 22:12:45.000000000 +0530
>+++ linux-2.6.25-rc5/fs/reiser4/~debug.c	2008-03-11 23:14:54.000000000 +0530
>@@ -291,8 +291,8 @@ void reiser4_debugtrap(void)
> {
> 	/* do nothing. Put break point here. */
> #if defined(CONFIG_KGDB) && !defined(CONFIG_REISER4_FS_MODULE)
>-	extern void breakpoint(void);
>-	breakpoint();
>+	extern void kgdb_breakpoint(void);
>+	kgdb_breakpoint();
> #endif
> }
> #endif
>  
>

