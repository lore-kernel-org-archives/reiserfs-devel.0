From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Yet another oops with reiser4...
Date: Fri, 6 Feb 2004 18:00:08 +0300
Message-ID: <200402061800.08136.vitaly@namesys.com>
References: <4021964D.3030707@free.fr> <402199DD.8060508@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16715-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <402199DD.8060508@free.fr>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vince <fuzzy77@free.fr>, reiserfs-list@namesys.com

Hello Vince,

would you try the fsck from the latest reiser4progs snapshot:
http://www.namesys.com/snapshots/2004.02.06/

-- 
Thanks,
Vitaly Fertman

On Thursday 05 February 2004 04:18, Vince wrote:
> Following my oops, I ran fsck.reiser4 which fails on that partition:
>
> [...]
> 1 fatal corruptions were detected in FileSystem. Run with --build-fs
> option to fix them.
> diablo:~# fsck.reiser4 --build-fs /dev/hdc3
>    *************************************************************
>    **     This is an experimental version of reiser4fsck.     **
>    **                 MAKE A BACKUP FIRST!                    **
>    ** Do not run rebuild unless something  is broken.  If you **
>    ** have bad sectors on a drive it is usually a bad idea to **
>    ** continue using it.  Then  you  probably  should  get  a **
>    ** working hard drive,  copy the file system from  the bad **
>    ** drive  to the good one -- dd_rescue is  a good tool for **
>    ** that -- and only then run this program.If you are using **
>    ** the latest reiser4progs and  it fails  please email bug **
>    ** reports to reiserfs-list@namesys.com, providing as much **
>    ** information  as  possible  --  your  hardware,  kernel, **
>    ** patches, settings, all reiser4fsck messages  (including **
>    ** version), the reiser4fsck  logfile,  check  the  syslog **
>    ** file for  any  related information.                     **
>    ** If you would like advice on using this program, support **
>    ** is available  for $25 at  www.namesys.com/support.html. **
>    *************************************************************
>
> Fscking the /dev/hdc3 block device.
> Will check the consistency of the Reiser4 SuperBlock.
> Will build the Reiser4 FileSystem.
> Continue?
> (Yes/No): Yes
> ***** Openning the fs.
> Reiser4 fs was detected on the /dev/hdc3.
> Master super block (16):
> magic:          ReIsEr4
> blksize:        4096
> format:         0x0 (format40)
> uuid:           2c166267-3a92-488b-902f-30dc85f086f8
> label:          <none>
>
> Format super block (17):
> plugin:         format40
> description:    Disk-format for reiser4, ver. 0.4.20
> magic:          ReIsEr40FoRmAt
> flushes:        0
> mkfs id:        0x3f7b1d62
> blocks:         22826356
> free blocks:    17418425
> root block:     5011605
> tail policy:    0x4 (smart)
> next oid:       0x181c7
> file count:     5026
> tree height:    4
> key policy:     LARGE
>
> ***** Tree Traverse Pass: scanning the reiser4 internal tree.
>          Read nodes 2502
>          Nodes left in the tree 2502
>                  Leaves of them 2420, Twigs of them 77
>          Time interval: Thu Feb  5 02:14:40 2004 - Thu Feb  5 02:14:42 2004
> ***** TwigScan Pass: checking extent pointers of all twigs.
>          Read twigs 77
>          Time interval: Thu Feb  5 02:14:42 2004 - Thu Feb  5 02:14:43 2004
> ***** DiskScan Pass: scanning the partition for unconnected nodes.
>          Read nodes 13217
>          Good nodes 6047
>                  Leaves of them 5947, Twigs of them 100
>          Time interval: Thu Feb  5 02:14:49 2004 - Thu Feb  5 02:14:51 2004
> ***** TwigScan Pass: checking extent pointers of all twigs.
>          Read twigs 100
>          Time interval: Thu Feb  5 02:14:51 2004 - Thu Feb  5 02:14:51 2004
> ***** AddMissing Pass: inserting unconnected nodes into the tree.
>          Twigs: read 5947, inserted 5947, by items 0
>          Leaves: read 100, inserted 92, by items 0
>          Time interval: Thu Feb  5 02:14:54 2004 - Thu Feb  5 02:14:56 2004
> ***** Semantic Traverse Pass: reiser4 semantic tree checking.
> Error: Directory [29:0:2a], plugin [dir40], node [5165819], item [1],
> unit [11]: entry has wrong
> offset [2a:0(NAME):1486973746f6972:652064652066616e:4a692bd1539d00a0].
> Should be
> [2a:0(NAME):1486973746f6972:652064652066616e:eb270a31254f1d10]. Removed.
> Error: Directory [29:0:2a], plugin [dir40], node [5165819], item [1],
> unit [11]: entry has wrong
> offset [2a:0(NAME):1486973746f6972:6573206465206661:bda63957b477ad6].
> Should be
> [2a:0(NAME):1486973746f6972:6573206465206661:ac9841f54cf99746]. Removed.
> Error: Directory [29:0:2a], plugin [dir40], node [5165819], item [1],
> unit [13]: entry has wrong
> offset [2a:0(NAME):14c6573204e756c:73202d204c27696e:c8b48b3bd9018e81].
> Should be
> [2a:0(NAME):14c6573204e756c:73202d204c27696e:8a9007c846a3d271]. Removed.
> Error: Directory [29:0:2a], plugin [dir40], node [5165819], item [1],
> unit [13]: entry has wrong
> offset [2a:0(NAME):14c6573204e756c:73202d204c27696e:c8b48b3bd928e031].
> Should be
> [2a:0(NAME):14c6573204e756c:73202d204c27696e:8a9007c846cb2421]. Removed.
> Error: Node (5165819), item (0): StatData of the file [29:0:2a] has the
> wrong size (17), Fixed to (0).
> Plugin (stat40).
> Error: Node (5165819), item (0): StatData of the file [29:0:2a] has the
> wrong bytes (1100), Fixed to
> (0). Plugin (stat40).
> umka-2360: Assertion (stat_hint->extmask != 0) at stat40.c:159 in
> function stat40_prep_insert()
> failed.
> zsh: abort      fsck.reiser4 --build-fs /dev/hdc3

