From: Howard Shane <ozymandias@charter.net>
Subject: bug report
Date: Mon, 02 Dec 2002 13:40:21 -0600
Message-ID: <3DEBB725.4070907@charter.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12085-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

Your warning displayed when starting reiserfsck recommended a bug report 
when the program exits with an error or fails. I have a Maxtor 60 gb 
drive that I have had problems with for the last couple of days. Upon 
accessing a certain directory, whatever program I'm using (ls, file 
manager, dump) freezes, at which point I can't access anything on the 
mountpoint.  I get the following error on running reiserfsck (debian 
reiserfsprogs 3.6.4):

    reiserfsck --check started at Mon Dec  2 13:22:46 2002
    ###########
    Replaying journal..
    0 transactions replayed
    Checking internal tree../ 86 (of  88)/ 23 (of 170)
    The problem has occurred looks like a hardware problem.
    Check your hard drive for badblocks.

    bread: Cannot read the block (22148).

When trying --rebuild-tree:

    reiserfsck --rebuild-tree started at Mon Dec  2 13:28:59 2002
    ###########

    Pass 0:
    Loading on-disk bitmap .. ok, 4893046 blocks marked used
    Skipping 8656 blocks (super block, journal, bitmaps) 4884390 blocks 
will be read
    0%                                                         left 
4884389, 0 /se                                                      left 
4873744, 5323 /sec

...at which point reiserfsck freezes completely. I have already backed 
up the data on this disk, so I don't need any support, and since it 
looks like a hardware problem I will try reformatting the disk next. 
Hope this info is of some help.

PS, I have used ext2, ext3 and xfs and think that Reiserfs is by far the 
best high performance filesystem out there. Keep up the great work.

hs

