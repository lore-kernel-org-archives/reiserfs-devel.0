From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Stacked Reiser4 filesystems
Date: Tue, 27 Apr 2004 18:36:51 +0400
Message-ID: <200404271836.51084.vitaly@namesys.com>
References: <40898898.3000907@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18244-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40898898.3000907@gmx.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2004@gmx.net>, ReiserFS List <reiserfs-list@namesys.com>

On Saturday 24 April 2004 01:20, Carl-Daniel Hailfinger wrote:
> Hi,

Hello

> one of the really bad (read: unecpected) deficiencies of reiserfs is the
> fact that storing the image of another reiserfs filesystem as a file on a
> reiserfs filesystem will confuse reiserfsck --rebuild-tree to no end.
>
> IIRC somebody said this cannot happen with reiser4 anymore. Is this true?
>
> And what happens if I store an (incomplete) image of a certain reiser4
> partition as a file on the very same partition? Will the metadata from the
> file confuse fsck.reiser4 in rebuild-tree mode?
>
> Since reiser4 is now heading for inclusion in mainline, I would like to
> know whether the above flaws in reiserfs are fixed in reiser4.

This all does not usually happen with reiser4 due to the following: 
1) fsck.reiser4 does not rebuild the storage tree from the scratch on 
rebuilding, it traverses the tree and analyzes only this fs metadata
trying to fix evth on-place in the tree.

2) formatted blocks have a fs-specific id generated at the mkfs 
time--mkfs id. 

It still can happen if
1) the part of the storage reiser4 tree that points the reiser4 image file
is broken, fsck cuts this broken tree part off initialliy, then scans blocks 
for this fs metadata, and insert found ones into the tree. 

Note: mkfs id stored in formatted blocks must match the one in 
the SuperBlock.

2) mkfs id stored in the super block and all its backup copies is broken.
there is no valid mkfs id so metadata blocks of this fs cannot be separated
from other fs. Although it is difficult to lose the super block and all its copies.

3) mkfs id of the reiser4 image file is the same as the mkfs id of the reiser4 
fs this file is stored in. It can happen if you keep a part of the fs on the same
fs in not compressed, not encrypted form (do you really need it ?) or if you 
unpack the reiser4 metadata with debugfs into the file on the same fs (seems 
that only reiser4 developpers need it).

If you really need some extra protection we could add smth like another 
field 'block number' into the header of formatted reiser4 blocks or smth 
like that.

Although you can always enable an encryption or a compression for 
this particular file.
1) use loop file encryption, XOR will help;
2) use reiser4 crypto-compression plugin.

-- 
Thanks,
Vitaly Fertman

