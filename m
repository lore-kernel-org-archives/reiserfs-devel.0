From: "B. J. Zolp" <bjzolp@wisc.edu>
Subject: reiaserfsck core dumps
Date: Sun, 11 Jan 2004 16:39:54 -0600
Message-ID: <4001D0BA.5020604@wisc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-16445-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: reiserfs-list@namesys.com

I have a LVM partition that I cannot seem to mount anymore.  Mount tells 
me the standard "Too many mounted files systems.... " message.  So I 
decided to run reiserfsck on it, well when i do that it soon crashes 
with this output:

[root@orion root]# reiserfsck /dev/vg0/logical0
reiserfsck, 2002 - reiserfsprogs 3.6.3Will read-only check consistency 
of the filesystem on /dev/vg0/logical0
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Sun Jan 11 15:19:58 2004
###########

bread: Cannot read a block # 119472128.



Aborted (core dumped)



Now, I am pretty sure the LVM is intact, all the drives are added 
correctly and all that is ok.  I ran badblocks on the partition and it 
gave me a list of about ~1000 badblocks.  Is there a way I can use this 
list of blocks to my advantage to recover this partition, I would like 
to get data from it.


Thanks



