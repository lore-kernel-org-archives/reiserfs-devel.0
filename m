From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser fs slow on mksf and mount
Date: Fri, 26 Aug 2005 21:32:22 +0400
Message-ID: <430F5226.50701@namesys.com>
References: <1125074717.5549.44.camel@localhost.localdomain>	 <430F4B91.7030909@namesys.com>	 <1125076138.5549.65.camel@localhost.localdomain> <1125076558.5549.72.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25651-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1125076558.5549.72.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mingz@ele.uri.edu
Cc: reiserfs-list@namesys.com

Hello

Ming Zhang wrote:
> forget to mention that original mount is immediately after mkfs. so no
> files in fs at all.
> 
> now i create 1048576 4KB files
> 
> then umount and remount
> 
> [root@bakstor2u root]# time mount /dev/md0 t
> 
> real    1m10.971s
> user    0m0.001s
> sys     0m0.188s
> 
> almost same as first one.
> 
> this is from dmesg
> 
> ReiserFS: md0: found reiserfs format "3.6" with standard journal
> ReiserFS: md0: using ordered data mode
> ReiserFS: md0: journal params: device md0, size 8192, journal first
> block 18, max trans len 1024, max batch 900, max commit age 30, max
> trans age 30
> ReiserFS: md0: checking transaction log (md0)
> ReiserFS: md0: Using r5 hash to sort names
> 
> 
> so i could not understand why mount a fs with 0 files is same time with
> mount a fs with 1M files.
> 
> Thanks!
> 
> Ming
> 
> 
> 
> On Fri, 2005-08-26 at 13:08 -0400, Ming Zhang wrote:
>>i think 3.2TB partition is not that big these days right?
>>
>>i would think some people that hold millions of files will have much
>>larger partition than this.
>>
>>so you think this is a normal speed for such size partition?
>>

No. That was joke actually.
Speed of mkfs.reiserfs confuses me.
As you did answer about whether all disks were spinning - I suppose that they were.
Can you please run vmstat 1  or iostat 1 while mkreiserfs is running?

>>also iostat 1 -k shows that during mount, there are small size read
>>happen each second. so this is because read meta data and metadata is
>>not continuous on disk?
>>

Yes. On mount reiserfs reads all bitmap blocks to memory. Those blocks are spread over whole disk. There is workaround for this problem.

>>>>
>>>There is a patch to cure this problem.
>>>http://www.mail-archive.com/reiserfs-list@namesys.com/msg18442.html
>>>Please note that it is experimental one.
>>>
>>>>
>>>>
> 
> 
> 

