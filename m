From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 and grub2
Date: Mon, 18 Oct 2010 14:04:51 +0200
Message-ID: <4CBC37E3.3050301@gmail.com>
References: <712869e4bd3f8a89f431df5ffb8097b9@cs.karelia.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <712869e4bd3f8a89f431df5ffb8097b9@cs.karelia.ru>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: sannikov <sannikov@cs.karelia.ru>
Cc: reiserfs-devel@vger.kernel.org

sannikov wrote:
> Good day.
>   

Hello.

> I want to ask you about reiser4 and grub-2.
>
> I am try to write to Yuriy Umanets but his mailboxes are inactive...
> Some few days ago I findes his request about this.
> (http://lists.gnu.org/archive/html/grub-devel/2008-02/msg00263.html)
>
> If it is possible, can you describe current state of Raiser4 support in
> Grub2.
>   

Unsupported.

> As I know this task yet  placed in Grub's TODO list.
> I hope this idea yet alive.
>   

I didn't look at grub2/fs interface yet, but believe that it
is better then grub1's one.

There is a patch for reiser4 support in grub1. I don't
think it will be a big problem to adjust this one for grub2:
the sources are quite understandable.

The only thing I am unhappy with is that it can not boot
reiser4 via module stage1_5 (it is too big and can not
fit in 62 sectors), It means that user will need to re-install
grub every time after defragmentation (currently
unsupported, but upcoming). So it would be nice to resolve
this problem in grub2 somehow.

Btrfs stage1_5 module with multi-device support
successfully fits in 62 sectors. Why reiser4 can not?
I think we need to get rid of the mini-library with a lot
of unneeded functions and put everything in one file
(as other file systems do).

Thanks,
Edward.

> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

