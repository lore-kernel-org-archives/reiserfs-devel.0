From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Problem: --rebuild-tree failed
Date: Mon, 6 Mar 2006 14:05:53 +0300
Message-ID: <200603061405.53984.vitaly@namesys.com>
References: <200603052007.37471.Harald@weiglwelt.de>
Reply-To: vitaly@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28216-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200603052007.37471.Harald@weiglwelt.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Harald Weigl <Harald@weiglwelt.de>

On Sunday 05 March 2006 22:07, Harald Weigl wrote:
> Hello!

Hello
 
> I ended up in quite a mess. What has happened was:
> - The file system ran full while copying CF-Card with pictures I took and
>   started to give a lot of error messages, some of them telling me that
>   fixing can only be done using "--rebuild-tree".
> - I freed 10GB of disk space and first ran a --check and then a
>   --fix-fixable on the (unmounted) partition.
> - As that went fine, I started a --rebuild-tree, which aborted twice.

do you see anything related in the syslog?
 
> Please find the logs for the correction runs attached.
> 
> reiserfsck -V says:
> 	reiserfsck 3.6.19 (2003 www.namesys.com)
> 
> I'm running a Debian Etch (up to date) with the Debian standard kernel
> 	Linux sydney 2.6.8-2-686 #1 Thu May 19 17:53:30 JST 2005 i686 GNU/Linux
> 
> The system itself is a 1 GHz P3 with 512MB RAM used as a server with an 
> average load about 0.2. Hard disks are in pairs (RAID0) through a 3Ware 
> Escalade 8508 SATA Controller. The failing partition is located on a pair new 
> 300GB SATA-Drives, the Controller does not report any problems.
> 
> The partition is about 300GB in size and holds a lot of big files (~50MBytes).
> 
> I hope you can make sense of what I send you. If I shall provide further 
> information, please reply.
> 
> In the end I have two questions:
> - Is there a way to regain access to the partition again to save as much of
>   the contents as possible (I'll be getting me another set of harddisks this
>   week)?
> - I simply copied about 900M of pictures from a CF-card. Is there anything I
>   should have considered (or consider in the future)?

would you run:
	debugreiserfs -p <device> | bzip2 -c > <device>bz2
and provide the result for downloading? I have an improved reiserfsprogs 
version, although it is not a reslease yet, so I prefere to check how it 
works on metadata first.

-- 
Vitaly
