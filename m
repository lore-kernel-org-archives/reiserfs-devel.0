From: Edward Shishkin <edward@namesys.com>
Subject: Re: cryptcompress 2.6.16-5 reiser4 and/or 2.6.17-mm5
Date: Sat, 12 Aug 2006 17:14:34 +0400
Message-ID: <44DDD43A.4030606@namesys.com>
References: <ebiitt$f07$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29583-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ebiitt$f07$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: danny.milo@scratchpost.org
Cc: reiserfs-list@namesys.com

Danny Milosavljevic wrote:
> Hi,
> 
> So after an insane amount of time of slacking off I'm actually trying the
> cryptcompress stuff now...
> 
> However, I face some problems setting it up, because I deviate from the
> instructions :)
> 
> What I tried:
> 
> 1) download
> ftp://ftp.namesys.com/pub/tmp/cryptcompress_patches/2.6.16/
>  reiser4progs-1.0.6.tar.gz
> 
> 2) compile and run,
> ./mkfs.reiser4 -o create=ccreg40 /dev/sda1
> in the source directory
> 
> Works fine, it seems (note that I used libaal 1.0.5).
> 
> 3) get my 2.6.17-mm5 version without any extra patches to support it
>   (probably no use trying, but...)
> 
> mount /dev/sda1 /mnt/tmp
> dmesg
> [ 3584.914789] reiser4[mount(28515)]: plugin_by_unsafe_id
> (/home/dannym/work/src/kernels/linux-2.6.17/fs/reiser4/plugin/plugin.c:276)
> [nikita-2913]:
> [ 3584.914792] WARNING: Invalid plugin id: [16:4] [ 3584.914798]
> reiser4[mount(28515)]: unknown_plugin
> (/home/dannym/work/src/kernels/linux-2.6.17/fs/reiser4/plugin/item/
> static_stat.c:58)[nikita-620]:
> [ 3584.914801] WARNING: Unknown plugin 4 in 42 [ 3584.914804]
> reiser4[mount(28515)]: init_inode_static_sd
> (/home/dannym/work/src/kernels/linux-2.6.17/fs/reiser4/plugin/item/
> static_stat.c:177)[nikita-631]:
> [ 3584.914807] WARNING: unused space in inode 42
> 
> failed (as expected, probably)...
> 
> 4) okay, so I thought it was time to do it properly and tried to use 
>  2.6.16 vanilla, plus
> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.16/
>  reiser4-for-2.6.16-5.patch.gz
> plus
> ftp://ftp.namesys.com/pub/tmp/cryptcompress_patches/2.6.16/patches/*
> 

Hmm... This is for internal usage only. I have removed it, sorry
(nothing really confidential, but this stuff changes disk format
including your old reiser4 partitions). Wait for official release.
Everyone who wants to test it, send us a private message.

> Unfortunately, the patches from the last URL do not apply to that (most
> were already applied, save a few hunks that actually did get applied fine
> and the small remainder of rejects).
> 
> trying to mount the filesystem with that kind of monster kernel (yeah, I
> actually finished compiling that kernel :)) causes:
> mount /dev/sda1 /mnt/tmp
> reiser4[mount(1190)]: init_read_super
> (fs/reiser4/init_super.c:602)[nikita-2608]:
> WARNING: mmcblk0p1: wrong master super block magic 
> 
> So, are there any more current 2.6.16 cryptcompress patches? 
> 
> Should I do it differently? Is it ok to start from
> "reiser4-for-2.6.16-2.patch" as README says? 

Yes, follow the instructions precisely, and please,
read warnings in the README carefully. libaal-1.0.5 - ok.

Thanks,
Edward.

I figured rather start from
> the latest reiser4 fixes so that my testing makes any sense...
> 
> (as for my choice of "2.6.16", it's the one with the newest mtime on
> the directory ("ftp://ftp.namesys.com/pub/reiser4-for-2.6/"), and it was
> easier to do :))
> 
> cheers,
>   Danny
> 
> 
> 

