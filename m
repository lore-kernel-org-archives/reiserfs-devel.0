From: "Willi W." <willi.w@gmx.at>
Subject: Application Problems with Reiser4/19.01.2004-fixed
Date: Thu, 22 Jan 2004 20:16:28 +0100
Message-ID: <4010218C.9090006@gmx.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16611-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi!

i installed snapshot 19.01.2004 (-fixed) on my gentoo box, kernel is a 
gentoo-2.6.1

CONFIG_REISER4_FS=y
# CONFIG_REISER4_FS_SYSCALL is not set
CONFIG_REISER4_LARGE_KEY=y
# CONFIG_REISER4_CHECK is not set
CONFIG_REISER4_USE_EFLUSH=y
# CONFIG_REISER4_COPY_ON_CAPTURE is not set
# CONFIG_REISER4_BADBLOCKS is not set

libaal and reiser4progs are from the same snapshot

i created a new partition with standard settings, mounting went ok.

the problem is - 2 applications (both filesharing) have problems with 
the filesystem:

* overnet cannot reload shared data from the reiser4 partition.
when downloading, data is saved in .part-files and downloading can be 
continued after a restart using them. the .part-files are not 
recognized. when i copy the data to a reiser3 partition, it works again 
(data seems not to be corrupted (?)).

* azureus (a java bittorrent client) has hash problems all the time when 
verifying the downloaded data. About 60% of the parts are "corrupt" (42 
of 68 mb, another one 300mb of 900mb total...). i copy the data to 
reiser3 - no hash problems.

has anyone had a similar experience ?

regards
Willi

