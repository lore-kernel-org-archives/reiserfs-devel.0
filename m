From: Piotr Sawuk <a9702387@unet.univie.ac.at>
Subject: Re: please help me make reiser4 work with grsecurity
Date: Sun, 20 Nov 2011 22:30:04 +0100
Message-ID: <4EC9715C.5040106@unet.univie.ac.at>
References: <4EBA9401.4000501@unet.univie.ac.at> <4EBACE10.1080404@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=unet.univie.ac.at; s=rev2;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Subject:To:MIME-Version:From:Date:Message-ID; bh=KNZQncb85dszG5uU40VciCfeJWaBJ8otoTEvnkFKblg=;
	b=KfXdWpvUPc/u4wOV2sa5rxQIZ5Mb/WNPERG2aRmP2cCB4NhEo153n7kz4loZzr5anlk0EUmGmTJwkh2ww4/adiOOrOtheFmg7kPce5IPFTrSubaZkL4j7ThRUurFU8q1t+oCgj1+rkPPZ7HtOFsp4aZENiHDWNG0lq2Mkhx8jCs=;
In-Reply-To: <4EBACE10.1080404@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Edward Shishkin wrote:
> On 11/09/2011 03:53 PM, Piotr Sawuk wrote:
>> of course reiser4 wont be able to provide the root fs. there simply is no
>> xattr support in reiser4. however, reiser4 doesn't even compile with
>> grsecurity.
>>
>> of course, as with most filesystems which aren't part of the kernel, I
>> got a .rej while applying reiser4 patch on grsecurity-patched
>> linux-2.6.32.46,
>> but that was quickly resolved, so I thought. the problem was
>> include/linux/fs.h,
>> the "struct super_operations" which got modified immensely by
>> grsecurity. so I
>> add the 2 functions writeback_inodes and sync_inodes inserted there by
>> reiser4.
>> during compilation another problem got apparent: PF_FLUSHER isn't
>> defined in
>> include/linux/sched.h, just like in "newer" kernels.
> 
> 
> Mainline folks got rid of this flag, since nobody uses it.
> Feel free to get it back.
> 
> 
>>
>> the problem I couldn't solve, as I hint above, has to do with
>> super_operations.
>> on my HLFS system I did do a 'make CC="gcc -fno-PIE -no-fatal-warnings"'
>> and got
>>
>> init_super.c: in function 'reiser4_init_super_data':
>> init_super.c:399:2: error: assignment of read-only member 'ops'
>> init_super.c:400:2: error: assignment of read-only member 'ops'
>> init_super.c:401:2: error: assignment of read-only member 'ops'
>>
>> and I have no idea how to solve this. I don't know c,
>> I only know c++ and assembler, so I really am without
>> a clue how const-assignment of objects gets handled in c.
>> super_operations and others must get assigned to members of ops.
>> but how? seems grsecurity changed the way how this is supposed to happen.
>> please fetch linux-2.6.32.46 apply the stable patch on
>> http://grsecurity.net
>> and then reiser4 for 2.6.32, and explain how grsecurity affected reiser4.
> 
> 
> I'll try to take a look at weekends.
> If this takes a lot of time, then excuse me..

obviously it took a lot of time, or he forgot.
sad that noone did help me so I had to solve this the brutal way:
those 3 offending lines of reiser4_init_super_data() I replaced with

> memcpy(&sbinfo->ops.super,&reiser4_super_operations,sizeof(struct super_operations));
> memcpy(&sbinfo->ops.export,&reiser4_export_operations,sizeof(struct export_operations));
> memcpy(&sbinfo->ops.dentry,&reiser4_dentry_operations,sizeof(struct dentry_operations));

which of course produces a warning (both arguments still are const pointer),
but it works. I hope this (along with my hint to revert the removal
of PF_FLUSHER to some earlier kernel) helps people who are capable of manual
patch-merging to get reiser4 running on stable grsecurity, even without
having much programming knowledge. more detailed instructions I'll only
give when someone explains to me what the proper C-way should have been...

P
