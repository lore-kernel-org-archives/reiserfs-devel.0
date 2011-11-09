From: Piotr Sawuk <a9702387@unet.univie.ac.at>
Subject: please help me make reiser4 work with grsecurity
Date: Wed, 09 Nov 2011 15:53:53 +0100
Message-ID: <4EBA9401.4000501@unet.univie.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=unet.univie.ac.at; s=rev2;
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:Message-ID; bh=Ct4ciK/jo3EjujQfTVapg4UFa82weqBNDScJsSDgi3w=;
	b=MLC7qXu/4KeF0WvwzjK6dWcnrd8NMvMjq5ZaPXwk3NgTaBhqY2YcbRaSCVhkyFwFzFIuohfYpCMZjMA1u6puzfsta29ASjVCRcvp/Xo7WxLLsiXRHXiK5fYlb5FKRYPMugR/9661CobBLKGNLun4LCQ9fqqoRrrOY+vLs311Ins=;
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

of course reiser4 wont be able to provide the root fs. there simply is no
xattr support in reiser4. however, reiser4 doesn't even compile with grsecurity.

of course, as with most filesystems which aren't part of the kernel, I
got a .rej while applying reiser4 patch on grsecurity-patched linux-2.6.32.46,
but that was quickly resolved, so I thought. the problem was include/linux/fs.h,
the "struct super_operations" which got modified immensely by grsecurity. so I
add the 2 functions writeback_inodes and sync_inodes inserted there by reiser4.
during compilation another problem got apparent: PF_FLUSHER isn't defined in
include/linux/sched.h, just like in "newer" kernels.

the problem I couldn't solve, as I hint above, has to do with super_operations.
on my HLFS system I did do a 'make CC="gcc -fno-PIE -no-fatal-warnings"' and got

init_super.c: in function 'reiser4_init_super_data':
init_super.c:399:2: error: assignment of read-only member 'ops'
init_super.c:400:2: error: assignment of read-only member 'ops'
init_super.c:401:2: error: assignment of read-only member 'ops'

and I have no idea how to solve this. I don't know c,
I only know c++ and assembler, so I really am without
a clue how const-assignment of objects gets handled in c.
super_operations and others must get assigned to members of ops.
but how? seems grsecurity changed the way how this is supposed to happen.
please fetch linux-2.6.32.46 apply the stable patch on http://grsecurity.net
and then reiser4 for 2.6.32, and explain how grsecurity affected reiser4.

ext2 seems to initialize this struct into static variables, and compiles well.
(is that even thread-save?) does it make sense to copy that behaviour?
I fear I'd break something in reiser4 if I'd do away with ops...

btw, as grsecurity made changes on fs-code maybe reiser4 should get changed too?

P
