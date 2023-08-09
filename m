From: Jan Kara <jack@suse.cz>
Subject: Re: A Discussion Request about a maybe-false-positive of UBSAN: OOB
 Write in do_journal_end in Kernel 6.5-rc3(with POC)
Date: Wed, 9 Aug 2023 17:32:07 +0200
Message-ID: <20230809153207.zokdmoco4lwa5s6b@quack3>
References: <CALf2hKvsXPbRoqEYL8LEBZOFFoZd-puf6VEiLd60+oYy2TaxLg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1691595128; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vBSdg5lGWPozZuQqsIRUzfuQJQeSHKdh98LQD8hsqUA=;
        b=0QI+gdRBhzw7a0KS8OlwzTIibiLKOjQAZnC+j81V4UaWZ5o1FEQZwPI0tU6qf75FIsYxLl
        v1eVLAw9p/xZvplS1eTe+A3wkX4dKmoIWyp1roxJefHiD3rM7qtFBzy1/W/PcVEpRDCCV+
        Lcjf/jfZmJIn7FePH/dWKNAMqZPb3Ko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1691595128;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vBSdg5lGWPozZuQqsIRUzfuQJQeSHKdh98LQD8hsqUA=;
        b=4KPkP26CMTm9vBgsEriOtGdAbcX4UNO7L3/VJEVwjJDk0zXrnxklDskrxYfjQajW0XM7rM
        VHJp/fEoItWgPNBw==
Content-Disposition: inline
In-Reply-To: <CALf2hKvsXPbRoqEYL8LEBZOFFoZd-puf6VEiLd60+oYy2TaxLg@mail.gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Zhiyu <zhiyuzhang999@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org

Hello!

On Tue 01-08-23 23:48:59, Zhang Zhiyu wrote:
> I found a UBSAN: OOB Write in do_journal_end reported on Linux Kernel
> 6.5-rc3 by my  modified version of syzkaller on 25 July. I tried to
> send an email, but it was rejected by the mail system due to HTML
> formatting included in the email. Here is the plain email text:
> 
> The .config, report*, repro.prog, repro.cprog can be found in:
> https://drive.google.com/file/d/1GPN68s6mA0Ee3CyK7OSbdBNABuFEzhtv/view?usp=sharing
> And the POC can be stably reproduced in the latest kernel (in/after
> 6.5-rc3) and the kernel panics. Reproduced screenshot:
> https://drive.google.com/file/d/10_4PQHSSwEBCHIMDxjb9EzB6UylRjocP/view?usp=sharing
> 
> After analyzing the root cause, I found it may be a false-positive of
> UBSAN. Firstly, the oob behavior happened at
> fs/reiserfs/journal.c:4166. When i == 1, it overwrites the
> desc->j_realblock[i], which is declared with a size of 1. However,
> with a further sight, the desc is wrapped with a b_size=0x1000 when
> allocating and i won't be larger than trans_half (smaller than
> blocksize), which would prevent the overwriting at line 4166. It seems
> a trick of memory access of j_realblock.

Yes, j_realblock is in fact a variable length array declared in an ancient
way which is likely confusing UBSAN.

> But in fs/reiserfs/journal.c:4169, is it possible to manually
> construct an extremely long journal link and let i-trans_half >
> 0x1000? In this way, commit->j_realblock[i - trans_half] =
> cpu_to_le32(cn->bh->b_blocknr); may destroy the memory outside the
> block "barrier". And maybe conduct a heap spray?

No, it is not possible. Just check how that list is constructed - new
members are added to the list in journal_mark_dirty() and there we check
there are less than journal->j_trans_max members in the list. And
journal->j_trans_max is selected so that the block numbers fit into the
descriptor + commit block.

> I'm not sure if it's actually an fp, so I haven't patched it yet. I
> hope to have some discussion based on my analysis.
> 
> Thanks for your time reading this discussion request. Although I'm a
> newbie in kernel security, I am very glad to help to improve the
> kernel.

Improving kernel security is certainly a worthy goal but I have two notes.
Firstly, reiserfs is a deprecated filesystem and it will be removed from
the kernel in a not so distant future. So it is not very useful to fuzz it
because there are practically no users anymore and no developer is
interested in fixing those bugs even if you find some. Secondly, please do
a better job of reading the code and checking whether your theory is
actually valid before filing a CVE (CVE-2023-4205). That's just adding
pointless job for everyone... Thanks!

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
