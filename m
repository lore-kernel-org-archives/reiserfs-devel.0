From: Piotr Neuman <sikkh@wp.pl>
Subject: [patch] Repacker stats
Date: Wed, 20 Oct 2004 21:59:46 +0200
Message-ID: <200410202159.46110.sikkh@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22115-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Alex Zarochentsev <zam@namesys.com>

Hi

This is my second attempt at repacker statistics, this time based on comments 
from Alex Zarochentsev (thanks ;-).

This patch allows reading of repacker stats while it is working. It creates 
two files in repacker sysfs hierarchy: formatted_nodes and unformatted_nodes, 
which correspond to the stats that repacker prints after it has finished.

Download:

http://kem.p.lodz.pl/~peter/reiser4_repacker_stats-2.patch

Regards

Piotr Neuman
