From: Vitaly Fertman <vitaly@namesys.com>
Subject: reiserfsprogs 3.6.5 release.
Date: Thu, 20 Mar 2003 16:31:19 +0300
Message-ID: <200303201631.19750.vitaly@namesys.com>
References: <200302251650.22469.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-13302-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302251650.22469.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hi all, 

The new 3.6.5 release includes:

- Improved fs/journal/bitmap initialising. 
- Improved journal replaying - check transactions content before replaying, 
sware on invalid content instead of replaying attempts, print about results 
and problems.
- A few small bug were fixed.

- all stuff 3.6.5-pre2 pre-release included:
> - a critical bug on pass0 of rebuild-tree with overflowing while checking
> unformatted item offsets was fixed.
> - a bug in relocation of shared object id - entry key sometimes does not
> get updated correctly with the new key - was fixed.
> - a bug in bitops operations for be mashins was fixed.
> - a bug with the superblock overwriting during replaying was fixed.
>
> - while openning the journal check that journal parameters in the
> superblock and in the journal header mathches; advice to run rebuild-sb if
> not. While rebuilding the superblock, do the same check and ask the user if
> he wants to rebuild the journal header or continue w/out the journal or he
> wants to change the start of the partition before using reiserfsck.
> - check that all not valid bits of the bitmap are set to 1, set it
> correctly.
>
> - fix-fixable does not relocate shared object ids anymore, as it is too
> complex for fix-fixable and only rebuild-tree does.
>
> - reiserfsck -a (started at boot) replays journal, checks error flags in
> the superblock, bitmaps, fs size, 2 levels of internal tree and switches
> to fixble mode if any problem is detected. For root fs fixable cannot be
> performed (as fs is mounted) and just --check will be done.
>
> - Journal replay was improved a) check blocks if they could be journable
> before replaying; b) replay only transactions which has trans_id == last
> replayed transaction trans_id + 1.
>
> - warning messages were improved.

- all stuff 3.6.5-pre1 included:
> It includes speedup for pass0, which becomes quite important for hignly 
> fragmented object id maps, and a few fixed bugs:
> - bug in balancing code led to abort when a leaf could be viewed as a block 
> of another type;
> - bug in checking statdata size for symlinks allowed to have symlinks with 
> holes at the end.
> - bug in direct-indirect item convertion let symlinks to be created of wrong 
> format.

-- 

Thanks,
Vitaly Fertman
