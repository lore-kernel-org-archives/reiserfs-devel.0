From: Christian Stroetmann <stroetmann@ontolinux.com>
Subject: Re: reiser4 as a module
Date: Fri, 22 Oct 2010 14:53:28 +0200
Message-ID: <4CC18948.5020500@ontolinux.com>
References: <AANLkTi=o5bXDxY4XKSYzcX9fX4yHZRC68=oMk0sikViS@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=o5bXDxY4XKSYzcX9fX4yHZRC68=oMk0sikViS@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viji V Nair <viji@fedoraproject.org>
Cc: linux reiserfs-devel <reiserfs-devel@vger.kernel.org>

  Hola;

On the 22.10.2010 12:02, Viji V Nair wrote:
> Hi,
>
> I have been trying to build reiser4 as a module, but the module which
> is getting compiled having the "symbol" issue.
>
> <snip>
> reiser4: Unknown symbol lzo1x_1_compress
> reiser4: Unknown symbol might_fault
> reiser4: Unknown symbol mutex_lock_nested
> reiser4: Unknown symbol zlib_deflate
> reiser4: Unknown symbol writeback_inodes_wbc
> </snip>
You mentioned this problem in the thread [1] as well.
Check your pathes.
> I could see from the reiser4 2.6.34 patch that it is adding
> "EXPORT_SYMBOL" to few files in fs&  mm directories of the kernel
> source tree. Can we have all these symbols defined in the core source
> tree of resier4 also? Do we have a patch for this already?
For what? See above.
Btw.: To be honest, I find it a little bit off-topic, because it's about 
compiling a kernel module and not a R4 issue.
> Thanks
> Viji
[1] Compilation Issue - Reiser4 
http://www.spinics.net/lists/reiserfs-devel/msg02508.html

Have fun
Christian O>-<   *<:o)   _(D)>-<
