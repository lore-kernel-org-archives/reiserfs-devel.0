From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfs_read_inode2: dead inode read from disk
Date: Mon, 29 Apr 2002 19:30:26 +0400
Message-ID: <20020429193026.A1684@namesys.com>
References: <x1w4rhuep0g.fsf@alone.msiu.ru>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10193-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <x1w4rhuep0g.fsf@alone.msiu.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Basil A. Evseenko" <evseenko@msiu.ru>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Apr 29, 2002 at 03:13:35PM +0400, Basil A. Evseenko wrote:

> clm-6004: convert tail failed inode 2300597, error -122

This one failed because of disk quota exceed. Safe to ignore I assume.

> vs-13075: reiserfs_read_inode2: dead inode read from disk [3547658 9266355 0x0 SD]. This is likely to be race with knfsd. Ignore

This one is safe, as it told you already.

> vs-2100: add_save_link:search_by_key ([-1 9266355 0x1001 DIRECT]) returned 1
> PAP-5660: reiserfs_do_truncate: wrong result -1 of search for [3547658 9266355 0xfffffffffffffff DIRECT]
> vs-5355: reiserfs_delete_solid_item: [3547658 9266355 0x0 SD] not found

This one seems to be some kind of race. We have yet to found a way to reproduce.
But it's quite safe, anyway.

Bye,
    Oleg
