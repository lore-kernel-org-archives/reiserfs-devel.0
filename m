From: Oleg Drokin <green@namesys.com>
Subject: Re: Lost 30GB reiserfs partition :(
Date: Mon, 19 Aug 2002 17:16:30 +0400
Message-ID: <20020819171630.A7457@namesys.com>
References: <000b01c24781$0bc68cb0$e201a8c0@mcmarketing.at>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11238-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <000b01c24781$0bc68cb0$e201a8c0@mcmarketing.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gerald Leier <gleier@mcmarketing.at>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Aug 19, 2002 at 03:05:09PM +0200, Gerald Leier wrote:

> on saturday i turned my computer on (running linux 2.4.18)
> and couldnt access my data partition (all my documents,
> midi and mp3 files i collected in the last 4 years).
> i tried to mount the reiserfs partition by hand but mount
> made my terminal freeze.

Anything in the logs?

> So i tried reiserfsck. There was some problem with superblock
> so i did a reiserfsck --rebuild-sb /dev/hdd1. That stopped
> after a few seconds with a segmentation fault.
> I was told, before --rebuild-sb segfaulted, that i have to do a
> --rebuild-tree to after rebuild-sb finishes.

Can you please try to capture filesystem metadata snapshot for us to look at?
you can do it by debugreiserfs -p /dev/hdd1 | gzip -9c >metadata.gz
And then let us know how we can obtain that metadata.gz file.

Bye,
    Oleg
