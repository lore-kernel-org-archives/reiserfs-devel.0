From: Gorazd Golob <gorazdg@noviforum.si>
Subject: reiser3 and O_DIRECT read
Date: Fri, 7 Oct 2005 12:13:05 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510071208030.1805@dacun.noviforum.si>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26419-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

re!

Are we looking on wrong suspect - snip from code looks like this:

fd = open(f, O_RDONLY | O_DIRECT, 0);

and is not working for reiserfs3 filesystem?

Or in other words is reiserfs3 supporting reading with O_DIRECT flag? 
Writing works well with 0_DIRECT on reiserfs3.

Gorazd

