From: "Ryan Hope" <rmh3093@gmail.com>
Subject: Re: [PATCH 3/3][reiser4] dont get radix-tree dirty tagging out of sync
Date: Tue, 12 Aug 2008 10:52:53 -0400
Message-ID: <48f7fe350808120752ud51183xeb870558d196c5fd@mail.gmail.com>
References: <48A0BFC9.40502@gmail.com>
	 <200808121236.51599.nickpiggin@yahoo.com.au>
	 <48f7fe350808112112k5e92330epa8345cbe4eb4c1b5@mail.gmail.com>
	 <200808121600.40293.nickpiggin@yahoo.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=McE2jBEZruqkNTfmQf9/am4nvge4mG8ZKNyyA7DL3sw=;
        b=fV9U5psCwG7F+wXrTi9Cc3a4U3xoSDj/3BnqxNvc1gMrJcBlJlHYAayCkVqfjMjSUx
         AZYDClQ/zPhWeQOlbXS7z5BicWuDEaL8EmEv5kJAoJPP1zDJrYbDbz/na1w30c6QNPCo
         F2zDXhL7AIKK7zuQCGnuasEeywxsl60cLwpnQ=
In-Reply-To: <200808121600.40293.nickpiggin@yahoo.com.au>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Piggin <nickpiggin@yahoo.com.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Edward Shishkin <edward.shishkin@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

On Tue, Aug 12, 2008 at 2:00 AM, Nick Piggin <nickpiggin@yahoo.com.au> wrote:
> On Tuesday 12 August 2008 14:12, Ryan Hope wrote:
>> I tried just using __set_page_dirty_nobuffers but that caused issues
>> with ext3/ext4 (i can send a bug trace later if needed).
>>
>>                                 __inc_bdi_stat(mapping->backing_dev_info,
>>                                                 BDI_RECLAIMABLE);
>>                                 task_io_account_write(PAGE_CACHE_SIZE);
>>
>> ^^^ the above code in __set_page_dirty_nobuffers causes an issue with
>> do_writepages in ext3/4 when I use something like the code below:
>>
>> int reiser4_set_page_dirty_internal(struct page *page)
>> {
>>      return __set_page_dirty_nobuffers(page);
>> }
>
> Hmm, it causes issues in ext3/4 even though it doesn't change any
> code executed by ext3/4? Yes, if you could send a trace...
>

Pid: 2620, comm: bonnie Not tainted 2.6.27-rc2-zen1 #1
 [<c026d729>] do_writepages+0x49/0x50
 [<c02dc830>] ext3_write_inode+0x0/0x40
 [<c02dc860>] ext3_write_inode+0x30/0x40
 [<c02ad3a2>] __writeback_single_inode+0x282/0x390
 [<c02ad9d4>] generic_sync_sb_inodes+0x304/0x3a0
 [<f9b9b234>] reiser4_sync_inodes+0x54/0x130 [reiser4]
 [<c02ad940>] generic_sync_sb_inodes+0x270/0x3a0
 [<c02adc64>] writeback_inodes+0x44/0xd0
 [<c026d0d0>] balance_dirty_pages_ratelimited_nr+0x230/0x370
 [<f9b79a5c>] reiser4_txn_end+0x4ec/0xae0 [reiser4]
 [<f9bc95ca>] balance_dirty_page_cluster+0x10a/0x1b0 [reiser4]
 [<f9bd17a0>] write_cryptcompress+0x610/0xdf0 [reiser4]
 [<f9bc2e76>] reiser4_write_careful+0xb6/0x880 [reiser4]
 [<c021c3ae>] update_curr+0x4e/0x70
 [<c02214c2>] task_tick_fair+0x32/0x90
 [<c023cf57>] hrtimer_forward+0xf7/0x150
 [<c0240523>] getnstimeofday+0x43/0xf0
 [<c0243885>] clockevents_program_event+0xa5/0x160
 [<c022f746>] run_timer_softirq+0x146/0x1c0
 [<c02449ca>] tick_program_event+0x3a/0x70
 [<c034a74c>] security_file_permission+0xc/0x10
 [<c028dcca>] rw_verify_area+0x4a/0xc0
 [<f9bc2dc0>] reiser4_write_careful+0x0/0x880 [reiser4]
 [<c028e1a0>] vfs_write+0xa0/0x140
 [<c028e311>] sys_write+0x41/0x80
 [<c020330d>] sysenter_do_call+0x12/0x25
 =======================
