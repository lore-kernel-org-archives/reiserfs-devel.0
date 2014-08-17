From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] [PATCHv2 0/7] reiser4: batch discard support (FITRIM ioctl):
 initial implementation.
Date: Sun, 17 Aug 2014 22:25:07 +0200
Message-ID: <53F10FA3.7050507@gmail.com>
References: <1408292795-1841-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=/Lw6tBLJlrFLYixr8Cg/4fauHiXlVnIiU8iq4a//t0M=;
        b=dkgIPB+XDfzcjclg31xTd2R/b+xYJOHirxtspDoRsYYWuVT526IGtDL9d/O1MvvdUc
         ossL2B6Bnx0uE1kajeJ7bun8hxINYJ6/aZDe+7+2Vv9d5DTTPcu5F5WuvRjIg4m9kAjT
         A+TL4Ebi5Px0ah56veKpxEHq2FLHVTEIo1lX57B4gpb+vloGh0lEk24BWHgMBMZtM0dB
         wd25jc/i31Fv7ZfUdrZfu0ZEcresYBjjNXROHVpXmBstf6Vf925mcknEOdB6rqPJ8GOC
         IL2Np/kvdbdh1645TJ2bGlMGnH+4kmJYsLIO4C96Vn/T96dKfjKWongHHPLTZoYH3o8L
         zmYw==
In-Reply-To: <1408292795-1841-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org

Great, thanks!
I'll take a look at leisure.
What is the status of this code? Did you test it?

Edward.


On 08/17/2014 06:26 PM, Ivan Shapovalov wrote:
> This patch series implements FITRIM ioctl support in reiser4.
>
> The FITRIM ioctl is supposed to be applied to any directory inside the target
> filesystem. At least, this can be deduced from `fstrim` utility behavior on
> mainstream filesystems (e. g. ext2/3/4).
>
> The idea of implementation is per Edward's advices: FITRIM handler iteratively
> grabs a portion of disk space, sequentially allocates extents within grabbed
> space and commits the resulting atom. This way we avoid starving concurrent
> processes of the disk space. This process is repeated until the partition has
> been fully scanned and processed.
>
> Points I'm really uncertain of:
> - grabbing fixed amount of space (new BA_SOME_SPACE flag, grabs 25% of disk space)
> - creation of empty atoms (reiser4_create_atom())
> - handling of empty atoms in commit_current_atom()
>
> v2: - fix PATCH 5/7 "reiser4: txnmgr: call reiser4_post_write_back_hook() for empty atoms."
>        * fix a typo
>        * release atom spinlock before calling reiser4_post_write_back_hook()
>
> Ivan Shapovalov (7):
>    reiser4: block_alloc: add BA_SOME_SPACE flag for grabbing a fixed amount of space.
>    reiser4: block_alloc: add a "forward" parameter to reiser4_blocknr_hint to allocate blocks only in forward direction.
>    reiser4: txnmgr: free allocated but unneeded atom in atom_begin_and_assign_to_txnh().
>    reiser4: txnmgr: add reiser4_create_atom() which creates an empty atom without capturing any nodes.
>    reiser4: txnmgr: call reiser4_post_write_back_hook() for empty atoms.
>    reiser4: batch discard support: add a dummy FITRIM ioctl handler for directories.
>    reiser4: batch discard support: actually implement the FITRIM ioctl handler.
>
>   fs/reiser4/block_alloc.c         |   6 ++
>   fs/reiser4/block_alloc.h         |  10 ++-
>   fs/reiser4/plugin/dir/dir.h      |   2 +
>   fs/reiser4/plugin/file_ops.c     |  62 ++++++++++++++++++
>   fs/reiser4/plugin/object.c       |   6 +-
>   fs/reiser4/plugin/space/bitmap.c |   3 +-
>   fs/reiser4/super_ops.c           | 131 +++++++++++++++++++++++++++++++++++++++
>   fs/reiser4/txnmgr.c              |  57 +++++++++++------
>   fs/reiser4/txnmgr.h              |   2 +
>   9 files changed, 255 insertions(+), 24 deletions(-)
>

