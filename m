From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck aborts in pass1
Date: Thu, 2 May 2002 18:53:13 +0400
Message-ID: <E173Hye-00029R-00@main.gmane.org>
References: <1020349828.915.69.camel@vorab>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10212-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1020349828.915.69.camel@vorab>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oliver Jehle <oliver.jehle@monex.li>, reiserfs-list@namesys.com


Hi, 

It is probably fixed in the last pre version of reiserfsprogs. 
Could you run 

debugreiserfs -p /dev/sdb1 | bzip2 -c > sdb_metadata.bz2 

and put the metadata somewhere for downloading. I will check how
the latest fsck will work for your case.

-- 

Thanks,
Vitaly Fertman


On Thursday 02 May 2002 18:30, Oliver Jehle wrote:
> i've got some problems with the filesystem, so i check the filesystem
> with the reiserfsck. i'm on kernel 2.4.18 . but i think, the filesystem
> was corrupted by an older kernel (2.4.14)...
>
>
>
> laax:~ # reiserfsck --rebuild-tree /dev/sdb1
>
> <-------------reiserfsck, 2002------------->
> reiserfsprogs 3.x.1b
>
