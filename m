From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Crash recovery after a shutdown, lvm,reiser3.6,2.4.26, lost files
Date: Wed, 8 Sep 2004 18:05:15 +0200
Message-ID: <200409081805.15409.christian.mayrhuber@gmx.net>
References: <918973493892.65637@bao72@lendingflow.net> <200409081524.37440.christian.mayrhuber@gmx.net> <413F1C97.7090706@lastminutetour.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21636-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <413F1C97.7090706@lastminutetour.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wednesday 08 September 2004 16:52, Michele Nicosia wrote:
> Hi,
>     the primary idea starting play with reiserfs is that on crash the 
> journal will save the job...
> It is not the same of ext2 fs.
ReiserFS will not save your data, just the file metadata during a crash.
If you want it to save your data you need to use the 
data logging patches from SuSE and use the data=ordered or data=journal
mount options.
ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.25/
The patches for 2.4.25 work on 2.4.26 and 2.4.27, too.
Reiserfs cannot help in cases when the blocks are mixed somehow by
lvm.

> After the partitionig i restarted the machine (i also founded the limti 
> of 15 partition), but i do not restarted after i add another pv to the 
> volume group e resized the volume, like i suppose is the thing normal to do.
Yes, it is.

> Except this i can suppose tha another thing about th elvm could be 
> worng, but it is not the issue, because after recover the pv, and 
> mounted the fs all the files, many of them, were corrupted!!
You did rebuild the vg the right way for sure? I mean same order of pv's,
same extent size, etc.
reiserfsck --rebuild-tree is rather good at finding files even if lvm 
got rebuilt wrongly. 
reiserfsck --scan-whole-partition --rebuild-tree may even find more files,
maybe the 400MB one you are missing.
The only answer to such a big corruption you have experienced I have is that 
either the vg's are not rebuilt the right way or that you have a hardware 
defect, presumably some harddisk or the controller.
ReiserFS didn't have a report of such a desaster for a very long time. I guess
it's more than a year, now.

> >2)
> >One of your harddisks could be defect. Try to run the badblocks command.
> >
> >  
> >
> smart array 641 with six ultra3 scsi drive, i think it is not a disk 
> failure.
Thats no guarantee.
I once had a defect AMI Megaraid controller not detecting faulty disks, 
not even the ones with write errors. The result of reiserfschk --rebuild-tree
with two failed disks in a Raid-5 array was similiar to your experience.
Lots of files in lost+found with around 20% of the files containing corrupt 
data.

> 
> 2.4.26  > 2.4.18 and the lvm with reiserfs is the most improtnat and 
> useful thing to use with linux, IMHO....
Yes, I like the online expansion feature, too.

-- 
lg, Chris

