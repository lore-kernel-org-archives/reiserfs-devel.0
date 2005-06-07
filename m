From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiser4 panicked cowardly: assertion failed: hint->blk < reiser4_block_count(super)
Date: Tue, 7 Jun 2005 11:00:44 +0400
Message-ID: <200506071100.44749.vitaly@namesys.com>
References: <20050605165029.386dc82e.reiser4@blinkenlights.ch> <200506061255.22953.vitaly@namesys.com> <20050606203914.3271673f.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24335-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050606203914.3271673f.reiser4@blinkenlights.ch>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Adrian Ulrich <reiser4@blinkenlights.ch>

On Monday 06 June 2005 22:39, Adrian Ulrich wrote:
> I upgraded to Linux 2.6.11.11 using the -5 reiser4 patch.
> 
> 
> It fixed it.. somewhat.. it's still funky:
> 
> 
>  * mkisofs doesn't crash with the new kernel, yeah!
>  * after running mkisofs, grub can't read the filesystem anymore..
>    The filesystem got corrupted. (It was ok before i booted
>    into 2.6.11.11 and ran mkisofs !)
> 
> So i bootet my rescue-system
> (Same kernel, reiser4progs 1.0.4. It's on /dev/md3)
> 
> Running fsck:
> 
> root@fuzzy:~# fsck.reiser4 /dev/md1
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
> 
> Fscking the /dev/md1 block device.                           
> Will check the consistency of the Reiser4 SuperBlock.                           
> Will check the consistency of the Reiser4 FileSystem.                           
> Continue?                           
> (Yes/No): Yes
> ***** fsck.reiser4 started at Mon Jun  6 20:07:51 2005
> Reiser4 fs was detected on /dev/md1.                           
> Master super block (16): 
> magic:          ReIsEr4 
> blksize:        4096 
> format:         0x0 (format40) 
> uuid:           c3fc85d3-be0d-4d71-9413-376cefcdf8fd 
> label:          <none> 
>  
> Format super block (17): 
> plugin:         format40 
> description:    Disk-format for reiser4.  
> magic:          ReIsEr40FoRmAt 
> flushes:        0 
> mkfs id:        0x5bedb66f 
> blocks:         9765488 
> free blocks:    2035573 
> root block:     4270052 
> tail policy:    0x2 (smart) 
> next oid:       0x62d63 
> file count:     180460 
> tree height:    4 
> key policy:     LARGE 
>  
>  
> CHECKING STORAGE TREE                           
> FSCK: Node (411219), item (0), [29:1(SD):0:2a:0]: does not look like a valid SD plugin set extention: wrong pset member count detected (12).
> FSCK: Node (411219), item (0), [29:1(SD):0:2a:0]: does not look like a valid stat data. 
> FSCK: Node (411219), item (0), [29:1(SD):0:2a:0]: broken item found. 
> FSCK: Node (411219): the node is broken. Pointed from the node (411211), item (0), unit (0). The whole subtree is skipped. 

there was a format change to work with encryption plugin in 
-5 reiser4 patch. progs do not have its support yet. grub works 
through the progs code so its the same problem, mkisofs is not 
relevant here.

-- 
Thanks,
Vitaly Fertman
