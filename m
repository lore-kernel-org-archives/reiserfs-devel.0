From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: kernel BUG at fs/reiser4/plugin/item/ctail.c
Date: Mon, 04 Aug 2008 18:47:28 +0400
Message-ID: <48971680.2010906@gmail.com>
References: <558.1643-13003-1386678025-1217242012@post.cz>	 <488DD846.70002@gmail.com> <a08621850808040328o36ab4901m63a0d978a221e833@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <a08621850808040328o36ab4901m63a0d978a221e833@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dushan Tcholich <dusanc@gmail.com>
Cc: "Mr. Tao" <tao@post.cz>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

Dushan Tcholich wrote:
> Would it be possible if there would be a new version of fsck.reiser4
> to fix those false positives about wrong size when checking
> cryptocompress partitions?
>   

Yes,  per-file warnings about wrong i_bytes should be suppressed.
Fsck just should report at the end of work in default mode, that N wrong
i_bytes were detected and suggest to fix it with --fix option.
Anyone care to try to make a patch?

> There are some users that reported those and it's not comforting when
> your fs spews thousands of errors, even when someone tells you they're
> false.
>
> Oh and what about making cryptocompress default format on mkfs.reiser4 ?
>   

mm.. not sure. First, fsck should be fixed to remove unprepped items.
Mr. Tao, do you still have partitions that make fsck segfault?

Thanks,
Edward.
