From: "Danny Milosavljevic" <danny.milo@scratchpost.org>
Subject: cryptcompress 2.6.16-5 reiser4 and/or 2.6.17-mm5
Date: Fri, 11 Aug 2006 18:39:57 +0000 (UTC)
Message-ID: <ebiitt$f07$1@sea.gmane.org>
Reply-To: danny.milo@scratchpost.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29576-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

So after an insane amount of time of slacking off I'm actually trying the
cryptcompress stuff now...

However, I face some problems setting it up, because I deviate from the
instructions :)

What I tried:

1) download
ftp://ftp.namesys.com/pub/tmp/cryptcompress_patches/2.6.16/
 reiser4progs-1.0.6.tar.gz

2) compile and run,
./mkfs.reiser4 -o create=ccreg40 /dev/sda1
in the source directory

Works fine, it seems (note that I used libaal 1.0.5).

3) get my 2.6.17-mm5 version without any extra patches to support it
  (probably no use trying, but...)

mount /dev/sda1 /mnt/tmp
dmesg
[ 3584.914789] reiser4[mount(28515)]: plugin_by_unsafe_id
(/home/dannym/work/src/kernels/linux-2.6.17/fs/reiser4/plugin/plugin.c:276)
[nikita-2913]:
[ 3584.914792] WARNING: Invalid plugin id: [16:4] [ 3584.914798]
reiser4[mount(28515)]: unknown_plugin
(/home/dannym/work/src/kernels/linux-2.6.17/fs/reiser4/plugin/item/
static_stat.c:58)[nikita-620]:
[ 3584.914801] WARNING: Unknown plugin 4 in 42 [ 3584.914804]
reiser4[mount(28515)]: init_inode_static_sd
(/home/dannym/work/src/kernels/linux-2.6.17/fs/reiser4/plugin/item/
static_stat.c:177)[nikita-631]:
[ 3584.914807] WARNING: unused space in inode 42

failed (as expected, probably)...

4) okay, so I thought it was time to do it properly and tried to use 
 2.6.16 vanilla, plus
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.16/
 reiser4-for-2.6.16-5.patch.gz
plus
ftp://ftp.namesys.com/pub/tmp/cryptcompress_patches/2.6.16/patches/*

Unfortunately, the patches from the last URL do not apply to that (most
were already applied, save a few hunks that actually did get applied fine
and the small remainder of rejects).

trying to mount the filesystem with that kind of monster kernel (yeah, I
actually finished compiling that kernel :)) causes:
mount /dev/sda1 /mnt/tmp
reiser4[mount(1190)]: init_read_super
(fs/reiser4/init_super.c:602)[nikita-2608]:
WARNING: mmcblk0p1: wrong master super block magic 

So, are there any more current 2.6.16 cryptcompress patches? 

Should I do it differently? Is it ok to start from
"reiser4-for-2.6.16-2.patch" as README says? I figured rather start from
the latest reiser4 fixes so that my testing makes any sense...

(as for my choice of "2.6.16", it's the one with the newest mtime on
the directory ("ftp://ftp.namesys.com/pub/reiser4-for-2.6/"), and it was
easier to do :))

cheers,
  Danny

