From: Oleg Drokin <green@namesys.com>
Subject: Re: BUG: uncorrectable/undetectable damage by reiserfsck
Date: Wed, 7 Aug 2002 10:02:35 +0400
Message-ID: <20020807100235.A25242@namesys.com>
References: <1028663930.11027.ezmlm@namesys.com> <20020807050535.GA541@home>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11137-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020807050535.GA541@home>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Radim Kolar <hsn@cybermail.net>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Aug 07, 2002 at 07:05:35AM +0200, Radim Kolar wrote:

> home:/mnt/home-bk/hsn/.gimp-1.2/gimpressionist# ls
> is_leaf: wrong item type for item *3.5*[45156 16306 0x1 IND], item_len 4, item_location 1698, free_space(entry_count) 0
> vs-5150: search_by_key: invalid format found in block 431754. Fsck?
> vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat data of [45143 45144 0x0 SD]
> ls: Paper: Permission denied
> is_leaf: wrong item type for item *3.5*[45156 16306 0x1 IND], item_len 4, item_location 1698, free_space(entry_count) 0
> vs-5150: search_by_key: invalid format found in block 431754. Fsck?
> vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat data of [45143 45145 0x0 SD]
> ls: Brushes: Permission denied

Can you please make a metadata snapshot from that filesystem
(debugreiserfs -p /dev/device | gzip -9c >metadata.gz) and make that available
for download.

Also do you have any ideas which operations previosly performed possibly
might lead to this (or what was done prior to these errors to be observed
first).

Thank you for the report.

Bye,
    Oleg
