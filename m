From: Matt Stegman <matts@ksu.edu>
Subject: Re: Need help recovering lost partitions
Date: Wed, 28 Jan 2004 16:10:48 -0600 (CST)
Message-ID: <Pine.GSO.4.44L.0401281552570.29593-100000@unix1.cc.ksu.edu>
References: <20040128123530.20160.h009.c001.wm@mail.ngenllc.com.criticalpath.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16640-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040128123530.20160.h009.c001.wm@mail.ngenllc.com.criticalpath.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan@ngenllc.com
Cc: reiserfs-list@namesys.com

You know, I think that unless you remember the original partition
boundaries, it may be too late now.  I'm sure the reason your files
don't have the right data is that all your data block numbers are
scrambled.

See, when you created one big partition, that means that, for example, the
data block #45 from /dev/hda2 is now block #23456 in your all-disk
/dev/hda1.  Another data block #45 from /dev/hda3 could be now block
#67890 (or whatever; I'm just throwing out numbers to make a point).
Fsck wouldn't know how to translate block numbers from old partitions to
new ones.

So you have some file from /dev/hda2 that has data in block #45.  Fsck
picks this up, and recreates the tree, except that block #45 is not the
same block that inode meant.

If you haven't overwritten the superblocks (or whatever you call the first
block in the filesystem, the one that contains the magic that ideally
parted should have been able to find and key off of) then you could figure
out where your partitions began.  Then recreate those partitions, and try
"--rebuild-tree --scan-whole-partition" again to rebuild the metadata.

If those have been overwritten, then I think you're fscked (pun
intentional).  Nevermind that if fsck found two or more files with the
same apparent block numbers (from two different partitions) it probably
would have "corrected" the duplicates (copying that block to an apparently
free block and relocating the duplicate inode), and you may have no chance
to get those files back at all.  Besides looking at the raw disk blocks
yourself, that is ("strings /dev/hda" to retrieve text files, or something
similar).

Of course, I'm assuming some things I'm not sure about in how Reiserfs
handles metadata.

-- 
Matt Stegman



On Wed, 28 Jan 2004 dan@ngenllc.com wrote:

> I have a hard drive which had about 5 ReiserFs 3.6
> logical partitions on it until last night.  After
> booting up my computer (running Mandrake 9.2) I got
> some error messages saying that it needed to fsck the
> drive.  It went in a loop for quite a bit of time --
> fscking all the partitions and then rebooting, finding
> errors again, and rebooting.  I figured out how to get
> in manually, and tried backing up my data.  In the
> process though my partition table was lost.  (I tried
> deleting an ext2 partition I didn't need using fdisk
> and when I wrote teh new partition table to disk the
> partition was empty).
>
> At some point I decided that enough is enough and
> installed Mandrake on another hard drive, and tried
> finding partitions using parted and gpart.  Neither
> utility managed to detect my partitions.
>
> So I took a big jump.  I put one giant partition on the
> hard drive (ReiserFS) and ran reiserfsck --rebuild-tree
> -scan-whole-partition.
>
> I was overjoyed to find that the files were there --
> 6,000+ files and numberous directoies were found.
> However, every file I opened was either filled with
> nulls or gobblygook.
>
> I know the data is on the drive.  However reiserfsck
> found them proves this.  However, I figured that
> (perhaps) the --rebuild-tree is reading all files from
> the start of the giant partition.
>
> How can I go about recovering my data?
>
> Many many thanks in advance,
>
> -Dan

