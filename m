From: Vitaly Fertman <vitaly@namesys.com>
Subject: http://www.namesys.com/snapshots/2004.08.09-internal.testing/
Date: Mon, 9 Aug 2004 23:49:31 +0400
Message-ID: <200408092349.31231.vitaly@namesys.com>
References: <200406150022.34578.vitaly@namesys.com> <200408042251.41149.vitaly@namesys.com> <411158A3.1060707@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20104-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <411158A3.1060707@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello All,

This snapshot contains what was included into 2004.08.03-internal.testing 
snapshot:

> updated reiser4progs-0.5.7 and the grub patch.
> 
> It includes several bug fixes against the previous snapshot, and has a disk 
> format change -- the layout of blocks that contain backuped fs metadata 
> are changed. 
> 
> No kernel patch is needed for the disk format change, however fsck may 
> report about some corruptions on an existent fs if a block was allocated 
> for some data and has become a backup one. Fsck.reiser4 --build-fs is 
> able to fix it of course, although the data in these blocks are lost then.

and it has a converter from the previous format to the new one -- if you 
already created a reiser4 fs with the mkfs from some previous version 
of reiser4progs, first of all run 
    $ debugfs.reiser4 -C device

-- 
Thanks,
Vitaly Fertman

