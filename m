From: Diego Calleja =?ISO-8859-15?Q?Garc=EDa?= <aradorlinux@yahoo.es>
Subject: Re: reiser4 snapshot for August 26th.
Date: Tue, 26 Aug 2003 23:28:44 +0200
Message-ID: <20030826232844.25e0e9b3.aradorlinux@yahoo.es>
References: <20030826102233.GA14647@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="Multipart_Tue__26_Aug_2003_23:28:44_+0200_082886a0"
Return-path: <reiserfs-list-return-15445-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030826102233.GA14647@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-dev@namesys.com, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

--Multipart_Tue__26_Aug_2003_23:28:44_+0200_082886a0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

El Tue, 26 Aug 2003 14:22:33 +0400 Oleg Drokin <green@namesys.com> escribi=
=F3:

> Reiser4 snapshot for 2003.08.26

I got some errors running tiobench (see end of the message) They say someth=
ing
about ext3 but reiser4 is on the backtrace.

setup: root fs on /; reiser4 on /mnt; running tiobench on /mnt
machine is dual p3 (800 mhz) on ide disk. Config attached

(Also, i wasn't able to run reiser4 as root fs...i got "flushing like mad b=
lah
nikita-something" messages in 3-5s periods.)

btw, I suppose this feature will be removed if/when reiser4 is merged?:
config REISER4_FS_SYSCALL
        bool "Enable reiser4 system call"


dmesg errors:
(fs/ext3/inode.c, 2728): ext3_write_inode: called recursively, non-PF_MEMAL=
LOC!
Call Trace:
 [<c018c715>] write_inode+0x45/0x50
 [<c018c9af>] __sync_single_inode+0x28f/0x310
 [<c018cd00>] generic_sync_sb_inodes+0x1c0/0x2e0
 [<c018cf0c>] writeback_inodes+0xac/0x1d0
 [<c014962c>] balance_dirty_pages+0xbc/0x180
 [<c01cf421>] reiser4_exit_context+0x51/0x60
 [<c01ea9e9>] reiser4_write+0x79/0xb0
 [<c0165e7a>] vfs_write+0xaa/0x130
 [<c0165f9f>] sys_write+0x3f/0x60
 [<c0109b2f>] syscall_call+0x7/0xb

(fs/ext3/inode.c, 2728): ext3_write_inode: called recursively, non-PF_MEMAL=
LOC!
Call Trace:
 [<c018c715>] write_inode+0x45/0x50
 [<c018c9af>] __sync_single_inode+0x28f/0x310
 [<c018cd00>] generic_sync_sb_inodes+0x1c0/0x2e0
 [<c018cf0c>] writeback_inodes+0xac/0x1d0
 [<c014962c>] balance_dirty_pages+0xbc/0x180
 [<c01cf421>] reiser4_exit_context+0x51/0x60
 [<c01ea9e9>] reiser4_write+0x79/0xb0

(fs/ext3/inode.c, 2728): ext3_write_inode: called recursively, non-PF_MEMAL=
LOC!
Call Trace:
 [<c018c715>] write_inode+0x45/0x50
 [<c018c9af>] __sync_single_inode+0x28f/0x310
 [<c018cd00>] generic_sync_sb_inodes+0x1c0/0x2e0
 [<c018cf0c>] writeback_inodes+0xac/0x1d0
 [<c014962c>] balance_dirty_pages+0xbc/0x180
 [<c01cf421>] reiser4_exit_context+0x51/0x60
 [<c01ea9e9>] reiser4_write+0x79/0xb0
 [<c0165e7a>] vfs_write+0xaa/0x130
 [<c0165f9f>] sys_write+0x3f/0x60
 [<c0109b2f>] syscall_call+0x7/0xb

(fs/ext3/inode.c, 2728): ext3_write_inode: called recursively, non-PF_MEMAL=
LOC!
Call Trace:
 [<c018c715>] write_inode+0x45/0x50
 [<c018c9af>] __sync_single_inode+0x28f/0x310
 [<c018cd00>] generic_sync_sb_inodes+0x1c0/0x2e0
 [<c018cf0c>] writeback_inodes+0xac/0x1d0
 [<c014962c>] balance_dirty_pages+0xbc/0x180
 [<c01cf421>] reiser4_exit_context+0x51/0x60
 [<c01ea9e9>] reiser4_write+0x79/0xb0
 [<c0165e7a>] vfs_write+0xaa/0x130
 [<c0165f9f>] sys_write+0x3f/0x60
 [<c0109b2f>] syscall_call+0x7/0xb

(and so on)

--Multipart_Tue__26_Aug_2003_23:28:44_+0200_082886a0--
