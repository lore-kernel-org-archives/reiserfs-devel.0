From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: ReiserFS data corruption
Date: Fri, 27 Aug 2004 22:45:54 +0200
Message-ID: <200408272245.54110.christian.mayrhuber@gmx.net>
References: <C6F91EE5365B7945A52921F774841CC80BA8FB75@JB-W2K-EXC-P01.corp.tvglobo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20942-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <C6F91EE5365B7945A52921F774841CC80BA8FB75@JB-W2K-EXC-P01.corp.tvglobo.com.br>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Friday 27 August 2004 01:24, Eduardo Costa wrote:
>   We are currently working with an I/O intensive application (in the order
> of 60 MB/s for writing and 40 MB/s for reading), using RAID 5 and ReiserFS
> as filesystem. Our host is a dual processed Xeon (2.8GHz) running Suse
> Linux 9.1 with 2.6.4 kernel. The rpm version of reiserfs package is 3.6.13.
>
>   As our system began to run, we noticed that some files copied to our
> storage (the one with Reiser and RAID 5) were different from the originals.
> Those differences are random: some files present this problem, some don't.
> The corrupted files have the same size as the original ones, but differ at
> some small blocks of data, around 4KB each, with zeroed bytes.
>
>   We have run a test in which we used two SCSI drives, no RAID, one with
> ReiserFS and other with Ext3, to determine if the problem was indeed with
> the filesystem. We did not had a single case o data corruption with Ext3,
> opposed to the ReiserFS drive, which presented the same problem.
>
>   Does anyone has any ideas of what this can be?
>
>   Regards,
>   Eduardo Costa

There is a kernel update available 
ftp://ftp.suse.com/pub/suse/i386/update/9.1/rpm/i586/

If the corruption is still occurring, you may want to talk to Chris Mason, a 
SuSE ReiserFS developer and creator of reiserfs data=ordered/journal mode.
Chris Mason <mason AT suse.com>

data=ordered/journal is quite young on kernel 2.6. You may have triggerd a 
bug. On the other hand Reiserfs is very sensible to hardware defects.

-- 
lg, Chris

