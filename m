From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: Better fsck.reiser4 needed
Date: Wed, 6 Sep 2006 12:24:41 -0600
Message-ID: <20060906182441.GC6441@schatzie.adilger.int>
References: <44FE8041.5060403@feise.com> <200609061304.30625.vs@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29821-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200609061304.30625.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: jfeise@feise.com, reiserfs-list@namesys.com

On Sep 06, 2006  13:04 +0400, Vladimir V. Saveliev wrote:
> On Wednesday 06 September 2006 12:01, Joe Feise wrote:
> > It seems that fsck.reiser4 -a doesn't do anything. It doesn't even detect
> > corruption.
> 
> I think it is made that way with intention. If fsck.reiser4 -a did corruption 
> detection bootup process would take long time and users would not have the 
> main advantage of journalled filesystems - quick recovering after unclean 
> shutdown.

In e2fsck the boot-time check (-a) of ext3 only does very minimal checking:
- valid superblock
- valid journal superblock
- recover journal and any errors stored in the journal, transfer to superblock
- reverify superblock
- check if superblock recorded any metadata errors previously

At this point less than a second has normally passed and the e2fsck is done.
The kernel ext3 code can also do journal recovery, but this doesn't allow
e2fsck the chance to verify the superblock after the journal is recovered.

If the journal or filesystem superblock recorded an error in the
filesystem during the previous run (generally corruption of the metadata)
or is itself corrupt e2fsck will force a full check.  Otherwise,
this corruption may cause endless panic+reboot cycles, or may lead to
cascading corruption of the rest of the filesystem (e.g. if allocation
bitmaps are corrupted).

Cheers, Andreas
--
Andreas Dilger
Principal Software Engineer
Cluster File Systems, Inc.

