From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: rebuild-tree
Date: Mon, 8 Dec 2003 14:01:10 +0300
Message-ID: <200312081330.29685.vitaly@namesys.com>
References: <1070829963.2789.528.camel@larry>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16286-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1070829963.2789.528.camel@larry>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Larry Weldon <larry@welcoin.com>, reiserfs mailing list <reiserfs-list@namesys.com>

Hi Larry,

On Sunday 07 December 2003 23:46, Larry Weldon wrote:
> A client's production file server is set up using RAID-1 with 2 IDE
> disks and reiserfs. The operating system is Mandrake 9.1. The system has
> an APC 1050 SmartUPS on it - the place does have a history of power
> glitches so _everything_ has a UPS.
>
> Monday last I noticed the tape backup (I use tar) crashed at less than 1
> minute with memory exhausted error. Examination showed a directory made
> using a client machine as a 'backup' of the main job directory had an
> error showing up as "cannot stat..." when running du. Since it was a
> backup directory they just renamed it and tried to delete it using a DOS
> shell. All the files and directories were successfully deleted except
> the two offending files and their parent directories.
>
> It took me all week to see what was wrong although it was plain...
>
> After a successful backup, excluding the offending directory, I
> unmounted and used reiserfsck --check which told me 1 item was badly
> broken and to use reiserfsck --rebuild-tree which worked perfectly and
> restored all the meta-data and files.
>
> I would call that a nice job of recovering from some corruption. I did
> not think to keep the output of the rebuild-tree function - I recall the
> two bad files had some record of size 120 bytes (wrong) and it was reset
> to 96 (correct).
>
> I use reiserfs mostly because it was recommended by a friend. Now I find
> out he has abandoned reiserfs because of:
> http://www.wlug.org.nz/ReiserFS
> which seems to be down right now so excerpt follows:
> =======================================================================
> Unfortunately, the tree structure used is also the weak point of
> ReiserFS: if any of it gets corrupted, chances are that much more data
> will be affected than under traditional FileSystems. Rather than losing
> a single file to corruption of an inode, you may lose almost the entire
> contents of your disk if metadata close to the root of the BTree is
> affected. Fortunately, the likelihood of this happening due to bugs has
> been dramatically reduced in more recent version of the driver. Hardware
> failure caused corruption is still a serious problem, though.
> ========================================================================
>
> Now, I can't just stop using reiserfs and I don't want to. I think there
> is great merit in it. So, first, with the limited info I have given,
> what might have happened to create the problem and how likely might it
> be to happen again? Secondly, what is the *real* hazard of corruption
> _higher_up_ in the tree which the article says might blow away the whole
> partition?
>
> Thanks and regards.

rebuild-tree builds the BTree from the scratch gathering all leaf nodes 
of  the tree -- only these formatted nodes contain user's data -- throwing 
away others and building the new tree from them. Thus if there is the 
only corruption in some node close to the root node of the BTree you 
will lose nothing. 

It also may look like you have lost the whole reiserfs partition if 
you repartitioned the hard disk and moved the start of the reiserfs 
partition aside on e.g. 1 track consisted of 63 sectors -- no one 4k 
reiserfs formatted block will be found in this case (4k is the default 
reiserfs blocksize).

And of course if a reiserfs is corrupted and you continue using it, you 
may get more corruptions there; and working on some broken hardware 
may destroy a lot of data also.

-- 
Thanks,
Vitaly Fertman

