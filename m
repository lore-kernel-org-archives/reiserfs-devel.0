From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: reiserfs3 rebuild-tree successful but no files
Date: Thu, 10 Feb 2005 17:52:51 +0300
Message-ID: <1108047170.3900.43.camel@tribesman.namesys.com>
References: <200502082321.07706.kris@cp-data.de>
	 <200502100754.56823.kris@cp-data.de>
	 <1108025403.395.345.camel@tribesman.namesys.com>
	 <200502101350.53886.kris@cp-data.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502101350.53886.kris@cp-data.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Placzek <kris@cp-data.de>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2005-02-10 at 15:50, Christian Placzek wrote:

> No, I wasn't. It seems mount doesn't recognize the true file system, although 
> the magic exists.
> 
> <snip>
> 00010000 30 76 0D 01  00 00 00 00  00 00 00 00  12 00 00 00 0v..............
>          00 00 00 00  00 20 00 00  00 04 00 00  00 00 00 00 ..... ..........
> 00010020 84 03 00 00  1E 00 00 00  00 00 00 00  00 10 CC 03 ................
>          00 00 02 00  52 65 49 73  45 72 32 46  73 00 01 00 ....ReIsEr2Fs...
> 00010040 00 00 00 00  00 00 1B 02  02 00 00 00  00 00 00 00 ................
>          00 00 00 00  CF DC 6B 1C  3E 77 48 3C  A7 4E 6E 84 ......k.>wH<.Nn.
> 00010060 6E 8E E3 EE  00 00 00 00  00 00 00 00  00 00 00 00 n...............
>          00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00 ................
> <snip>
> 
> 
> Maybe the following output is the key. I did this with a fresh copy. Note the 
> number before the '$' sign in the command prompt. It's the error status of 
> the previous command.
> 
> 

Sorry, I am confused.
You had to do:
dd if=/dev/shreded of=/dev/spare
reiserfsck --rebuild-sb /dev/spare
reiserfsck --rebuild-tree -S /dev/spare
mount /dev/spare /mnt

Would you try that and let us know the result?

> 
> root@marvin:/home/kris 0$ # reiserfsck -y /dev/loop/0 --rebuild-sb
> reiserfsck 3.6.19 (2003 www.namesys.com)
> 
> *************************************************************
> ** If you are using the latest reiserfsprogs and  it fails **
> ** please  email bug reports to reiserfs-list@namesys.com, **
> ** providing  as  much  information  as  possible --  your **
> ** hardware,  kernel,  patches,  settings,  all reiserfsck **
> ** messages  (including version),  the reiserfsck logfile, **
> ** check  the  syslog file  for  any  related information. **
> ** If you would like advice on using this program, support **
> ** is available  for $25 at  www.namesys.com/support.html. **
> *************************************************************
> 
> Will check superblock and rebuild it if needed
> Will put log info to 'stdout'
> 
> reiserfs_open: the reiserfs superblock cannot be found on /dev/loop/0.
> 
> what the version of ReiserFS do you use[1-4]
>         (1)   3.6.x
>         (2) >=3.5.9 (introduced in the middle of 1999) (if you use linux 2.2, 
> choose this one)
>         (3) < 3.5.9 converted to new format (don't choose if unsure)
>         (4) < 3.5.9 (this is very old format, don't choose if unsure)
>         (X)   exit
> 1
> 
> Enter block size [4096]:
> 
> 
> No journal device was specified. (If journal is not available, re-run with 
> --no-journal-available option specified).
> Is journal default? (y/n)[y]:
> 
> Did you use resizer(y/n)[n]:
> rebuild-sb: no uuid found, a new uuid was generated 
> (cfdc6b1c-3e77-483c-a74e-6e846e8ee3ee)
> 
> rebuild-sb: You either have a corrupted journal or have just changed
> the start of the partition with some partition table editor. If you are
> sure that the start of the partition is ok, rebuild the journal header.
> Do you want to rebuild the journal header? (y/n)[n]: y
> Reiserfs super block in block 16 on 0x700 of format 3.6 with standard journal
> Count of blocks on the device: 17659440
> Number of bitmaps: 539
> Blocksize: 4096
> Free blocks (count of blocks - used [journal, bitmaps, data, reserved] 
> blocks): 0
> Root block: 0
> Filesystem is NOT clean
> Tree height: 0
> Hash function used to sort names: not set
> Objectid map size 0, max 972
> Journal parameters:
>         Device [0x0]
>         Magic [0x0]
>         Size 8193 blocks (including 1 for journal header) (first block 18)
>         Max transaction length 1024 blocks
>         Max batch size 900 blocks
>         Max commit age 30
> Blocks reserved by journal: 0
> Fs state field: 0x1:
>          some corruptions exist.
> sb_version: 2
> inode generation number: 0
> UUID: cfdc6b1c-3e77-483c-a74e-6e846e8ee3ee
> LABEL:
> Set flags in SB:
> Is this ok ? (y/n)[n]: y
> The fs may still be unconsistent. Run reiserfsck --check.
> 
> root@marvin:/home/kris 1$ # reiserfsck -y /dev/loop/0 --check
> reiserfsck 3.6.19 (2003 www.namesys.com)
> 
> *************************************************************
> ** If you are using the latest reiserfsprogs and  it fails **
> ** please  email bug reports to reiserfs-list@namesys.com, **
> ** providing  as  much  information  as  possible --  your **
> ** hardware,  kernel,  patches,  settings,  all reiserfsck **
> ** messages  (including version),  the reiserfsck logfile, **
> ** check  the  syslog file  for  any  related information. **
> ** If you would like advice on using this program, support **
> ** is available  for $25 at  www.namesys.com/support.html. **
> *************************************************************
> 
> Will read-only check consistency of the filesystem on /dev/loop/0
> Will put log info to 'stdout'
> ###########
> reiserfsck --check started at Thu Feb 10 13:16:29 2005
> ###########
> Replaying journal..
> Reiserfs journal '/dev/loop/0' in blocks [18..8211]: 0 transactions replayed
> Zero bit found in on-disk bitmap after the last valid bit.
> Checking internal tree..
> 
> Bad root block 0. (--rebuild-tree did not complete)
> 
> Aborted
> root@marvin:/home/kris 134$ #
> 

