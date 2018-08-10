From: Jann Horn <jannh@google.com>
Subject: Re: [PATCH] reiserfs: fix broken xattr handling (heap corruption, bad retval)
Date: Fri, 10 Aug 2018 05:19:38 +0200
Message-ID: <CAG48ez0GhqL=z+UuxgGeEVcR6HBcsTHg2EmcZHLZMmedhH3fXw@mail.gmail.com>
References: <20180802151539.5373-1-jannh@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KH4RMPR0Uy0KQwVwsRjWEsvEaTUrpbpHoPb7j6AV/eY=;
        b=eg7dGrDjsh52mMkJ1qoH1Z1F4dM2V7KTL4KF8PGcIC86zb723/R36f7W1648YG6clM
         N5/wUhZKfu97Fuyc8Lgbzcb3mPwkX7t3aREya7svWDPY3TFNOCOzOw0afPy5VPTf/U9E
         Fnc1CZmGdtW6KomkKoRp8fHf1nFyuaNvUVZIFET+uCjr71RFYeoWDp7uix/pDwFXYY7T
         fw0W0kpQh482JsbmAlfqQmlhPth4bpbDJnzA2W0wjQwA5Fyc6osVFMwINRl08kx7n3Mk
         RK/ZFLJ+cKL1o290ubkQuYYozKfYisGs30l8ej4oHLLBcnrU8vOfiKiexd+5J4RDgHVe
         Copw==
In-Reply-To: <20180802151539.5373-1-jannh@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, security@kernel.org, Al Viro <viro@zeniv.linux.org.uk>, jeffm@suse.com
Cc: kernel list <linux-kernel@vger.kernel.org>, ebiggers@google.com

On Thu, Aug 2, 2018 at 5:16 PM Jann Horn <jannh@google.com> wrote:
>
> This fixes the following issues:
>
>  - When a buffer size is supplied to reiserfs_listxattr() such that each
>    individual name fits, but the concatenation of all names doesn't
>    fit, reiserfs_listxattr() overflows the supplied buffer. This leads to
>    a kernel heap overflow (verified using KASAN) followed by an
>    out-of-bounds usercopy and is therefore a security bug.
>  - When a buffer size is supplied to reiserfs_listxattr() such that a name
>    doesn't fit, -ERANGE should be returned. But reiserfs instead just
>    truncates the list of names; I have verified that if the only xattr on
>    a file has a longer name than the supplied buffer length, listxattr()
>    incorrectly returns zero.
>
> With my patch applied, -ERANGE is returned in both cases and the memory
> corruption doesn't happen anymore.
>
> Credit for making me clean this code up a bit goes to Al Viro, who pointed
> out that the ->actor calling convention is suboptimal and should be
> changed.
>
> Fixes: 48b32a3553a5 ("reiserfs: use generic xattr handlers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jann Horn <jannh@google.com>

+security@
Ping. I have not received any replies to this patch, which fixes a
kernel security bug, for a week.
Whose tree should this go through? reiserfs is marked as "supported",
but does not have a maintainer or a git repo listed, just a
mailinglist, so I guess it probably has to go through either Al Viro's
or akpm's tree? Looks like akpm signed off on the last commits in
reiserfs...

> ---
> Triggering the bug:
>
> root@debian:/home/user# mount -o user_xattr reiserimg reisermount/
> root@debian:/home/user# cd reisermount/
> root@debian:/home/user/reisermount# touch test_file
> root@debian:/home/user/reisermount# setfattr -n user.foo1 -v A test_file
> root@debian:/home/user/reisermount# setfattr -n user.foo2 -v A test_file
> root@debian:/home/user/reisermount# setfattr -n user.foo3 -v A test_file
> root@debian:/home/user/reisermount# setfattr -n user.foo4 -v A test_file
> root@debian:/home/user/reisermount# setfattr -n user.foo5 -v A test_file
> root@debian:/home/user/reisermount# setfattr -n user.foo6 -v A test_file
> root@debian:/home/user/reisermount# cat xattr_test.c
> #include <sys/types.h>
> #include <attr/xattr.h>
> #include <err.h>
> #include <stdio.h>
> #include <string.h>
> int main(int argc, char **argv) {
>   if (argc != 2) errx(1, "bad invocation");
>   char list[10];
>   int res = listxattr(argv[1], list, sizeof(list));
>   if (res == -1)
>     err(1, "listxattr failed");
>   printf("listxattr returned %d\n", res);
>   for (char *p = list; p < list+res-1; p = p + strlen(p) + 1) {
>     printf("list entry: %s\n", p);
>   }
> }
> root@debian:/home/user/reisermount# gcc -o xattr_test xattr_test.c
> root@debian:/home/user/reisermount# ./xattr_test test_file
> Segmentation fault
> root@debian:/home/user/reisermount#
>
> Result:
>
> [  122.071318] ==================================================================
> [  122.072334] BUG: KASAN: slab-out-of-bounds in listxattr_filler+0x170/0x1b0
> [  122.073173] Write of size 9 at addr ffff8801c43b474a by task xattr_test/923
> [  122.074030]
> [  122.074223] CPU: 1 PID: 923 Comm: xattr_test Not tainted 4.18.0-rc7+ #67
> [  122.075050] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1 04/01/2014
> [  122.076107] Call Trace:
> [  122.076453]  dump_stack+0x71/0xab
> [  122.076900]  print_address_description+0x6a/0x250
> [  122.077514]  kasan_report+0x258/0x380
> [  122.077961]  ? listxattr_filler+0x170/0x1b0
> [  122.078469]  memcpy+0x34/0x50
> [  122.078894]  listxattr_filler+0x170/0x1b0
> [...]
>
>  fs/reiserfs/xattr.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
> index ff94fad477e4..48cdfc81fe10 100644
> --- a/fs/reiserfs/xattr.c
> +++ b/fs/reiserfs/xattr.c
> @@ -792,8 +792,10 @@ static int listxattr_filler(struct dir_context *ctx, const char *name,
>                         return 0;
>                 size = namelen + 1;
>                 if (b->buf) {
> -                       if (size > b->size)
> +                       if (b->pos + size > b->size) {
> +                               b->pos = -ERANGE;
>                                 return -ERANGE;
> +                       }
>                         memcpy(b->buf + b->pos, name, namelen);
>                         b->buf[b->pos + namelen] = 0;
>                 }
> --
> 2.18.0.597.ga71716f1ad-goog
>
