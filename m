From: jose.r.r@metztli.com (Metztli Information Technology)
Subject: reiser4-for-4.14.1.patch.gz on Linux-4.14.12/13 issues
Date: Thu, 11 Jan 2018 08:37:06 -0800 (PST)
Message-ID: <20180111163707.0E2C5CC890A@huitzilopochtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1515688929; h=From: Date: Message-Id: To: Subject: Sender;
 bh=aa5n4b253KGfxZD4Lk1iJED4pDEaC56OZiG3WV7pAj4=; b=nokjamQA5YncVhUQlM4PjqpcGYV1BmxPbvFMYsPZ3o1QwpNEYJGMbxBiTst8uUK5LWTot7o7
 qDAvFVQxeynzneu6aAGfg3gCvk3iZmkwlAjxFsYu03vA9h5+M8Mdq2nKodE5hsxVdpMsZSle
 ezHP5ETckwtYaqxlwUjyGQqJ1HI=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Niltze, Ed-

FYI applying reiser4-for-4.14.1.patch.gz to Linux kernels referenced below, generate following during kernel build:

Linux-4.14.13:
5802:fs/reiser4/carry.o: warning: objtool: fatal_carry_error.isra.5() falls through to next function print_level()
5856:fs/reiser4/txnmgr.o: warning: objtool: commit_txnh()+0x580: stack state mismatch: cfa1=7+120 cfa2=7+136
5874:fs/reiser4/flush.o: warning: objtool: reverse_allocate_parent() falls through to next function squalloc_right_twig_cut.isra.27()
5883:fs/reiser4/wander.o: warning: objtool: reiser4_write_logs()+0x5a2: stack state mismatch: cfa1=7+184 cfa2=7+200
5993:fs/reiser4/vfs_ops.o: warning: objtool: .text: unexpected end of section


Linux-4.14.12
4440:fs/reiser4/carry.o: warning: objtool: fatal_carry_error.isra.5() falls through to next function print_level()
4514:fs/reiser4/txnmgr.o: warning: objtool: commit_txnh()+0x580: stack state mismatch: cfa1=7+120 cfa2=7+136
4531:fs/reiser4/flush.o: warning: objtool: reverse_allocate_parent() falls through to next function squalloc_right_twig_cut.isra.27()
4549:fs/reiser4/wander.o: warning: objtool: reiser4_write_logs()+0x5a2: stack state mismatch: cfa1=7+184 cfa2=7+200
4677:fs/reiser4/vfs_ops.o: warning: objtool: .text: unexpected end of section

If you need to see the complete logs generated building the kernel 'the Debian way', let me know.


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Stretch w/ Linux 4.14 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
