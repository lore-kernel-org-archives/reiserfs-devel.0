From: "Vincenzo Martena" <martena@elet.polimi.it>
Subject: disk failure
Date: Mon, 28 Apr 2003 11:33:52 +0200
Message-ID: <web-2465822@elet.polimi.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-13848-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi, I'm in big trouble with my hard disk.

I think there is some hardware failure, because 

reiserfsck --rebuild-tree

give out this error message:
--------------------------------------------------------------------------------------------------
reiserfsck --rebuild-tree started at Mon Apr 28 17:22:46 
2003
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 1788932 blocks marked used
Skipping 8272 blocks (super block, journal, bitmaps) 
1780660 blocks will be read
0%. 
                                                    left 
1641240, 1152 /sec
bread: Cannot read a block # 218118.



Aborted
-------------------------------------------------------------------------

Now the problem is that I cannot acces my hard disk, 
because the journal is totally absent. Do you know if 
there is some option I can give to reiserfsck in order to 
ignore the hardware error and keep rebuilding the tree?

Thanks a lot for your help.

Vinxe

P.S. reiserfsck version is:

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.3
