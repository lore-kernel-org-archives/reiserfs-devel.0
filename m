From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: A strategy to recover from a bad block infected disk in middle of an LVM array situation
Date: Tue, 8 Jun 2004 12:28:54 +0400
Message-ID: <200406081228.54135.vitaly@namesys.com>
References: <1EC1DF61-B8D5-11D8-9336-000A9566C776@cc.hut.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19077-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1EC1DF61-B8D5-11D8-9336-000A9566C776@cc.hut.fi>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tuomas Jormola <tjormola@cc.hut.fi>, reiserfs-list@namesys.com

On Tuesday 08 June 2004 02:50, Tuomas Jormola wrote:
> Hello list,
>
> I've beginning to get bad blocks on a disk that is part of an LVM
> array. Here's my plan how to get away with the situation. I'm hoping to
> hear some comments if there's something that should be done in a
> smarter way.
>
> Ok, currently I'm running badblocks(8) against the LVM volume block
> device to find out exactly which blocks are bad but I don't think there
> are awfully lot of those yet. However, if you try to mount the fs, you
> get the following kernel warnings
>
> ReiserFS: dm-12: warning: sh-2029: reiserfs read_bitmaps: bitmap block
> (#6275072) reading failed
> ReiserFS: dm-12: warning: jmacd-8: reiserfs_full_super: unable to read
> bitmap
>
> and after that mount fails. Since the filesystem is about 300GB I don't
> have the space to read the whole LVM block device with dd_rescue to an
> image file and use it for recovering. Also I can't just make an image
> of the fault disk with dd_rescue because you can't replace the real
> disk with an image file when using LVM - it must be a block device.
> Therefore I'm hoping to get 100% identical working disk (same brand,
> model and hopefully size ;) with the failed one tomorrow and then I'm
> going to clone the failed disk to the new one with dd_rescue. That'll
> hopefully enable me to replace the failed disk with the working one
> while the LVM driver notices nothing. If it's ok, then it's time for
> file system recovery with fsck.reiserfs. But this is something I'm not
> entirely certain what to do. Is the optimal recovery (what was on the
> bad blocks are corrupted/gone but all the rest will come out intact)
> achievable with a simple --rebuild-tree cure? 

reiserfsck --check shows corruptions and if there are some severe ones
yes, you need to run with --rebuild-tree.

> Or should I first utilize
> the bad block information I've gathered even though no faulty disk
> exists in the system anymore (those bad blocks should now contain just
> zero bytes after copying with dd_rescue, right)? 

'dd_rescue -A' always writes blocks, zeroed if error.

> Does the fact that at
> least one of these bitmap blocks is lost mean something disastrous?

for each broken bitmap block the whole 128M region pointed by this 
bitmap block will be scanned for reiserfs metadata. A corruption may 
appear if there were some not used blocks with old reiserfs metadata, 
as these blocks will be inserted into the tree also. So this will be local
corruption within this 128M region, not at the beginning of the partition
in your case, so likely not in the root directory.

The disaster will be if you rebuild you lvm wrongly...

-- 
Thanks,
Vitaly Fertman

