From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Crash recovery after a shutdown, lvm,reiser3.6,2.4.26, lost files
Date: Wed, 8 Sep 2004 15:24:37 +0200
Message-ID: <200409081524.37440.christian.mayrhuber@gmx.net>
References: <918973493892.65637@bao72@lendingflow.net> <413EFE7C.2030006@lastminutetour.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21629-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <413EFE7C.2030006@lastminutetour.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wednesday 08 September 2004 14:43, Michele Nicosia wrote:
> Hi all,
>     yesterday, after more tha three months of hard and good work, i 
> shutted off my server, to test the start script in case o remote reboot.
> After the shutdown, that apparently didn't show nothing abnormal, one of 
> my larger lvm, with the home's users reported an error.
> At a fist seen one disk seems to be not mounted becuase the vg/pv did 
> not start.
> After a restore of my lvm configuration, that vg/lv started correctly.
> But many errors comes out :
> 
> Sep  7 20:14:26 giove kernel: for (lvm(58,1))
> Sep  7 20:14:26 giove kernel: lvm(58,1):Using r5 hash to sort names
> Sep  7 20:14:26 giove kernel: is_tree_node: node level 0 does not match 
> to the expected one 2
> Sep  7 20:14:26 giove kernel: lvm(58,1):vs-5150: search_by_key: invalid 
> format found in block 12022576. Fsck?
> Sep  7 20:14:26 giove kernel: lvm(58,1):vs-2140: finish_unfinished: 
> search_by_key returned -2
> 
> And so on.
> The reiserfsck without option, did not solve anything.
> The disk was mountable, but a lot of damaged link insted of normal files 
> were in many directory.
> THe last thing to test was --rebuild-tree, that solved the problems of 
> the damaged files, but not like i thinked, it was created a lost+found 
> dir with a lot of  file, more than 30.000 and subdir.
> I do not understand what happens, with an old server, 2.2.X and reiserfs 
> 3.5 without lvm, i switched of a lot of time with some partition of more 
> than 100 g and NEVER a file was losted.
> I forgot to say that into the lost+found i have only  file of  the 
> courier maildir, but some well know  file, some avi's of 400mega, was 
> completely lost!!
> Why this happens?
> Is the couple lvm-reiser less solid than reiser directly on a partition?
> 
> Thanks for any info, and sorry for the bad english.
> 
> Michele

1)
I once had such an insult on a machine I was playing around and some old
2.4.x kernel + ext2. (rebooting after partitioning did away with these 
problems)
I may be wrong, but there is the possibility that your lvm configuration was 
not quite right because you repartitioned your harddisk and created the lvm 
configuration without rebooting after repartitioning. This can happen because 
the kernel may not have read the correct partition table info. Thats why 
fdisk suggests rebooting. (At least there was a time it was necessary)
Your reboot after 3 months made the kernel read the correct
partition table and resulted for lvm to fail, because it's disk information 
did not match the kernel one.

2)
One of your harddisks could be defect. Try to run the badblocks command.

3)
Your RAM could be defect. Try to run memtest86 for about 2 days.

Note: ReiserFS has never failed for me on LVM and 2.4.x kernels (x >= 18,
I didn't use the combination lvm+reiserfs on earlier kernels) 

-- 
lg, Chris

