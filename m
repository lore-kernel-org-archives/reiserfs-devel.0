From: Kevin <coggy@redefine.org>
Subject: Re: access beyond end of device
Date: Sat, 15 Jun 2002 22:45:45 -0700
Message-ID: <143596759785.20020615224545@redefine.org>
References: <93554601344.20020615110307@redefine.org>
 <3D0B83BD.9010404@namesys.com> <71556690578.20020615113756@redefine.org>
Reply-To: Kevin <coggy@redefine.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10742-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <71556690578.20020615113756@redefine.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> I'll give it a shot.  So far I've only seen that one file generate the
> error, so hopefully I can just tiptoe over it and back everything else
> up.  I'll let you know how it goes.  Thanks.

>> Anyway you may backup your data and try to rebuild tree by fsck.

I guess it worked?  I no longer got the error when trying to access
the original file, however it seems that part of the file got lopped
off, as the md5sum changed.  Everything else seems be working alright
though.  Thanks again.
---

reiserfsck --rebuild-tree started at Sat Jun 15 14:27:14 2002
###########

Pass 0:
Loading on-disk bitmap .. ok, 8092548 blocks marked used
Skipping 8658 blocks (super block, journal, bitmaps) 8083890 blocks will be read
0%....20%....40%....60%....80%....100%                         left 0, 579 /sec
        "r5" hash is selected
Flushing..done
        Read blocks (but not data blocks) 8083890
                Leaves among those 8102
                        - corrected leaves 1
                pointers in indirect items to wrong area 36 (zeroed)
                Objectids found 2066

Pass 1 (will try to insert 8102 leaves):
Looking for allocable blocks .. ok
0%....20%....40%....60%....80%....100%                         left 0, 352 /sec
Flushing..done
        8102 leaves read
                8102 inserted
        non-unique pointers in indirect items (zeroed) 36
Flushing..done
Pass 3 (semantic):
Flushing..done                                                                 
        Files found: 1916
        Directories found: 150
        Broken (of files/symlinks/others): 1
Pass 3a (looking for lost dir/files):
Looking for lost directories:
Flushing..done done 1, 0 /sec
Pass 4 - done           done 0, 0 /sec
        Deleted unreachable items 4
Flushing..done
Syncing..done
###########
reiserfsck finished at Sat Jun 15 18:20:39 2002

