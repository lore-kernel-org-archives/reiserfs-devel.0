From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: --rebuild-tree Questions
Date: Tue, 13 Sep 2005 15:03:57 +0400
Message-ID: <200509131503.58149.vitaly@namesys.com>
References: <A240FDBB-63BD-4475-B14F-C3B0D68BEC97@infosend.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25940-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <A240FDBB-63BD-4475-B14F-C3B0D68BEC97@infosend.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: "Jeremy Brown [InfoSend]" <jeremy.b@infosend.com>

On Tuesday 13 September 2005 01:40, Jeremy Brown [InfoSend] wrote:
> Hi list,

Hello Jeremy
 
> I have an external SCSI disk array (Dell PowerVault 220s) and had  
> some problems altering it's configuration.  I was attempting to add 2  
> disks to the RAID-5 array, and in the process found that 3 of the 4  
> disks I bought of identical brand and size were bad!
> 
> After much toil and tribulation, I got the RAID to work by getting 2  
> functioning disks in the SCSI disk array.  However, without even  
> attempting to resize the partition or anything, I started  
> experiencing problems with the Reiser partition.  Some files on the  
> FS are inaccessible with "Permission Denied" errors when I try to ls  
> in the directory.  The errors in the log look like this:
> 
> Sep 12 14:22:29 pdc kernel: ReiserFS: warning: is_tree_node: node  
> level 0 does not match to the expected one 1
> Sep 12 14:22:29 pdc kernel: ReiserFS: sdb1: warning: vs-5150:  
> search_by_key: invalid format found in block 1901161. Fsck?
> Sep 12 14:22:29 pdc kernel: ReiserFS: sdb1: warning: vs-13070:  
> reiserfs_read_locked_inode: i/o failure occurred trying to find stat  
> data of [141946 595210 0x0 SD]
> 
> However, about 95% of the data remains readable.  But if we try to  
> overwrite or delete certain files on the fs, we get various errors.   
> Sometimes the kernel panics, sometimes Samba stops responding, etc...
> 
> Anyways...  I ran a reiserfsck --check on the partition, and it had  
> about 33 errors that it said needed the rebuild-tree option.  But I  
> have two questions:
> 
> 1. What is a ballpark success rate of this command?  

quite successful

> Does it work more often than not? 

when fs gets corrupted.

> Even if it put files into lost+found   
> directories, that would be fine with me.  I'm just afraid of a total  
> failure of the operation.  I do have the data backed up to LTO-2  
> tape, but I consider restoration of all files on this partition from  
> tape as hopefully a last resort.
>
> 2. Most importantly: About how long can I expect the rebuild-tree  
> operation to take?  I know there's no definitive answer for this, but   
> I've searched high and low for other people's results with this  
> command and no one has mentioned how long it took (other than a post  
> on this list earlier from someone who's command apparently failed).   
> The partition is 410GB of Ultra-160 SCSI.  Again, I know an exact  
> figure isn't possible, but does anyone have a ballpark figure of what  
> I should expect?

it depends on the amount of data kept on the fs and average 
file size, 3h-10h.

> I'm sorry if I rambled or left off any important information, but TIA  
> for any help with these questions.  I'd be happy to add any  
> information requested.
> 

-- 
Thanks,
Vitaly Fertman
