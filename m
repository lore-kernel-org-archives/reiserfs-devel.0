From: Newsmail <newsmail@satimex.tvnet.hu>
Subject: big problem with loop-aes and reiserfs partitions
Date: Sun, 22 Dec 2002 22:21:37 +0100
Message-ID: <5.2.0.9.2.20021222221057.01cfeb90@pop.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12191-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

hello everybody,
I'm using loop-aes in conjunction with lvm 1.0.6 and reiserfs. each 
partition has its own loop device, that is lvm-ed after, and on top of all 
I have reiserfs. I'm using 2.4.20aa1.
when I was using 2.4.19 I had no problem at all. when Oleg introduced the 
new block allocation algorithm in 2.4.20-preX I tried it out and I got the 
same problems that I'm having now with 2.4.20 final. In the 2.4.20-preX 
times I tried out this on multiple machines and all of them seemed to give 
the same results. so the problem is: when I'm copying huge amount of data 
on the encrypted filesystem first ssh seems to hang, I reconnect and the 
process that made the copying hung too. after all this, I am unable to 
delete the file that was being written. or at least I think so, I'm not 
sure. in conjunction with all this, the load is around 5. if I try this out 
again, it hangs again, and the load goes up to 10. and so on. and after all 
of this clear reboot is impossible, I have to make a cold reboot. I'm sure 
that drives doesnt have a problem at all, hardware is in good condition. In 
the past I was able to reproduce those problems on more than one machines, 
I'm sure I could do this this time, or that you will be able too :) or I 
hope so.
Please give me some directions how to solve this problem, or tell me what 
informations do you require more about the system I use, or what tests 
should I do.
sincerely,
greg


