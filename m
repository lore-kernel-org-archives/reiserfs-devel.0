From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Reiserfsck can't fix FS
Date: Fri, 14 Oct 2005 20:08:41 +0400
Message-ID: <200510142008.42253.vitaly@namesys.com>
References: <1129303303.3370.4.camel@desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26528-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1129303303.3370.4.camel@desktop>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Thomas Raschbacher <lordvan@lordvan.com>

Hello Thomas!

On Friday 14 October 2005 19:21, Thomas Raschbacher wrote:
> Hi,
> 
> I had to run reiserfsck on my usb hdd because there were some problems.
> It told me to rebuild the tree (because I couldn't mount it I coudlnt'
> backup things and I didn't have enough space (50GB) spare for a disk
> image).
> 
> attached my logfiles and (where i remembered to save it the stdout
> output)
> 
> It alwasy aborts at the same place.
> 
> (i did the same for another partition and there after running reiserfsck
> --rebuild-tree about 10 times it worked out ok but this one seems to be
> a problem ..)
> 
> reiserfsck 3.6.19 (2003 www.namesys.com)
> Linux version 2.6.12-gentoo-r6 (root@desktop) (gcc version
> 3.4.3-20050110 (Gentoo 3.4.3.20050110-r2, ssp-3.4.3.20050110-0,
> pie-8.7.7)) #1 Thu Jul 21 20:21:20 BST 2005
> (i can provide kernel config file if needed)
> 
> Please let me know if ther'es anything I can do as there's quite a bit
> of data on that drive.

it is possible to check how reiserfsck works, you can extract 
the fs metadata and fsck them on another compter. this does 
not require you to have 50M as there are not real data:
	debugreiserfs -p /dev/discs/disc2/part6 | bzip2 -c > part6.bz2
go to another computer:
	touch part6.image
	bunzip2 -c part6.bz2 | debugreiserfs -u part6.image
	reiserfsck --rebuild-tree part6.image -l logfile

if it finishes successfully, the problem is in your hardware.
As the same block number repeats and there is also a failed 
block read, the problem is likely to be IO related.

it fsck fails on your metadata, I would like to have a look 
at part6.bz2.

-- 
Vitaly
