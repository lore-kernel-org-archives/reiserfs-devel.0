From: Christian Kujau <evil@g-house.de>
Subject: vpf-10680, minor corruptions
Date: Wed, 18 Jun 2003 16:45:15 +0200
Message-ID: <3EF07AFB.8060303@g-house.de>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14606-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Hi,

i'm running linux 2.5.70/2.5.72 and have a 2GB fs with Reiserfs on it.
from time to time reiserfsck the fs and some corrutions came up, which 
were fixed as suggested by --fix-fixable.
how comes? the data on the fs is not that important, it's a cache for 
Debian packages. I'm just curious _why_ there are corruptions anyway, 
since there is not even heavy load on the fs.


lila:~# reiserfsck /dev/sde2
<--------reiserfsck 3.6.6, 2003-------->

[...]

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
###########
reiserfsck --check started at Wed Jun 18 16:32:20 2003
###########
Replaying journal..
0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps differs.
Checking Semantic tree:
/debian/dists/woody/main/binary-powerpc/Packages.gzvpf-10680: The file 
[2256 3144] has the wrong block count in the StatData (3344), should be 
(1680)
/source/Sources.gzvpf-10680: The file [2275 2349] has the wrong block 
count in the StatData (1432), should be (720)
/contrib/binary-powerpc/Packages.gzvpf-10680: The file [2225 523] has 
the wrong block count in the StatData (80), should be (40)
/source/Sources.gzvpf-10680: The file [2246 2785] has the wrong block 
count in the StatData (48), should be (24)
/non-free/binary-powerpc/Packages.gzvpf-10680: The file [2289 2782] has 
the wrong block count in the StatData (104), should be (56)
/source/Sources.gzvpf-10680: The file [2310 2471] has the wrong block 
count in the StatData (56), should be (32)
/non-US/dists/woody/non-US/main/binary-powerpc/Packages.gzvpf-10680: The 
file [2627 2495] has the wrong block count in the StatData (88), should 
be (48)
finished 

9 found corruptions can be fixed with --fix-fixable
###########
reiserfsck finished at Wed Jun 18 16:32:35 2003
###########
lila:~#


(--fix-fixable fixed all corruptions, none left).
the machine was booted yesterday evening, and is booted once in a week 
or so. it's an Alpha/EV45, Debian testing on it, glibc 2.3.1.


Thanks,
Christian.

