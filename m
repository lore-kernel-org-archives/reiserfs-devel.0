From: Markus Hiereth <markus.hiereth@ngi.de>
Subject: Identify Superblock
Date: Thu, 22 Sep 2005 01:11:03 +0000
Message-ID: <20050922011103.GA6789@lune>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26224-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello,

as YaST and fdisk showed different output for the partions of my
hard-disk, I got confused and lost the correct start point for my
partition /dev/hda5.

Recreation of superblocks by reiserfsck --rebuild-sb creates a
superblock, but afterwards, --rebuild-tree terminates with a message
that no metadata can be found. 

Now I am trying to find out which of the blocks is the superblock. I
made first attempts with
a) copying using the command dd and then
b) use of grep ReIsEr2Fs as search string on blocks of 4096 bytes.

Techical background information
 reiserfs: 3.6.9
 Kernel: 2.4.21
 Hard disk: Maxtor 9084006
 
Is this a possible approach?

Thanks for Your help
Markus Hiereth

Braunschweig, Germany
