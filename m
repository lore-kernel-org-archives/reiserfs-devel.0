From: Jack Byer <ojbyer@usa.net>
Subject: reiser4 resize
Date: Mon, 18 Sep 2006 20:12:14 -0500
Message-ID: <eeng4b$i68$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29934-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Short summary: Will a resize program for reiser4 be available within the
next six months?

Long explanation:

I use a 3ware SATA raid card for the main storage on my home network. I
currently have 8 250 GB drives in a raid 5 + hot spare configuration. I
 chose this card because it allows for online capacity expansion. My
plan was to wait until a few generations of hard drives emerged then
upgrade them one at a time in cycles. This way my storage will
periodically expand without any major downtime.

When I first created the filesystem, there was a reiser4 resize program.
This is no longer the case.

I've began my next upgrade cycle with the purchase of two 750 GB drives.
I plan to buy one each month until all eight are replaced. Now I need to
make a decision. Do I backup my raid onto the new drives and reformat my
raid with another filesystem (xfs, reiser3, jfs), or do I put these new
drives into the array and assume that when the time comes to resize the
filesystem that a working program will exist?

