From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: mount reiserfs3 REALLY read only?
Date: Mon, 06 Dec 2004 16:42:36 +0300
Message-ID: <1102340556.5598.81.camel@tribesman.namesys.com>
References: <20041206123706.GA25176@melkor.dnp.fmph.uniba.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22687-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041206123706.GA25176@melkor.dnp.fmph.uniba.sk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Radovan Garabik <garabik@melkor.dnp.fmph.uniba.sk>
Cc: reiserfs-list@namesys.com

On Mon, 2004-12-06 at 15:37, Radovan Garabik wrote:
> My problem: I have a 1.1TB RAID (Promise UltraTrak 15000), 
> with one huge, half full reiserfs3 partition. Suddenly, 
> it crashed, and after some debugging I found out that
> reading from the disk (cat /dev/sdc >/dev/null) works,
> but apparently when mounting reiserfs, it writes
> something somewhere, and the SCSI bus timeouts and hangs 
> until rebot (probably a harware error)
> 
> I have a place to copy the data, but I sem unable to mount the
> partition, I tried using -o ro,nolog but no luck.
> RFSTOOL segfaults when accessing the partition, debugreiserfs
> prints a lot of seemingly normal information (so the data could be salvaged, perhaps).
> 
> I can simulate the read only status with my USB flash key:
> 
> kassiopeia:12:# mount /dev/sda /mnt -o ro,nolog
> ReiserFS: sda: found reiserfs format "3.6" with standard journal
> ReiserFS: sda: using ordered data mode
> ReiserFS: sda: journal params: device sda, size 8192, journal first
> block 18, max trans len 1024, max batch 900, max commit age 30, max
> trans age 30
> ReiserFS: sda: checking transaction log (sda)
> SCSI error : <0 0 0 0> return code = 0x8000002   # the real system hangs at this point
> Current sda: sense key Data Protect
> Additional sense: Write protected
> end_request: I/O error, dev sda, sector 65680
> Buffer I/O error on device sda, logical block 8210
> lost page write due to I/O error on sda
> ReiserFS: sda: warning: journal-837: IO error during journal replay
> ReiserFS: sda: warning: Replay Failure, unable to mount
> ReiserFS: sda: warning: sh-2022: reiserfs_fill_super: unable to
> initialize journal space
> mount: wrong fs type, bad option, bad superblock on /dev/sda,
>        or too many mounted file systems
>        
> What I need to try is to mount it without any actual need for
> write. Are there any options or possibilities, perhaps
> to tell reiserfs to ignore journal completely? Perhaps some #ifdef in
> the code...
> 

Before trying to mount ignoring journal you should first make sure that
journal contains nothing to replay.
Please send what does debugreiserfs -j /dev/sda say.

> Of course, the obvious possibility, copying the partition somewhere and
> mounting as a loop would probably work, but I do not have those needed 
> continuous 1.1TB of diskspace...
> 

If filesystem was never full - it is possible that all the data are in
the beginning of disk. If it were so, you could copy only beginning of
disk to good harddrive, resize and mount it.
debugreiserfs -m /dev/sda should show whether it is possible and how
many blocks you have to copy. Please send that output as well.
  

> thank you for any ideas

