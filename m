From: Anders Widman <andewid@tnonline.net>
Subject: Re: reiserfsck bug?!? The block (.....) is in the tree already. Should not happen.
Date: Mon, 20 Jan 2003 18:04:13 +0100
Message-ID: <18491489390.20030120180413@tnonline.net>
References: <1043081969.1491.36.camel@symirna.uplink.ethz.ch>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12445-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1043081969.1491.36.camel@symirna.uplink.ethz.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: m96 <m96@gmx.li>
Cc: reiserfs-list@namesys.com

> hi,

> i'm new on the list and also not a reiserfs hacker. but i got the
> following problem on my box:

> after many frozen systems i thought it's on time to check the partition
> integrity with `reiserfsck --check <partition>' and it gave me one error
> that i can fix it only with rebuilding the tree. (i know i should make a
> backup but i didn't - and it was my usr partition... DAMN@!)

> so while running `reiserfsck --rebuild-tree <partition>' i got the
> following error in an infinite loop:


> do_pass_2: The block (1281151) is in the tree already, Should not
> happen.


> so i had to abort it with CTRL-C. and tried again - with the same luck -
> i stuck in the same loop. and since then i can't mount my partition.

> does any one a way to avoid a repartitioning?

What     reiserfs     tools     are      you     using?     Use    the
ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.4.tar.gz  or
a later version.

> if this is an unknown error, how can i provide you with more
> informations? think that this was my /usr so i'm limited to / and /var
> partitions.

> regards.

