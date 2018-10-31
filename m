From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] reiserfs: remove workaround code for GCC 3.x
Date: Wed, 31 Oct 2018 16:50:50 +1100
Message-ID: <87o9bais05.fsf@concordia.ellerman.id.au>
References: <1535337230-13222-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535337230-13222-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Masahiro Yamada <yamada.masahiro@socionext.com>, reiserfs-devel@vger.kernel.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> Commit cafa0010cd51 ("Raise the minimum required gcc version to 4.6")
> bumped the minimum GCC version to 4.6 for all architectures.
>
> The workaround code in fs/reiserfs/Makefile is obsolete now.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  fs/reiserfs/Makefile | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/fs/reiserfs/Makefile b/fs/reiserfs/Makefile
> index a39a562..bd29c58 100644
> --- a/fs/reiserfs/Makefile
> +++ b/fs/reiserfs/Makefile
> @@ -26,14 +26,5 @@ ifeq ($(CONFIG_REISERFS_FS_POSIX_ACL),y)
>  reiserfs-objs += xattr_acl.o
>  endif
>  
> -# gcc -O2 (the kernel default)  is overaggressive on ppc32 when many inline
> -# functions are used.  This causes the compiler to advance the stack
> -# pointer out of the available stack space, corrupting kernel space,
> -# and causing a panic. Since this behavior only affects ppc32, this ifeq
> -# will work around it. If any other architecture displays this behavior,
> -# add it here.
> -ccflags-$(CONFIG_PPC32) := $(call cc-ifversion, -lt, 0400, -O1)
> -
>  TAGS:
>  	etags *.c

Oh wow that's gross. Thanks for cleaning it up.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
