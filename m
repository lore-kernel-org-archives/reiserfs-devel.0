From: Preston Lord <webmaster@t2.net>
Subject: Bad Blocks?
Date: 30 Oct 2002 11:35:00 -0600
Message-ID: <1035999303.1204.31.camel@preston>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11841-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I am running the latest reiserfsprogs 3.6.4

I came home last week to find my Linux pc was locked up. After rebooting
the root partition would not mount. All other partitions are fine. I
have the failed hard drive in another linux pc now and am trying to
recover the data from the failed partition. When I run

reiserfsck --check /dev/hda5

I get this:

The problem has occurred looks like a hardware problem.
Check your hard drive for badblocks.

bread: Cannot read the block (16).


how can I fix this bad block?

Linux Kernel 2.4.18

Thanks

Preston

-- 

Regards

Preston Lord
Programmer/Developer
Network Specialist
_______________
General Manager
Double T Computer Services
Sask, Canada
1.306.773.2054
http://www.t2.net

