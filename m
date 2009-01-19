From: Coly Li <coly.li@suse.de>
Subject: [PATCH 0/20] return f_fsid for statfs(2)
Date: Tue, 20 Jan 2009 01:30:44 +0800
Message-ID: <4974B8C4.3070703@suse.de>
Reply-To: coly.li@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Roman Zippel <zippel@linux-m68k.org>, "Sergey S. Kostyliov" <rathamahata@php4.ru>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, Dave Kleikamp <shaggy@austin.ibm.com>, Bob Copeland <me@bobcopeland.com>, Anders Larsen <al@alarsen.net>, reiserfs-devel@vger.kernel.org, Phillip Lougher <phillip@lougher.demon.co.uk>, Christoph Hellwig <hch@infradead.org>, Evgeniy Dushistov <dushistov@mail.ru>, Jan Kara <jack@suse.cz>

Currently many file systems in Linux kernel do not return f_fsid in statfs info, the value is set as
0 in vfs layer. Anyway, in some conditions, f_fsid from statfs(2) is useful, especially being used
as (f_fsid, ino) pair to uniquely identify a file.

Basic idea of the patches is generating a unique fs ID by huge_encode_dev(sb->s_bdev->bd_dev) during
file system mounting life time (no endian consistent issue). sb is a point of struct super_block of
current mounted file system being accessed by statfs(2).

The patches are quite simple, any feedback or patch review is welcome.

Thanks.
-- 
Coly Li
SuSE Labs





