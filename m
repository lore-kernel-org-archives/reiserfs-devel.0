From: Isaac Chanin <chanin@WPI.EDU>
Subject: Re: AMD64/Reiser4 testing and problems
Date: Tue, 21 Dec 2004 00:46:49 -0500 (EST)
Message-ID: <Pine.LNX.4.44.0412210016220.20178-100000@ccc9.wpi.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22867-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Hello Alex et al,

After my last e-mail was so useless I figured I would follow it up with 
a more useful one, so what I've attempted to do is build and entire AMD64 
system on top of reiser4 (aside from boot, still ext2 there), and, in the
process I've run into two more bugs.


The first bug would give output (without resier4 debugging options 
enabled) like:

Dec 20 02:33:14 [kernel] reiser4[portageq(31681)]: traverse_tree 
(fs/reiser4/search.c:789)[nikita-373]:
Dec 20 02:33:14 [kernel] reiser4[portageq(31681)]: traverse_tree 
(fs/reiser4/search.c:755)[nikita-1481]:

over and over until the system was rebooted (whatever process - it has so 
far happened with portageeq, wget, and i think nano - becomes completely 
unresponsive to all kill signals and takes 100% cpu time.)

So far I have absolutely no clue when this bug occurs, as it seems to pop 
up completely randomly (copying a large file from one reiser4 logical 
partition to another, wget'ing a tiny file to a reiser4 partition.)  About 
the only connection I could find was with writing to the filesystem.

I could only produce this bug on 2.6.10-rc2-mm4; linux-2.6.10-rc3-mm1 
(both with Alex's patch) would boot (onto reiser3) but wouldn't do much
else.


This leads nicely into the other bug, which is that it does not seem 
possible to boot into a resier4 system (ext2 for boot, resier4 for /, et 
cetera) on an AMD64.  I don't have any log output as the system hangs 
before it can load the logger, and no screen output because my laptop (no
matter what framebuffer configuration I use) has a completely black boot-up
screen until after the initial kernel loading is complete.  Neither 
2.6.10-rc2-mm4 nor linux-2.6.10-rc3-mm1 can get any farther in the booting 
process either.

It occured to me that this could simply be happeneing because of all of 
the failures the partitions had while getting the system installed on them 
(though fsck.resier4 seemed to handle them all nicely, at the time.)  So 
perhaps this bug is not really a bug, and more of a misconfiguration on my 
part - just a thought.


I'll put some full (with reiser4 debug options enabled in the kernel - 
still can't believe I forgot those) logs up at 
http://users.wpi.edu/~chanin/newr4log.txt once I can get the first bug to 
occur again (or if I can somehow get some output from the second.)  I 
should be able to get them up later tonight and if not then, probably 
sometime tomorrow.


Thanks,

Isaac

