From: Grant Miner <mine0057@mrs.umn.edu>
Subject: A file-based interface for mount
Date: Sat, 05 Jul 2003 21:52:33 -0500
Message-ID: <3F078EF1.6090908@mrs.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14837-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Would it make sense to use a file interface in the file system to 
control mounting?  Have a file that exists per-directory named ..mount 
(or something).  Then, to mount /dev/sda on /home, echo "/dev/sda rw" > 
/home/..mount
To unmount the file system, remove the line from the ..mounts file.  You 
could also do plan 9 layered mounts (with priorities) by putting 2 or 
more lines in that file.  The advantage is you could set access controls 
on each file to easily let non-root users perform mount at certain 
directories, and you don't need the mount and unmount commands anymore.

What do you think?

