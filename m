From: Melis van den Brink <m.vd.brink@worldonline.nl>
Subject: Re: Corrupted reiserfs filesystem: please help to solve this - No one ?
Date: Sat, 21 Aug 2004 16:40:12 +0200
Message-ID: <200408211640.12710.m.vd.brink@worldonline.nl>
References: <200408181706.07347.m.vd.brink@worldonline.nl>
Reply-To: m.vd.brink@worldonline.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20454-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408181706.07347.m.vd.brink@worldonline.nl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

No one ?

On Wednesday 18 August 2004 17:06 pm, Melis van den Brink wrote:
> Dear reiserfs-list readers,
>
> I'm following this list for a few years mostly in "lurker"-mode just to see
> what happens with reiserfs. I've been using reiserfs (version 3) for many
> years now without much problems. Up until now... :-(.
> Last week I ran into diskspace problems and I decided to make a new volume
> where I could place all my multimedia stuff (movies, audio and pictures). I
> fdisk-ed a new disk and made few partitions. After that I used LVM 1.0.7
> (pvcreate, vgcreate and lvcreate) to get me some logical volumes and used
> mkreiserfs (version 3.6.10) to get a filesystem on it. All looked well and
> I started moving my data to those new filesystems. Even this looked ok up
> until I experienced a locked-up system. No way to shut it down in a nice
> way I was forced to power-down and power-up and that's where the shit
> hitted the fan
>
> :-(.
>
> Recovery of my older filesystems worked like a charm but the newly made
> stuff was nowhere in sight. In hindsight the only thing I could think of I
> did wrong in making the new filesystems was I forgot to reboot after
> fdisk-ing the disk.
> It turned out that LVM couldn't find the newly created volume-group and the
> logical volumes it contained. Subsequently neither could reiserfs find it's
> (or rather my)  precious filesystems. Using vgcfgrestore I eventually could
> recover the LVM-data so that at least LVM was consistent again. The
> reiserfs-filesystems however I just can't seem to get them back. Using
> reiserfsck in --check, --rebuild-sb, --fix-fixable or --rebuild-tree-mode
> eventually turned out in the following message:
>         No reiserfs metadata found.  If you are sure that you had the
> reiserfs on this partition,  then the start  of the partition  might be
> changed or all data were wiped out. The start of the partition may get
> changed by a partitioner  if you have used one.  Then you probably rebuilt
> the superblock as there was no one.  Zero the block at 64K offset from the
> start of the partition (a new super block you have just built) and try to
> move the start of the partition a few cylinders aside  and check if
> debugreiserfs /dev/xxx detects a reiserfs super block. If it does this is
> likely to be the right super block version.
>         If this makes you nervous, try  www.namesys.com/support.html,  and
> for $25 the author of fsck,  or a colleague  if he is out,  will  step you
> through it all.
>
> I tried some other suggestions in previous messages in this list, but
> always came back to the above sequence of reiserfsck-commands.
>
> Could anybody please help (suggestions, examples, other commands) with this
> annoying problem ?
> I will happily supply other information (machine, kernel, versions,
> filesystem-dumps) if needed.

-- 
Regards,

Melis van den Brink
