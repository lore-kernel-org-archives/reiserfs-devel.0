From: Omry Yadan <omry_y@inter.net.il>
Subject: does "reiserfsck --rebuild-sb" require free space?
Date: Mon, 06 Dec 2004 00:39:44 +0200
Message-ID: <41B38E30.3060308@inter.net.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22680-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I have a partial image of a reiserfs partition which takes up all the 
space on the (reiserfs) parition it sits on.
there are 0 bytes free on that partition.
the image was created with dd, and I ran out space when creating it.
when I try to run
reiserfsck --rebuild-sb backup.img
I get the error
bwrite: write 4096 bytes returned -1 (block=16, dev=3): No space left on 
device

does that make sense?

     Omry.
