From: David Masover <ninja@slaphack.com>
Subject: recovering from "rm -rf"
Date: Fri, 05 Aug 2005 15:08:27 -0500
Message-ID: <42F3C73B.9040808@slaphack.com>
References: <42F3A08A.30102@planet.nl> <42F3A16D.6090306@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25309-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F3A16D.6090306@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I've got a Reiser4 partition which I just moved (mv) a bunch of stuff
off of, onto another drive.  The other drive died immediately after.

I'm trying to repair the other drive, and to find any backups, but is
there a reasonable chance to recover from the good drive?  Maybe force
fsck.reiser4 to rebuild stuff... somehow?  It's sort of the equivalent
of an "rm -rf".
