From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: Problem with multiple mounts
Date: Wed, 8 Nov 2006 16:06:23 -0700
Message-ID: <20061108230623.GZ6012@schatzie.adilger.int>
References: <45522E67.7050907@linux.vnet.ibm.com> <20061108203323.GA8238@csclub.uwaterloo.ca> <45525C82.5080303@linux.vnet.ibm.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1423925AbWKHXG2@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <45525C82.5080303@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suzuki <suzuki@linux.vnet.ibm.com>
Cc: Lennart Sorensen <lsorense@csclub.uwaterloo.ca>, reiserfs-list@namesys.com, lkml <linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.cz>

On Nov 08, 2006  14:38 -0800, Suzuki wrote:
> Lennart Sorensen wrote:
> >>ReiserFS: sda10: checking transaction log (sda10)
> >>
> >>Oops: Kernel access of bad area, sig: 11 [#1]
> >>
> >>Call Trace:
> >>[C000000011333090] [C0000000001EDB70] .journal_read+0x165c/0x1b6c 
> >>(unreliable)
> >>[C000000011333410] [C0000000001EF280] .journal_init+0xdc0/0xee8
> >>[C000000011333530] [C0000000001CDBD8] .reiserfs_fill_super+0xa90/0x1e40
> >>[C000000011333790] [C00000000011E988] .get_sb_bdev+0x208/0x31c
> >>[C000000011333870] [C0000000001CA00C] .get_super_block+0x38/0x60
> >>[C000000011333900] [C00000000011E260] .vfs_kern_mount+0xec/0x198
> >>[C0000000113339B0] [C00000000011E3E0] .do_kern_mount+0x88/0xdc
> >>[C000000011333A50] [C0000000001532CC] .do_mount+0xd50/0xe08
> >>[C000000011333D60] [C000000000175090] .compat_sys_mount+0x368/0x448
> >>[C000000011333E30] [C00000000000861C] syscall_exit+0x0/0x40
> >>
> >>My question is : Is this supported ? Mounting a filesystem which is 
> >>already mounted and replaying the ( - a may be incomplete- ) journal.
>
> Thanks for the response. This problem was reported by one of our test 
> team on 2.6.19. So, I wanted to confirm that what they are doing is not 
> supported !

I would suggest that even while this is not supported, it would be prudent
to fix such a bug.  It might be possible to hit a similar problem if there
is corruption of the on-disk data in the journal and oopsing the kernel
isn't a graceful way to deal with bad data on disk.

Cheers, Andreas
--
Andreas Dilger
Principal Software Engineer
Cluster File Systems, Inc.
