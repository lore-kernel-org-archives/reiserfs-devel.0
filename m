From: "Felix E. Klee" <felix.klee.reiserfs@gmx.net>
Subject: Identifying files with badblocks
Date: Sun, 8 Jun 2003 23:16:05 +0200
Message-ID: <200306082316.05818.felix.klee.reiserfs@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14497-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I am using a ReiserFS 3.6 formatted IBM-DJSA-220-ATA-harddisk with SuSE 
LINUX 8.2. Today, by using 
    badblocks -s /dev/hda under LINUX 
and IBM/Hitachi's
    Drive Fitness under DOS, 
I found that the drive contains a continuous section of bad blocks. The 
Drive Fitness Utility has an option to repair the corresponding sector but 
this will destroy all data in it. This is OK, but I need to know what data 
is destroyed so that I can recreate it later. So, now my question:

How do I find out which files correspond to certain bad blocks on my Reiser 
file system?

Felix

-- 
To contact me in private don't reply but send mail to
    felix DOT klee AT inka DOT de

