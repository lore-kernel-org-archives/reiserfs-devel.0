From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: kernel BUG at fs/reiser4/plugin/item/ctail.c
Date: Mon, 28 Jul 2008 18:31:34 +0400
Message-ID: <488DD846.70002@gmail.com>
References: <558.1643-13003-1386678025-1217242012@post.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <558.1643-13003-1386678025-1217242012@post.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Mr. Tao" <tao@post.cz>
Cc: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

Mr. Tao wrote:
> I just wanted to add sample of fsck failure:
>
> [103a3:2e4368616e6765:3ce4f] (ccreg40), node [721], item [10]: item of the wrong
> cluster size (-2147483648) found, Should be (65536).
> zsh: segmentation fault  fsck.reiser4 /dev/sda8
>
>   

Note, that data of logical cluster #249423 of the file (inode 66467) are
lost.
Maybe It makes sense to replace this file (it can be found, for example,
with "find -inum 66467") with a correct one..

Edward.
