From: Vitaly Fertman <vitaly@namesys.com>
Subject: http://www.namesys.com/snapshots/2004.08.09-internal.testing/
Date: Mon, 9 Aug 2004 23:55:13 +0400
Message-ID: <200408092355.13380.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20105-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
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

it also has:

- a converter from the previous format to the new one -- if you already created 
a reiser4 fs with the mkfs from some previous version of reiser4progs, first of 
all run
    $ debugfs.reiser4 -C device

- reiser4 patch for the grub-0.95

--
Thanks,
Vitaly Fertman

