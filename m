From: "Omri Schwarz" <ocschwar@MIT.EDU>
Subject: fsck.reiserfs on a frotzed partition image.
Date: Wed, 11 Aug 2004 14:20:04 -0400
Sender: ocschwar@MIT.EDU
Message-ID: <200408111820.i7BIK417013810@all-night-tool.mit.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20208-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi, everyone, 

I have an image of a reiserfs partition from a bad drive. The beginning 
1GB of the partition are where data corruption occurred, which makes my 
chances of recovering data to be less than good. Nevertheless, it is worth a 
shot.
I have the image living somewhere safe, and can rewrite it to a drive and 
re-fsck it as many times as it takes, with whatever options might be 
worth a try, in whatever combination. So far, a plain fsck --rebuild-tree
fills up lost+found with files whose contents are mixed together. I've
only found 5 files that were complete. But, when I do it I get a filesystem
that is 50% in use (out of 47GB).

I'm willing to try a shotgun approach, because there are some manuscripts and
source code versions in there that I would like to rescue. So if there are
more incantations I should try, please let me know. I'll try'em all. 

Thanks in advance,

Omri Schwarz

