From: Hans Reiser <reiser@namesys.com>
Subject: Re: Data Corruption with very large files on Reiser3
Date: Sat, 27 Sep 2003 21:52:58 +0400
Message-ID: <3F75CE7A.3010607@namesys.com>
References: <Pine.LNX.4.51.0309270936120.16317@leandra.the-lab.virtadpt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15745-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.51.0309270936120.16317@leandra.the-lab.virtadpt.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Julia Wolf <julia@virtadpt.net>, Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

This is a known bug in the big writes optimization, it was fixed, I 
thought the fix was sent to Linus....

Hans

Julia Wolf wrote:

>  Under both the 2.4.19 and 2.6.0-test5 Linux Kernels, (On an AMD K6-II if
>it matters) I ran into a problem when I created a large .bz2 file and then
>later a large .gz of the same data. At first I thought it might have been
>a problem with bzip2 and gzip not being able to handle a
>larger-than-UInt32 file. But supprisingly when I created the file on an
>EXT2 filesystem, they were prefectly fine.
>Here's a short demonstration:
>
># cp -avi /mnt/ext2/bigfile.gz /mnt/reiser/
>/mnt/ext2/bigfile.gz' -> /mnt/reiser/bigfile.gz'
>
># ls -l /mnt/ext2/bigfile.gz /mnt/reiser/bigfile.gz
>-rw-r--r--    1 root     root     6955913035 Sep 10 20:51
>/mnt/ext2/bigfile.gz
>-rw-r--r--    1 root     root     6955913035 Sep 10 20:51
>/mnt/reiser/bigfile.gz
># gunzip -tv /mnt/ext2/bigfile.gz
>/mnt/ext2/bigfile.gz:      OK
>
># gunzip -tv /mnt/reiser/bigfile.gz
>
>gunzip: /mnt/reiser/bigfile.gz: not in gzip format
>
># md5sum /mnt/ext2/bigfile.gz /mnt/reiser/bigfile.gz
>526fd8267833a746de682aa1b1bbfe86  /mnt/ext2/bigfile.gz
>0187a81e62dd2f983fa412d8cc4c7ccb  /mnt/reiser/bigfile.gz
>
>This particular filesystem in question (/mnt/reiser) has the following
>characteristics:
>
><-------------debugreiserfs, 2002------------->
>reiserfsprogs 3.6.4
>
>
>Filesystem state: consistent
>
>Reiserfs super block in block 16 on 0x1600 of format 3.6 with standard
>journal
>Count of blocks on the device: 14653926
>Number of bitmaps: 448
>Blocksize: 4096
>Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
>blocks): 587704
>Root block: 441435
>Filesystem is cleanly umounted
>Tree height: 5
>Hash function used to sort names: "r5"
>Objectid map size 6, max 972
>Journal parameters:
>        Device [0x0]
>        Magic [0x239d4acf]
>        Size 8193 blocks (including 1 for journal header) (first block 18)
>        Max transaction length 1024 blocks
>        Max batch size 900 blocks
>        Max commit age 30
>Blocks reserved by journal: 0
>Fs state field: 0x0
>sb_version: 2
>inode generation number: 816269
>UUID: f5dfa76b-3a01-4653-8d16-91bccccc6be4
>LABEL:
>Set flags in SB:
>        ATTRIBUTES CLEAN
>
>
>... and reiserfsck has never reported an error on either of the two reiser
>filesystems I tested this on (containing the 6+Gig file).
>
>For example:
>
><-------------reiserfsck, 2002------------->
>reiserfsprogs 3.6.4
>
>  *************************************************************
>  ** If you are using the latest reiserfsprogs and  it fails **
>  ** please  email bug reports to reiserfs-list@namesys.com, **
>  ** providing  as  much  information  as  possible --  your **
>  ** hardware,  kernel,  patches,  settings,  all  reiserfsk **
>  ** messages  (including version),  the reiserfsck logfile, **
>  ** check  the  syslog file  for  any  related information. **
>  ** If you would like advice on using this program, support **
>  ** is available  for $25 at  www.namesys.com/support.html. **
>  *************************************************************
>
>Will read-only check consistency of the filesystem on /dev/hdc
>Will put log info to '/mnt/mem/reisercheck'
>
>Do you want to run this program?[N/Yes] (note need to type Yes if you
>do):Yes
>###########
>reiserfsck --check started at Fri Sep 26 06:28:10 2003
>###########
>Replaying journal..
>0 transactions replayed
>Checking internal tree..finished
>Comparing bitmaps..finished
>Checking Semantic tree:
>finished
>No corruptions found
>There are on the filesystem:
>        Leaves 164675
>        Internal nodes 1034
>        Directories 34329
>        Other files 513340
>        Data block pointers 13905249 (13394 of them are zero)
>        Safe links 0
>###########
>reiserfsck finished at Fri Sep 26 06:36:15 2003
>###########
>
># ls -l /mnt/mem/reisercheck
>-rw-r--r--    1 root     root            0 Sep 26 06:28
>/mnt/mem/reisercheck
>
>
>  This same problem occured on a brand new reiser filesystem with no files
>on it other than the single 6+Gig file.
>
>  Looking at the data in the .gz file, it seemed as if the begining of the
>file was truncated (There was no .gz header for one thing) Also, running
>bzip2recover on the .bz2 file that 'bzip2' and 'file' reported as not a
>bzip2 file and data... bzip2recover *was* able to recover almost (?) every
>single block.
>
>  I did a quick test to check my conjecture that blocks of the file are
>being scrambled up. This program spews out exactly 6,000,000,000 bytes to
>stdout, and every 16 bytes I've numbered so you can figure out what byte
>position a chunk of data originally came from.
>
># echo $[6000000000/16]
>375000000
>
># cat << EOF > numbers.c
>#include <stdio.h>
>
>int main() {
>
>   int i;
>
>   for (i=0; i<375000000; i++) {
>        printf("%15i\n",i);      /* 16 bytes */
>   }
>
>   return 0;
>}
>
>EOF
>
># gcc -o numbers numbers.c
>
># ./numbers |head --bytes=8192
>              0
>              1
>              2
>              3
>              4
>              5
>              6
>              7
>              8
>              9
>        [snip...]
>            253
>            254
>            255
>            256
>            257
>        [snip...]
>            509
>            510
>            511
>
># ./numbers > 6-Gig-File
># ls -l 6-Gig-File
>-rw-r--r--    1 root     root     6000000000 Sep 27 01:21 6gig
>
># head --bytes=8192 6-Gig-File
>              0
>              1
>              2
>              3
>              4
>              5
>              6
>              7
>              8
>              9
>             10
>             11
>             12
>             13
>             14
>             15
>             16
>             17
>             18
>             19
>        [snip...]
>            246
>            247
>            248
>            249
>            250
>            251
>            252
>            253
>            254
>            255
>      268435712
>      268435713
>      268435714
>      268435715
>      268435716
>      268435717
>      268435718
>      268435719
>      268435720
>        [snip...]
>      268435962
>      268435963
>      268435964
>      268435965
>      268435966
>      268435967
>
># echo $[268435712*16]
>4096
>
># bc
>bc 1.06
>Copyright 1991-1994, 1997, 1998, 2000 Free Software Foundation, Inc.
>This is free software with ABSOLUTELY NO WARRANTY.
>For details type `warranty'.
>268435712*16
>4294971392
>obase=16
>268435712*16
>100001000
>
>
>  Reiserfs seems to be confusing '0x01 0000 1000' with '0x00 0000 1000' no
>doubt with an overflow to a 32-bit int somewhere. (I havn't bothered to
>look through the fs code yet...)
>
>
>  
>


-- 
Hans


