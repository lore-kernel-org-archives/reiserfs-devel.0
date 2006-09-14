From: Payal Rathod <payal-fs@scriptkitchen.com>
Subject: a bit OT: traditional Unix filesystems
Date: Thu, 14 Sep 2006 13:05:44 -0400
Message-ID: <20060914170544.GA7793@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29886-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,
I have a small OT query on working of traditional filesystem of Unix.
Can someone comment/correct me on the query below?

If i type $ cat /tmp/payal.txt (according to my knowledge) inode of / is 
found out (2) from super-block. From there physical location of "/" is 
read (i.e. the directory entry) and from there inode of tmp is found 
out. Then directory entry of tmp is read and inode of payal.txt is found 
out and then data blocks of that file are read.
Am I correct in this?

Now if tmp is on different partition or harddisk, how will directory 
entry of "?" point it out exactly? As far as I know, directory entry 
contains names and inode number and not the device details, then how 
does it exactly work? I googled a lot for it, but didn't find exact 
answer. Can someone please explain?

With warm regards,
-Payal

