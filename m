From: Hans Reiser <reiser@namesys.com>
Subject: We need help benchmarking and debugging reiser4
Date: Wed, 30 Oct 2002 11:30:31 +0300
Message-ID: <3DBF98A7.8060906@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11836-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Oleg Drokin <green@namesys.com>, Nikita Danilov <Nikita@Namesys.COM>

Can some of you help us by doing such things as replicating our 
benchmarks, and helping us debug it as we enter the last stretch before 
Halloween?

Nikita and Oleg will describe the details of what to do to replicate the 
benchmarks, please be sure to use reiser4 readdir order for writes to 
reiser4 (that means don't use tarballs made from ext2 (Remember that 
writes determine subsequent read performance.)), and to use the latest 
hard drives and fast processors with udma 5 turned on.  We are quite 
sensitive to transfer speed since we do a good job of avoiding seeks.  
We are sensitive to readdir order because we sort directory entries 
(which is necessary for having efficient large directory lookups).   In 
reiser4.1 we will ship a repacker, and then it won't matter what order 
you do writes in so long as the repacker gets a chance to run at night.  

-- 
Hans


