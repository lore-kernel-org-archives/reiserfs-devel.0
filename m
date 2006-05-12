From: Suzuki <suzuki@in.ibm.com>
Subject: Re: [BUG] Reiserfs: reiserfs_panic while running fs stress tests
Date: Fri, 12 May 2006 12:15:34 +0530
Message-ID: <44642F0E.4050500@in.ibm.com>
References: <445ADA05.5000801@in.ibm.com> <20060511105006.e4811957.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751008AbWELGpb@vger.kernel.org>
In-Reply-To: <20060511105006.e4811957.rdunlap@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Randy.Dunlap" <rdunlap@xenotime.net>
Cc: reiserfs-dev@namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, akpm@osdl.org, suparna@in.ibm.com, amitarora@in.ibm.com

Randy.Dunlap wrote:
> On Fri, 05 May 2006 10:22:21 +0530 Suzuki wrote:
> 
> 
>>Hi,
>>
>>
>>I was working on a reiserfs panic with 2.6.17-rc3, while running fs
>>stress tests.
> 
> 
> Hi,
> What test(s) do you use?

The problem was initially hit while running the following tests 
simultaneously..
IOZone, bonnie++, dbench, fs_inod, fs_maim, fsstress, fsx_linux, 
postmark, tiobench.

As I had mentioned in my post, I have a simple testcase to trigger the 
panic which can hit the code path explained below.

The root cause of the problem is (as mentioned in the earlier post):

  Whenever there is an extending DIO write operation, the fs would
create a safe link so as to ensure the file size consistent, if there is
crash in between the DIO. This will be deleted once the write operation
finishes.

  If the DIO write happens to go through a "HOLE" region in the file, it
will fall into normal "buffered write", which is done  through the
address space operations prepare_write() & commit_write(). Now, the
prepare_write() might allocate blocks for the file (if needed). So if
there is some error at a later point (say ENOSPC) in prepare_write(), we
need to discard the allocated blocks. This is done by calling
"vmtruncate()" on the file. This call leads to reiserfs specific
truncate, which would try to add a save link for the file.

This addition causes a reiserfs_panic, since there is already a "save
link" stored for the file.


Thanks

Suzuki
> 
> 
>>The panic message looked like :
>>
>>" REISERFS: panic (device Null superblock): reiserfs[4248]: assertion
>>!(truncate && (REISERFS_I(inode)->i_flags & i_link_saved_truncate_mask)
>>) failed at fs/reiserfs/super.c:328:add_save_link: saved link already re
>>exists for truncated inode 13b5a "
> 
> 
> Thanks,
> ---
> ~Randy
