From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: please help me make reiser4 work with grsecurity
Date: Wed, 09 Nov 2011 20:01:36 +0100
Message-ID: <4EBACE10.1080404@gmail.com>
References: <4EBA9401.4000501@unet.univie.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4EBA9401.4000501@unet.univie.ac.at>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Piotr Sawuk <a9702387@unet.univie.ac.at>
Cc: reiserfs-devel@vger.kernel.org

On 11/09/2011 03:53 PM, Piotr Sawuk wrote:
> of course reiser4 wont be able to provide the root fs. there simply is no
> xattr support in reiser4. however, reiser4 doesn't even compile with
> grsecurity.
>
> of course, as with most filesystems which aren't part of the kernel, I
> got a .rej while applying reiser4 patch on grsecurity-patched
> linux-2.6.32.46,
> but that was quickly resolved, so I thought. the problem was
> include/linux/fs.h,
> the "struct super_operations" which got modified immensely by
> grsecurity. so I
> add the 2 functions writeback_inodes and sync_inodes inserted there by
> reiser4.
> during compilation another problem got apparent: PF_FLUSHER isn't
> defined in
> include/linux/sched.h, just like in "newer" kernels.


Mainline folks got rid of this flag, since nobody uses it.
Feel free to get it back.


>
> the problem I couldn't solve, as I hint above, has to do with
> super_operations.
> on my HLFS system I did do a 'make CC="gcc -fno-PIE -no-fatal-warnings"'
> and got
>
> init_super.c: in function 'reiser4_init_super_data':
> init_super.c:399:2: error: assignment of read-only member 'ops'
> init_super.c:400:2: error: assignment of read-only member 'ops'
> init_super.c:401:2: error: assignment of read-only member 'ops'
>
> and I have no idea how to solve this. I don't know c,
> I only know c++ and assembler, so I really am without
> a clue how const-assignment of objects gets handled in c.
> super_operations and others must get assigned to members of ops.
> but how? seems grsecurity changed the way how this is supposed to happen.
> please fetch linux-2.6.32.46 apply the stable patch on
> http://grsecurity.net
> and then reiser4 for 2.6.32, and explain how grsecurity affected reiser4.


I'll try to take a look at weekends.
If this takes a lot of time, then excuse me..

Thanks,
Edward.



>
> ext2 seems to initialize this struct into static variables, and compiles
> well.
> (is that even thread-save?) does it make sense to copy that behaviour?
> I fear I'd break something in reiser4 if I'd do away with ops...
>
> btw, as grsecurity made changes on fs-code maybe reiser4 should get
> changed too?
>
> P
> --
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html

