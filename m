From: Zhang Zhiyu <zhiyuzhang999@gmail.com>
Subject: A Discussion Request about a maybe-false-positive of UBSAN: OOB Write
 in do_journal_end in Kernel 6.5-rc3(with POC)
Date: Tue, 1 Aug 2023 23:48:59 +0800
Message-ID: <CALf2hKvsXPbRoqEYL8LEBZOFFoZd-puf6VEiLd60+oYy2TaxLg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690904950; x=1691509750;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PqD7HSQGZ6HL3v1M7zQJmJ/TyPFEl9SKUOQ+urkNaPs=;
        b=AK5PSwvtavTCIYKNBw8La7to4nWRZ4YdZoLXDBISFLLn/zgvWaaw7OcLzHAsk400XB
         YVPfijHd0pzVOwlLnO9B9Cc9ErzVngn21mINfxcxmgO63cP5ky3NUDBOAevpSvUroIF1
         05WBu3NlZY5CkKEa6rbhXLQdEUkw7l5jaGOdkZJT7Y99Gb+mVRIlESAAwij/dnQ+ik2T
         lfnGyrH92Pc79u7whLT10WY9b6fs1sVAvIO+wO/Fmoa49VNe0ZrsKNXGiubW5NYyAq6v
         w3OBPt4J5x6MD24V6URzu8ck5weEEnAlbQGvgTvswh/kzT8kw8lJgw8JvJglbws405LN
         p+OA==
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Hi UpStream Community,

I found a UBSAN: OOB Write in do_journal_end reported on Linux Kernel
6.5-rc3 by my  modified version of syzkaller on 25 July. I tried to
send an email, but it was rejected by the mail system due to HTML
formatting included in the email. Here is the plain email text:

The .config, report*, repro.prog, repro.cprog can be found in:
https://drive.google.com/file/d/1GPN68s6mA0Ee3CyK7OSbdBNABuFEzhtv/view?usp=sharing
And the POC can be stably reproduced in the latest kernel (in/after
6.5-rc3) and the kernel panics. Reproduced screenshot:
https://drive.google.com/file/d/10_4PQHSSwEBCHIMDxjb9EzB6UylRjocP/view?usp=sharing

After analyzing the root cause, I found it may be a false-positive of
UBSAN. Firstly, the oob behavior happened at
fs/reiserfs/journal.c:4166. When i == 1, it overwrites the
desc->j_realblock[i], which is declared with a size of 1. However,
with a further sight, the desc is wrapped with a b_size=0x1000 when
allocating and i won't be larger than trans_half (smaller than
blocksize), which would prevent the overwriting at line 4166. It seems
a trick of memory access of j_realblock.

But in fs/reiserfs/journal.c:4169, is it possible to manually
construct an extremely long journal link and let i-trans_half >
0x1000? In this way, commit->j_realblock[i - trans_half] =
cpu_to_le32(cn->bh->b_blocknr); may destroy the memory outside the
block "barrier". And maybe conduct a heap spray?

I'm not sure if it's actually an fp, so I haven't patched it yet. I
hope to have some discussion based on my analysis.

Thanks for your time reading this discussion request. Although I'm a
newbie in kernel security, I am very glad to help to improve the
kernel.

Best regards!
Zhiyu Zhang
