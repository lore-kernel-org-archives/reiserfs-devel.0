From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH -next] reiserfs: fix blkdev_put() warning from
 release_journal_dev()
Date: Tue, 20 Jun 2023 07:19:38 -0600
Message-ID: <168726717847.3595984.4839375056813352937.b4-ty@kernel.dk>
References: <20230620111322.1014775-1-yukuai1@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1687267180; x=1689859180;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVUN/UeiDfdpA4Wf+eSb0/ZWuKlO/eBPU0TJTZdGiJU=;
        b=FIpNdsuz91q5A7kLQ0j0ZfYx8Rg2FiCOpmGc8uV7yDNVSy89++Zlmlt8pSCdJPivFo
         /Uz5y6XMRFoJcXmt7Ci7y7ipXlv9iXlvZ1Py4iFTRBLAm5KJkyrf1KPOI/IzjKYRaLSM
         YbjINvsaxuferhK1tfQSbaY3Krmh66rQA2vaePkoHuIzajOy6a/LaAQmGjDx1U/Zb7ha
         oiYIfTz5UqzE78DtCLNAi2FHa6eWlh10RisFvHa8Nzd5DGPjb+afJm9CB5s/CxiIc23j
         OqbjFBuPg0QSqqsskAKgfoaw3J0G3s9/t5NLz1cggR17+Bf+GW3rtROnE7Ui0t96wqe/
         SmGw==
In-Reply-To: <20230620111322.1014775-1-yukuai1@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: hch@lst.de, jack@suse.cz, jinpu.wang@ionos.com, dchinner@redhat.com, hare@suse.de, trix@redhat.com, bvanassche@acm.org, yukuai3@huawei.com, willy@infradead.org, yi.zhang@huawei.com, dsterba@suse.com, brauner@kernel.org, Yu Kuai <yukuai1@huaweicloud.com>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, yangerkun@huawei.com


On Tue, 20 Jun 2023 19:13:22 +0800, Yu Kuai wrote:
> In journal_init_dev(), if super bdev is used as 'j_dev_bd', then
> blkdev_get_by_dev() is called with NULL holder, otherwise, holder will
> be journal. However, later in release_journal_dev(), blkdev_put() is
> called with journal unconditionally, cause following warning:
> 
> WARNING: CPU: 1 PID: 5034 at block/bdev.c:617 bd_end_claim block/bdev.c:617 [inline]
> WARNING: CPU: 1 PID: 5034 at block/bdev.c:617 blkdev_put+0x562/0x8a0 block/bdev.c:901
> RIP: 0010:blkdev_put+0x562/0x8a0 block/bdev.c:901
> Call Trace:
>  <TASK>
>  release_journal_dev fs/reiserfs/journal.c:2592 [inline]
>  free_journal_ram+0x421/0x5c0 fs/reiserfs/journal.c:1896
>  do_journal_release fs/reiserfs/journal.c:1960 [inline]
>  journal_release+0x276/0x630 fs/reiserfs/journal.c:1971
>  reiserfs_put_super+0xe4/0x5c0 fs/reiserfs/super.c:616
>  generic_shutdown_super+0x158/0x480 fs/super.c:499
>  kill_block_super+0x64/0xb0 fs/super.c:1422
>  deactivate_locked_super+0x98/0x160 fs/super.c:330
>  deactivate_super+0xb1/0xd0 fs/super.c:361
>  cleanup_mnt+0x2ae/0x3d0 fs/namespace.c:1247
>  task_work_run+0x16f/0x270 kernel/task_work.c:179
>  exit_task_work include/linux/task_work.h:38 [inline]
>  do_exit+0xadc/0x2a30 kernel/exit.c:874
>  do_group_exit+0xd4/0x2a0 kernel/exit.c:1024
>  __do_sys_exit_group kernel/exit.c:1035 [inline]
>  __se_sys_exit_group kernel/exit.c:1033 [inline]
>  __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1033
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> [...]

Applied, thanks!

[1/1] reiserfs: fix blkdev_put() warning from release_journal_dev()
      commit: c576c4bf9ecfa3fb9f7b11681cc2f60aba5276c4

Best regards,
-- 
Jens Axboe



