From: Alexander Saers <alex@saers.com>
Subject: bad blocks
Date: Mon, 17 Jun 2002 17:19:18 +0200 (CEST)
Message-ID: <20020617171628.C74247-100000@doriath.saers.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10758-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello

It seams that my harddrive have some bad sectors. I therefore made some
researche on how to handle it. I found this peace of information

http://www.reiserfs.org/bad-block-handling.html

But this only makes the sectors busy and the next reiserfsck will then
detect this and remove the bussy mark. Isnt there a way to create files on
the bad sectors so that nobody uses them. Not even in the future after a
reiserfsck. Like if i have a folder on the drive that says
/badblocks/sector8004
/badblocks/sector8010
etc etc

Thanx fo a good filesystem

/Alexander


