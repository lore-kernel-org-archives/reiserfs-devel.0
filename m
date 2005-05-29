From: Matthias Barremaecker <info@mh.be>
Subject: Reiserfs 1300G partition on lvm problem ...
Date: Sun, 29 May 2005 21:25:54 +0200
Message-ID: <429A1742.8030504@mh.be>
References: <1117392967.29669.ezmlm@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24206-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1117392967.29669.ezmlm@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

I have a huge problem.

setup : LVM with 8 disks

fs : reiserfs

All of the sudden it stoped working, I can't mount it anymore.

reiserfsck said it had 43 errors and I should do

    reiserfsck --rebuild-tree

what I did.

but that sais it is a fysical drive error

Point is : it is 1300 gig. and I can't mount it.

What can I do.

Thanx.
