From: =?koi8-r?Q?=22?=Andre=?koi8-r?Q?=22=20?=<hobgobik@mail.ru>
Subject: Reiserfs 2.2.19 2.4.21 reiserfsck problem
Date: Sat, 02 Aug 2003 10:21:26 +0400
Message-ID: <E19iple-00031K-00.hobgobik-mail-ru@f19.mail.ru>
Reply-To: =?koi8-r?Q?=22?=Andre=?koi8-r?Q?=22=20?=<hobgobik@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-15126-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi! 
I've got a lot of messages like: 
===CUT=== 
Checking Semantic tree: 
/cvs/cvsd/etc/cvsdvpf-10680: The directory [195 196] has the 
wrong block count in the StatData (8), should be (1) 
/init.dvpf-10680: The directory [195 198] has the wrong block 
count in the StatData (8), should be (1) 
vpf-10680: The directory [194 195] has the wrong block count 
in the StatData (8), should be (1) 
/man/man5vpf-10680: The directory [201 202] has the wrong 
block count in the StatData (8), should be (1) 
/man8vpf-10680: The directory [201 204] has the wrong block 
count in the StatData (8), should be (1) 
vpf-10680: The directory [194 201] has the wrong block count 
in the StatData (8), should be (1) 
/sbinvpf-10680: The directory [194 208] has the wrong block 
count in the StatData (8), should be (1) 
vpf-10680: The directory [193 194] has the wrong block count 
in the StatData (8), should be (1) 
... 
===CUT=== 
 
When I trying to run reiserfsck under Linux 2.4.21  
on reiserfs partition, which was build on Linux 2.2.19. 
On the old system with 2.2.19 all is ok. 
Unfortunatelly, I REALLY need to use this partition with 
2.2.19 and 2.4.21 systems. 
This partition is a common partition for all nodes of HA 
cluster. I'm working on upgrading all nodes 
in cluster from 2.2.x to 2.4.x now. 
Only one system(Master) can has "rw" access on 
this partition at one time. But if somthing goes wrong (power 
failure, hardware problems ...) with Master, one of the other 
nodes will trying to became a Master. At that time it will 
try to run fsck and check a shared partition against errors.  
So, in my situation it can be 2.2.19 or 2.4.21 system, while 
upgrade process is not finished.       
On 2.2.19 - ReiserFS version 3.5.33 
On 2.4.21 - ReiserFS version 3.6.25 
 
Any ideas? 
Thanks for your attention. 
 
 
