From: Sam@Vilain.net
Subject: reiserfsck --no-journal-available --do-as-i-fucking-say-bitch
Date: Fri, 7 Feb 2003 11:36:34 +0000
Message-ID: <20030207113634.C7611@ns.soreal.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12671-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi there,

I have a reiserfs filesystem that has a corrupted journal; whenever I
try to mount it, fsck it (including with the --no-journal-available
option), etc reiserfs tries to seek beyond the end of the block
device.

Is there an easy way to blank the journal so that I can run reiserfsck
on it?

(none):/mnt/backups# reiserfsck /dev/hda1

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.x.1b

Will read-only check consistency of the filesystem on /dev/hda1
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Fri Feb  7 10:43:10 2003
###########
Replaying journal..
trans replayed: mountid 101, transid 216560, desc 6118, len 72, commit 6191, nex
t trans offset 6174
bwrite: lseek to position 2048503808 (block=500123, dev=4): Invalid argument
(none):/mnt/backups# reiserfsck --no-journal-available /dev/hda1

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.x.1b

Will read-only check consistency of the filesystem on /dev/hda1
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
Filesystem with standard journal found, --no-journal-availabel is ignored
###########
reiserfsck --check started at Fri Feb  7 10:43:29 2003
###########
Replaying journal..
trans replayed: mountid 101, transid 216560, desc 6118, len 72, commit 6191, nex
t trans offset 6174
bwrite: lseek to position 2048503808 (block=500123, dev=4): Invalid argument
(none):/mnt/backups# 

Here is what I get on the console when I try to mount:

mount: wrong fs type, bad option, bad superblock on /dev/hda1,
       or too many mounted file systems
Replay Failure, unable to mount
reiserfs_read_super: unable to initialize journal space
reiserfs: checking transaction log (device 03:01) ...
attempt to access beyond end of device
03:01: rw=1, want=2000496, limit=2000061
attempt to access beyond end of device
03:01: rw=1, want=2000500, limit=2000061
journal-1226: REPLAY FAILURE, fsck required! buffer write failed
Replay Failure, unable to mount
reiserfs_read_super: unable to initialize journal space

Here's the output of debugreiserfs -j (I think - the journal header
option)

Filesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x301 of format 3.6 with standard journal
Count of blocks on the device: 524112
Number of bitmaps: 16
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] blocks): 60981
Root block: 37661
Filesystem is NOT cleanly umounted
Tree height: 5
Hash function used to sort names: "r5"
Objectid map size 2, max 972
Journal parameters:
        Device [0x0]
        Magic [0x2d5b5922]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0
sb_version: 2
inode generation number: 214154
UUID: cbf04f8b-8d1c-4f07-813e-e449c393c294
LABEL: 
Set flags in SB:
        ATTRIBUTES CLEAN
Journal header (block #8210 of /dev/hda1):
        j_last_flush_trans_id 216559
        j_first_unflushed_offset 6100
        j_mount_id 101
        Device [0x0]
        Magic [0x2d5b5922]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30

Is there an easy override for this?

Why is the option there, if it is ignored in the standard case?

Cheers,
Sam.

