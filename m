From: jose@metztli-it.com (Metztli Information Technology)
Subject: Linux 4.14.14 kernel bug on line 152 fs/reiser4/block_alloc.c
Date: Fri, 26 Jan 2018 00:15:39 -0800 (PST)
Message-ID: <20180126081539.10DD4E6762D@huitzilopochtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1516954540; h=From: Date: Message-Id: To: Subject: Sender;
 bh=5Wnopz4WOAf9QsDA4ZgKzd8Z/kgqu9zKL0s5xMa7vPI=; b=mhWe/liVBpj0ZdgkwpT3dY3i1lDcnt8WtHb+kGw9J5AngQROE+fGwvkN04fga2tPfqM7oRz8
 cT2RzugGJY+PCA9sziVKbM0wL4zpy7G/TXm6mL+iAOhnSK5PBS6t7ZCVnVJAh5X+n6TP5mm3
 C/e3pldMKWYXLc4xy1SWuoxGwXU=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org, debian-kernel@lists.debian.org


Niltze, Ed-

I had been using Linux kernel 4.14.14 built 'the Debian way' for a couple of days
--doing some light VirtualBox development and successful virtual machine test/creation.

Notwithstanding, today 01-25-2018 experienced black screen kernel bug trace during browser usage.
I wrote down line number of reiser4 file.

FYI: No dataloss but had to reboot Debian AMD64 system due to 'kernel bug' at reference file/line:

invalid opcode: 0000 [#2] SMP PTI

file []-4.14.14/linux/fs/reiser4/block_alloc.c
--------------------------------------------------
[...]
/* Static functions for <reiser4 super block>/<reiser4 context> block counters
   arithmetic. Mostly, they are isolated to not to code same assertions in
   several places. */
static void sub_from_ctx_grabbed(reiser4_context * ctx, __u64 count)
{
        BUG_ON(ctx->grabbed_blocks < count); # kernel bug line 152
        assert("zam-527", ctx->grabbed_blocks >= count);
        ctx->grabbed_blocks -= count;
}
[...]
-----------------------------------------------------

In addition to usual prior mentioned specific Linux 4.14.x series logged entries during kernel builds:

fs/reiser4/carry.o: warning: objtool: fatal_carry_error.isra.5() falls through to next function print_level()
fs/reiser4/txnmgr.o: warning: objtool: commit_txnh()+0x580: stack state mismatch: cfa1=7+120 cfa2=7+136
fs/reiser4/flush.o: warning: objtool: reverse_allocate_parent() falls through to next function squalloc_right_twig_cut.isra.27()
fs/reiser4/wander.o: warning: objtool: reiser4_write_logs()+0x5a2: stack state mismatch: cfa1=7+184 cfa2=7+200
fs/reiser4/vfs_ops.o: warning: objtool: .text: unexpected end of section


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Stretch w/ Linux 4.14 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
