From: "David D. Huff Jr." <David.Huff@computer-critters.com>
Subject: --rebuild-tree, out of disk
Date: Sat, 10 Jan 2004 16:17:51 -0500
Message-ID: <40006BFF.2060502@computer-critters.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16441-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I've used cfdisk to change change the size of the partition but
resize_resierfs fails even when -f is used.

Any suggestions on how to minimize space usage?

I'd rather mark the partition clean, then run resize_reiserfs followed
by reiserfsck --rebuild-tree but I don't know how.

Suggestions welcome.

