From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Application Problems with Reiser4/19.01.2004-fixed
Date: Fri, 23 Jan 2004 14:04:41 +0300
Message-ID: <16400.65481.167302.617050@laputa.namesys.com>
References: <4010218C.9090006@gmx.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16613-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4010218C.9090006@gmx.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Willi W." <willi.w@gmx.at>
Cc: reiserfs-list@namesys.com

Willi W. writes:
 > Hi!
 > 
 > i installed snapshot 19.01.2004 (-fixed) on my gentoo box, kernel is a 
 > gentoo-2.6.1
 > 
 > CONFIG_REISER4_FS=y
 > # CONFIG_REISER4_FS_SYSCALL is not set
 > CONFIG_REISER4_LARGE_KEY=y
 > # CONFIG_REISER4_CHECK is not set
 > CONFIG_REISER4_USE_EFLUSH=y
 > # CONFIG_REISER4_COPY_ON_CAPTURE is not set
 > # CONFIG_REISER4_BADBLOCKS is not set
 > 
 > libaal and reiser4progs are from the same snapshot
 > 
 > i created a new partition with standard settings, mounting went ok.
 > 
 > the problem is - 2 applications (both filesharing) have problems with 
 > the filesystem:
 > 
 > * overnet cannot reload shared data from the reiser4 partition.
 > when downloading, data is saved in .part-files and downloading can be 
 > continued after a restart using them. the .part-files are not 
 > recognized. when i copy the data to a reiser3 partition, it works again 
 > (data seems not to be corrupted (?)).
 > 
 > * azureus (a java bittorrent client) has hash problems all the time when 
 > verifying the downloaded data. About 60% of the parts are "corrupt" (42 
 > of 68 mb, another one 300mb of 900mb total...). i copy the data to 
 > reiser3 - no hash problems.
 > 
 > has anyone had a similar experience ?

What are these application, and where can we obtain then from?

 > 
 > regards
 > Willi
 > 

Nikita.
