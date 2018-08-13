From: Jann Horn <jannh@google.com>
Subject: Re: [PATCH] reiserfs: fix broken xattr handling (heap corruption, bad retval)
Date: Mon, 13 Aug 2018 20:04:36 +0200
Message-ID: <CAG48ez0XHPVY7=xcgBUcsy19jUZM1jd1uc64r6sk7HB=jU_m5w@mail.gmail.com>
References: <20180802151539.5373-1-jannh@google.com> <CAG48ez0GhqL=z+UuxgGeEVcR6HBcsTHg2EmcZHLZMmedhH3fXw@mail.gmail.com>
 <20180813174237.GB25548@arm.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7etScisY52UxcidK0lUehZV+AtVR9XWlwHqsw2V9MDY=;
        b=IndZwFr1wbHpHdM607BVpAUAwci+KKzQ9EjrjwVbP3Ao9jP3SMfBZ9Ckg+Vql2N5Cf
         9pLMkp93jQKNyI07wp4vWBw/wadSnFnWZZkY3TzRbd4IcUWKfYKI57mK3iQnAgN3If8o
         w0OdFULDQarF7dvKtSjwchxM3oM6pBCkBETLyD4nZcGXWgt9r8n0uRu5ylAmk/8+55BO
         I5sgSr1PXG1MTVf1J80DkcHlHHaX7xTTnASQvITq2CDyI4rFECIvCj74EkKHiSTEUSvX
         fgMBshmZVTyp6ptOGX60REZMePQIBLSIp08PYRLWmOhNJRoX0Rvja5M5wXvB3S6am1P+
         ngdw==
In-Reply-To: <20180813174237.GB25548@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Deacon <will.deacon@arm.com>, Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, security@kernel.org, Al Viro <viro@zeniv.linux.org.uk>, kernel list <linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@google.com>

On Mon, Aug 13, 2018 at 7:42 PM Will Deacon <will.deacon@arm.com> wrote:
>
> Hi Jann,
>
> On Fri, Aug 10, 2018 at 05:19:38AM +0200, Jann Horn wrote:
> > On Thu, Aug 2, 2018 at 5:16 PM Jann Horn <jannh@google.com> wrote:
> > >
> > > This fixes the following issues:
> > >
> > >  - When a buffer size is supplied to reiserfs_listxattr() such that each
> > >    individual name fits, but the concatenation of all names doesn't
> > >    fit, reiserfs_listxattr() overflows the supplied buffer. This leads to
> > >    a kernel heap overflow (verified using KASAN) followed by an
> > >    out-of-bounds usercopy and is therefore a security bug.
> > >  - When a buffer size is supplied to reiserfs_listxattr() such that a name
> > >    doesn't fit, -ERANGE should be returned. But reiserfs instead just
> > >    truncates the list of names; I have verified that if the only xattr on
> > >    a file has a longer name than the supplied buffer length, listxattr()
> > >    incorrectly returns zero.
> > >
> > > With my patch applied, -ERANGE is returned in both cases and the memory
> > > corruption doesn't happen anymore.
> > >
> > > Credit for making me clean this code up a bit goes to Al Viro, who pointed
> > > out that the ->actor calling convention is suboptimal and should be
> > > changed.
> > >
> > > Fixes: 48b32a3553a5 ("reiserfs: use generic xattr handlers")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Jann Horn <jannh@google.com>
> >
> > +security@
> > Ping. I have not received any replies to this patch, which fixes a
> > kernel security bug, for a week.
> > Whose tree should this go through? reiserfs is marked as "supported",
> > but does not have a maintainer or a git repo listed, just a
> > mailinglist, so I guess it probably has to go through either Al Viro's
> > or akpm's tree? Looks like akpm signed off on the last commits in
> > reiserfs...
>
> I think Andrew's tree makes the most sense for this,

Yeah, Andrew has already merged it. :)
http://ozlabs.org/~akpm/mmots/broken-out/reiserfs-fix-broken-xattr-handling-heap-corruption-bad-retval.patch

> but perhaps we should
> also patch MAINTAINERS so mark it as "Orphan"? Patch below.

Either that, or get someone to step up as maintainer? If I read
https://marc.info/?l=reiserfs-devel&m=153214303506948&w=2#0 correctly,
there's still an intent to fix things in reiserfs, even though no
maintainer is listed. (Jeff Mahoney, who wrote that message and is
CC'ed on this thread, seems to have been out of office last week - when
I sent the "Ping" message a few days ago, I got a vacation
autoresponder "I'll be out of the office until 13 August" from him.)

> Will
>
> --->8
>
> From 07fbb021d5bbfe623fad10073b55704bda8e1f3d Mon Sep 17 00:00:00 2001
> From: Will Deacon <will.deacon@arm.com>
> Date: Mon, 13 Aug 2018 18:31:50 +0100
> Subject: [PATCH] MAINTAINERS: Mark reiserfs as Orphan
>
> Reiserfs has no Maintainer and random fixes tend to be merged through
> with Andrew or Al's tree. Demote the filesystem to "Orphan", since it's
> clear no longer supported by anybody.
>
> Reported-by: Jann Horn <jannh@google.com>
> Signed-off-by: Will Deacon <will.deacon@arm.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 544cac829cf4..b4fcc19cfb52 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12077,7 +12077,7 @@ F:      include/linux/regmap.h
>
>  REISERFS FILE SYSTEM
>  L:     reiserfs-devel@vger.kernel.org
> -S:     Supported
> +S:     Orphan
>  F:     fs/reiserfs/
>
>  REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM
> --
> 2.1.4
