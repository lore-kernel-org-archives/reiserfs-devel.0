From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Linux 4.14.14 kernel bug on line 152 fs/reiser4/block_alloc.c
Date: Fri, 26 Jan 2018 14:51:50 +0100
Message-ID: <983b9a19-bcc9-1f02-5fe6-a0958c22f7f0@gmail.com>
References: <20180126081539.10DD4E6762D@huitzilopochtli.metztli-it.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=kfyFGvsAtuB05UP9Futfx3shaq19V59VtxBWilbisDo=;
        b=FiV1xpvEnRju+0xGFuQz22l3xzKbBHAxJ/54F+RqZpBz1DiI4ab4VJn+RRsGjNP1Jv
         1V7Uyftwtgn1vyJ1BqoyH/cnfeKKUs8nWWzcWEiRI7Mq1sL49ZPAMroY+ptkeAFFQLyz
         Zv9RK5t2VaveQd4tDJKfDd2o90TpkZZSKy+Iy8FeLwEYE5gkQvAeVjb1pkNTDcG/9r63
         zv0FU0iUhkg+rFA48FCMFTc456+1Kd37XSMOmHbOBMk2DVdz0IHJvSHEd97qY0E+DwpO
         ygc0nLEitjIh3wXQgma9O6YqkE4GAkAvLjeYK7+Rl4dyDxRnsleSs3ECQP5pVLveCppg
         ZGjA==
In-Reply-To: <20180126081539.10DD4E6762D@huitzilopochtli.metztli-it.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Metztli Information Technology <jose@metztli-it.com>, reiserfs-devel@vger.kernel.org, debian-kernel@lists.debian.org

On 01/26/2018 09:15 AM, Metztli Information Technology wrote:
> Niltze, Ed-

Hello.

>
> I had been using Linux kernel 4.14.14 built 'the Debian way' for a couple of days
> --doing some light VirtualBox development and successful virtual machine test/creation.
>
> Notwithstanding, today 01-25-2018 experienced black screen kernel bug trace during browser usage.
> I wrote down line number of reiser4 file.
>
> FYI: No dataloss but had to reboot Debian AMD64 system due to 'kernel bug' at reference file/line:
>
> invalid opcode: 0000 [#2] SMP PTI
>
> file []-4.14.14/linux/fs/reiser4/block_alloc.c
> --------------------------------------------------
> [...]
> /* Static functions for <reiser4 super block>/<reiser4 context> block counters
>     arithmetic. Mostly, they are isolated to not to code same assertions in
>     several places. */
> static void sub_from_ctx_grabbed(reiser4_context * ctx, __u64 count)
> {
>          BUG_ON(ctx->grabbed_blocks < count); # kernel bug line 152
>          assert("zam-527", ctx->grabbed_blocks >= count);
>          ctx->grabbed_blocks -= count;
> }
> [...]

This is an old bug: a leak of grabbed disk space (reservation).
If it is reproducible, then one needs to insert debugging messages
to find out where the grabbed space disappears. Otherwise, there
is no other means except code review.

> -----------------------------------------------------
>
> In addition to usual prior mentioned specific Linux 4.14.x series logged entries during kernel builds:
>
> fs/reiser4/carry.o: warning: objtool: fatal_carry_error.isra.5() falls through to next function print_level()
> fs/reiser4/txnmgr.o: warning: objtool: commit_txnh()+0x580: stack state mismatch: cfa1=7+120 cfa2=7+136
> fs/reiser4/flush.o: warning: objtool: reverse_allocate_parent() falls through to next function squalloc_right_twig_cut.isra.27()
> fs/reiser4/wander.o: warning: objtool: reiser4_write_logs()+0x5a2: stack state mismatch: cfa1=7+184 cfa2=7+200
> fs/reiser4/vfs_ops.o: warning: objtool: .text: unexpected end of section

I am aware of those warnings: a friendship with objtool is required.
Not of high priority.

Thanks,
Edward.
