From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH V2] fs/reiserfs/stree.c: remove obsolete __constant
Date: Wed, 14 May 2014 15:27:05 -0700
Message-ID: <1400106425.12666.6.camel@joe-AO725>
References: <20140503223324.4357f591dc8994b74f456440@skynet.be>
	 <20140514220143.GA20841@quack.suse.cz>
	 <CAFLxGvzp_8Qgg0wN2v0SncAB+eDEn4s-p86ZW9+DzosBKb53yw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFLxGvzp_8Qgg0wN2v0SncAB+eDEn4s-p86ZW9+DzosBKb53yw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Jan Kara <jack@suse.cz>, Fabian Frederick <fabf@skynet.be>, linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, akpm <akpm@linux-foundation.org>

On Thu, 2014-05-15 at 00:08 +0200, Richard Weinberger wrote:
> On Thu, May 15, 2014 at 12:01 AM, Jan Kara <jack@suse.cz> wrote:
> > On Sat 03-05-14 22:33:24, Fabian Frederick wrote:
> >> __constant_cpu_to_le32 converted to cpu_to_le32
> >>
> >> Cc: reiserfs-devel@vger.kernel.org
> >> Cc: Andrew Morton <akpm@linux-foundation.org>
> >> Signed-off-by: Fabian Frederick <fabf@skynet.be>
> >   Just for my education, where have you learned that __constant_...
> > functions are obsolete?
> 
> IIRC checkpatch.pl barks if you use __constant_... outside of include/uapi/

I'd use not preferred and unnecessarily verbose more than obsolete.

These conversions are all tested with __builtin_constant_p
via indirection to macros like __swab32

include/uapi/linux/swab.h:#define __swab32(x)                           \
include/uapi/linux/swab.h-      (__builtin_constant_p((__u32)(x)) ?     \
include/uapi/linux/swab.h-      ___constant_swab32(x) :                 \
include/uapi/linux/swab.h-      __fswab32(x))

include/uapi/linux/swab.h:#define ___constant_swab32(x) ((__u32)(                               \
include/uapi/linux/swab.h-      (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
include/uapi/linux/swab.h-      (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
include/uapi/linux/swab.h-      (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
include/uapi/linux/swab.h-      (((__u32)(x) & (__u32)0xff000000UL) >> 24)))

