From: Piotr Neuman <sikkh@wp.pl>
Subject: [patch] Repacker stats
Date: Sun, 17 Oct 2004 10:01:05 +0200
Message-ID: <200410171001.05150.sikkh@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22079-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi

This patch allows reading of repacker stats while it is working. It creates 
two files in repacker sysfs hierarchy: formatted_nodes and unformatted_nodes, 
which correspond to the stats that repacker prints after it has finished.

Download:

http://kem.p.lodz.pl/~peter/reiser4_repacker_stats.patch.bz2
or
http://kem.p.lodz.pl/~peter/reiser4_repacker_stats.patch

The patch seems pretty safe, though I wait for confirmation from zam on 
that ;-).

Regards

Piotr Neuman
