From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH] reiserfs: fix broken xattr handling (heap corruption,
 bad retval)
Date: Mon, 13 Aug 2018 18:42:37 +0100
Message-ID: <20180813174237.GB25548@arm.com>
References: <20180802151539.5373-1-jannh@google.com>
 <CAG48ez0GhqL=z+UuxgGeEVcR6HBcsTHg2EmcZHLZMmedhH3fXw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAG48ez0GhqL=z+UuxgGeEVcR6HBcsTHg2EmcZHLZMmedhH3fXw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jann Horn <jannh@google.com>
Cc: reiserfs-devel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, security@kernel.org, Al Viro <viro@zeniv.linux.org.uk>, jeffm@suse.com, kernel list <linux-kernel@vger.kernel.org>, ebiggers@google.com

Hi Jann,

On Fri, Aug 10, 2018 at 05:19:38AM +0200, Jann Horn wrote:
> On Thu, Aug 2, 2018 at 5:16 PM Jann Horn <jannh@google.com> wrote:
> >
> > This fixes the following issues:
> >
> >  - When a buffer size is supplied to reiserfs_listxattr() such that each
> >    individual name fits, but the concatenation of all names doesn't
> >    fit, reiserfs_listxattr() overflows the supplied buffer. This leads to
> >    a kernel heap overflow (verified using KASAN) followed by an
> >    out-of-bounds usercopy and is therefore a security bug.
> >  - When a buffer size is supplied to reiserfs_listxattr() such that a name
> >    doesn't fit, -ERANGE should be returned. But reiserfs instead just
> >    truncates the list of names; I have verified that if the only xattr on
> >    a file has a longer name than the supplied buffer length, listxattr()
> >    incorrectly returns zero.
> >
> > With my patch applied, -ERANGE is returned in both cases and the memory
> > corruption doesn't happen anymore.
> >
> > Credit for making me clean this code up a bit goes to Al Viro, who pointed
> > out that the ->actor calling convention is suboptimal and should be
> > changed.
> >
> > Fixes: 48b32a3553a5 ("reiserfs: use generic xattr handlers")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jann Horn <jannh@google.com>
> 
> +security@
> Ping. I have not received any replies to this patch, which fixes a
> kernel security bug, for a week.
> Whose tree should this go through? reiserfs is marked as "supported",
> but does not have a maintainer or a git repo listed, just a
> mailinglist, so I guess it probably has to go through either Al Viro's
> or akpm's tree? Looks like akpm signed off on the last commits in
> reiserfs...

I think Andrew's tree makes the most sense for this, but perhaps we should
also patch MAINTAINERS so mark it as "Orphan"? Patch below.

Will

--->8

From 07fbb021d5bbfe623fad10073b55704bda8e1f3d Mon Sep 17 00:00:00 2001
From: Will Deacon <will.deacon@arm.com>
Date: Mon, 13 Aug 2018 18:31:50 +0100
Subject: [PATCH] MAINTAINERS: Mark reiserfs as Orphan

Reiserfs has no Maintainer and random fixes tend to be merged through
with Andrew or Al's tree. Demote the filesystem to "Orphan", since it's
clear no longer supported by anybody.

Reported-by: Jann Horn <jannh@google.com>
Signed-off-by: Will Deacon <will.deacon@arm.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 544cac829cf4..b4fcc19cfb52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12077,7 +12077,7 @@ F:	include/linux/regmap.h
 
 REISERFS FILE SYSTEM
 L:	reiserfs-devel@vger.kernel.org
-S:	Supported
+S:	Orphan
 F:	fs/reiserfs/
 
 REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM
-- 
2.1.4
