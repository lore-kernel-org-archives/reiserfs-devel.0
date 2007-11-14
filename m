From: "Edward Shishkin" <edward.shishkin@gmail.com>
Subject: Re: [BUG] reiser4-for-2.6.22-2 Large stalls when using atime mount option
Date: Thu, 15 Nov 2007 00:17:12 +0300
Message-ID: <5c7c368b0711141317q161b3dd1t286ba9b605138f9c@mail.gmail.com>
References: <a08621850711071223w30e5f74bua8e8189efb6814a7@mail.gmail.com>
	 <a08621850711111326i5248f9efhf04d7ea664d12ae9@mail.gmail.com>
	 <5c7c368b0711111338p7689512cia010c608d071dd34@mail.gmail.com>
	 <a08621850711111359x79c2b5dep7f078edd647bfe99@mail.gmail.com>
	 <5c7c368b0711140615i4c7566c2o36c81a9b8861ea34@mail.gmail.com>
	 <a08621850711141135w7709d3b6i63fa1454b12f2606@mail.gmail.com>
	 <a08621850711141153o105aa784t2c270b74a36a1899@mail.gmail.com>
	 <a08621850711141159k34a8ea1bk709c93cc1076d071@mail.gmail.com>
	 <a08621850711141201l4e322c57x6a9c5021ec147f0a@mail.gmail.com>
	 <a08621850711141224x1d361c86w287e1c6dcadc1ff1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=H8AYcmgglJFeQshecysxrIDAokS2ulSotBNlzEjrrTc=;
        b=i5C8pGHGVtMDwQ4jptlX7whpqDlohnnLOxU5Hd8LHWfPebT9vFxJbD4kLgH/p77CdYUZl+4thIdAelNbuFMZyzDrMW0ks76Znk0ypPqBmnbkehtfaMh3jYRX0ytFqZai1hL1nna7D+1LaMVsnEWDK9etD0xmt4J1UguH1dk3Wp4=
In-Reply-To: <a08621850711141224x1d361c86w287e1c6dcadc1ff1@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dushan Tcholich <dusanc@gmail.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

On 11/14/07, Dushan Tcholich <dusanc@gmail.com> wrote:
> Managed to find them in the logs:

I would say the below is stacktrace of another thread:
Here we can see that kupdate won the commit races
and performs write_logs, whereas at your screen we
can see a stacktrace of the final sync, which is waiting
(I guess) for this atom to be committed. I see nothing
criminal here. So we need to figure out why the commit
takes so much time. Unfortunately sysrq-t dumps aren't
able to provide such details, I'll think how to do it with
your assistance.
Good work!

Thanks,
Edward.

> Nov 14 21:01:31 krshina3 00000000 f708b200 00047863 00000003 00000000
> 00000000 c1809900 00000000
> Nov 14 21:01:31 krshina3 Call Trace:
> Nov 14 21:01:31 krshina3 [<c03ac56a>] io_schedule+0x1d/0x27
> Nov 14 21:01:31 krshina3 [<c01360d3>] sync_page+0x3d/0x40
> Nov 14 21:01:31 krshina3 [<c03ac7f1>] __wait_on_bit+0x33/0x58
> Nov 14 21:01:31 krshina3 [<c0136096>] sync_page+0x0/0x40
> Nov 14 21:01:31 krshina3 [<c0136214>] wait_on_page_bit+0x61/0x66
> Nov 14 21:01:31 krshina3 [<c0128f16>] wake_bit_function+0x0/0x3c
> Nov 14 21:01:31 krshina3 [<c0182e33>] jwait_io+0x23/0x34
> Nov 14 21:01:31 krshina3 [<c01920e9>] reiser4_write_logs+0x940/0xbd1
> Nov 14 21:01:31 krshina3 [<c018ccf6>] reiser4_txn_end+0x317/0x46c
> Nov 14 21:01:31 krshina3 [<c018ce53>] reiser4_txn_restart+0x8/0x15
> Nov 14 21:01:31 krshina3 [<c018d5a8>] flush_some_atom+0x3bf/0x3e0
> Nov 14 21:01:31 krshina3 [<c0198675>] reiser4_writeout+0x9c/0x109
> Nov 14 21:01:31 krshina3 [<c018b723>] reiser4_txn_begin+0x1d/0x37
> Nov 14 21:01:31 krshina3 [<c0167145>] generic_sync_sb_inodes+0x1d/0x222
> Nov 14 21:01:31 krshina3 [<c0195c59>] reiser4_sync_inodes+0x80/0x99
> Nov 14 21:01:31 krshina3 [<c03abfa1>] __sched_text_start+0x6e9/0x780
> Nov 14 21:01:31 krshina3 [<c0167145>] generic_sync_sb_inodes+0x1d/0x222
> Nov 14 21:01:31 krshina3 [<c0195bd9>] reiser4_sync_inodes+0x0/0x99
> Nov 14 21:01:31 krshina3 [<c016735b>] sync_sb_inodes+0x11/0x1b
> Nov 14 21:01:31 krshina3 [<c0167679>] writeback_inodes+0x59/0x94
> Nov 14 21:01:31 krshina3 [<c013b3c6>] pdflush+0x0/0x19d
> Nov 14 21:01:31 krshina3 [<c013b0e8>] wb_kupdate+0x7b/0xdf
> Nov 14 21:01:31 krshina3 [<c013b4cf>] pdflush+0x109/0x19d
> Nov 14 21:01:31 krshina3 [<c013b06d>] wb_kupdate+0x0/0xdf
> Nov 14 21:01:31 krshina3 [<c0128e1b>] kthread+0x38/0x5d
> Nov 14 21:01:31 krshina3 [<c0128de3>] kthread+0x0/0x5d
> Nov 14 21:01:31 krshina3 [<c0103c83>] kernel_thread_helper+0x7/0x10
> Nov 14 21:01:31 krshina3 =======================
>
