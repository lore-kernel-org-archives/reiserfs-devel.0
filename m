From: Michael Weissenbacher <webmaster@dermichi.com>
Subject: reiser4 corruption problem (maybe related to "Broken reiser4 FS")
Date: Fri, 27 Aug 2004 01:15:08 +0200
Message-ID: <412E6EFC.3070600@dermichi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20838-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

i've tested reiser4 on a spare partition to see how well it would work 
for me. unfortunately i hit some corruption problem. it seems perfectly 
reproducable, so hardware error is very unlikely.

first some details on my system:
AMD Athlon(tm) XP 2400+
512 MB DDR-RAM (tested with memtest)
MSI K7N2G board (nforce2 chipset)
hard disk for testing: MAXTOR 6L080J4 (80GB), partitioned like:
    Device Boot      Start         End      Blocks   Id  System
/dev/hdb1               1        4866    39086113+  83  Linux
/dev/hdb2            4867        9732    39086145   83  Linux
criminal mnt # uname -a
Linux criminal 2.6.8.1-mm4 #4 Wed Aug 25 01:34:48 CEST 2004 i686 AMD 
Athlon(tm) XP 2400+ AuthenticAMD GNU/Linux
the distro is gentoo and i use reiser4progs1.0.1

the test i did is rather simple: i have a 2.3GB .tar.bz2 file that 
cotains 66588 files and about 3.1GB of data. in the first test i 
formatted /dev/hdb1 as reiser4 and /dev/hdb2 as reiser3. i extracted the 
.tar.bz2 on both of them. after that i umounted both and ran a fsck on 
them. the reiser3 partition was ok, but the reiser4 partition was 
corrupted.

ok, but what's really intersting now:
i reformatted both partitions and switched hdb1 to reiser3 and hdb2 to 
reiser4. i extracted the same file on both and what happens? exaclty the 
same corrutions now on hdb2 (at least the count is the same and the 
errors look very similar)! and again reiser3 is ok!

i put the output of both tests into a file that is available at
http://www.dermichi.com/ablage/reiser4/reiser4_troubles.txt

i've already had the exact same problems before, i mean errors like:
FSCK: Directory [109e8:416c7400000000:109ee] (dir40), node [216782], 
item [1],
unit [22]: entry has wrong offset
[109ee:0(NAME):142657765726275:6e6746fc72416e77:135160352fe624]. Should be
[109ee:0(NAME):142657765726275:6e6746fc72416e77:13514d8cfe19f4].
while doing random other things on reiser4 partitions and fsck'ing 
afterwards. using --build-fs created lots of files under lost+found and 
i started over. i will leave the fs this time, maybe i can try some 
things to find the cause of the problem.

anyone got an idea?

thanks,
michael weissenbacher
