From: Vanuxem =?ISO-8859-1?Q?Gr=E9gory?= <g.vanuxem@wanadoo.fr>
Subject: nikita-494 with reiser4-for-2.6.16-4.patch.gz
Date: Fri, 16 Jun 2006 15:03:56 +0200
Message-ID: <1150463036.3743.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28801-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I have encountered the following warnings with the
reiser4-for-2.6.16-4.patch.gz on kernel 2.6.16.20.

Jun 14 17:13:20 localhost kernel: reiser4[find(3814)]: parse_node40
(fs/reiser4/plugin/node/node40.c:673)[nikita-494]:
Jun 14 17:13:20 localhost kernel: WARNING: Wrong level found in node:
2 != 1
Jun 14 17:13:20 localhost kernel: reiser4[find(3814)]: parse_node40
(fs/reiser4/plugin/node/node40.c:673)[nikita-494]:
Jun 14 17:13:20 localhost kernel: WARNING: Wrong level found in node:
2 != 1
Jun 14 17:13:20 localhost kernel: reiser4[find(3814)]: parse_node40
(fs/reiser4/plugin/node/node40.c:673)[nikita-494]:
Jun 14 17:13:20 localhost kernel: WARNING: Wrong level found in node:
2 != 1

A fsck of the filesystem returns nothing wrong. These warnings have not
been reproduced, they probably occurred during a cron job.

So is it a known issue and what is the meaning of this warning ?

I stopped to use this patch and I'm continuing to use the -2 patch (no
warnings).

Cheers,

Greg

