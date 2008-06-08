From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: warning: is_tree_node: node level 56362 does not match to the
 expected one 1
Date: Mon, 09 Jun 2008 00:55:18 +0400
Message-ID: <484C4736.3080103@gmail.com>
References: <20080608174322.GC19640@p15145560.pureserver.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20080608174322.GC19640@p15145560.pureserver.info>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Gross <Ralf-Lists@ralfgross.de>
Cc: reiserfs-devel@vger.kernel.org

Ralf Gross wrote:
> Hi,
>   

Hello.

> I'm not sure if this is the right list, but I couldn't find a -user
> list. So I'll try my luck here.
>
> Last Friday a backup server running backuppc crashed and did not
> respond to pings anymore. I logged in using the IPMI management card
> and found this (sorry I couldn't scroll up or get the output from any
> logfile):
>
> http://pirx.askja.de/Supermicro_Daughter_Card_Remote_Console.png
>   

There is no useful info here..

I also don't have successful experience with such remote consoles:
It doesn't fit a stacktrace. Desperate attempts to parse packets with
ngrep didn't' t lead to happy end..

> Next I reset the system and booted. But I couldn't boot the system to
> the login prompt. Many reiserfs warnings appeared.
>
> To start reiserfsck I booted grml from CD. The first run with the
> check option resulted in errors and I restarted reiserfsck with the
> --rebuilt-tree option which complained after 40% about a possible
> harware problems.
>
> http://pirx.askja.de/Supermicro_Daughter_Card_Remote_Console-1.png
>
> With the rescue CD I could also take a look at the system logfiles
> from the time of the crash:
>
>   

olala... it definitely seems like hardware problems..

> Jun  5 21:59:20 server -- MARK --
> Jun  5 22:05:54 server kernel: ReiserFS: warning: is_tree_node: node level 56362 does not match to the expected one 1
> Jun  5 22:05:54 server kernel: ReiserFS: dm-0: warning: vs-5150: search_by_key: invalid format found in block 514510379. Fsck?
> Jun  5 22:05:54 server kernel: ReiserFS: dm-0: warning: zam-7001: io error in reiserfs_find_entry
>   
[...]
>
> Here is the complete logfile:
>
> http://pirx.askja.de/messages
>
>
>
> The server is running Debian Etch with 2.6.18 kernel.
>
> reiser4progs	1.0.5-2
> reiserfsprogs   3.6.19-4    
>
> The reiserfs is built on top of 3 raid volumes (Areca sata controller,
> 7 x 750 GB, raid 5, each volume 1,5 TB) and one large LVM vg.
>
>   --- Volume group ---
>   VG Name               vg-data
>   System ID             
>   Format                lvm2
>   Metadata Areas        3
>   Metadata Sequence No  2
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                1
>   Open LV               0
>   Max PV                0
>   Cur PV                3
>   Act PV                3
>   VG Size               4.09 TB
>   PE Size               4.00 MB
>   Total PE              1072880
>   Alloc PE / Size       1072880 / 4.09 TB
>   Free  PE / Size       0 / 0   
>   VG UUID               gvgzD2-0Xff-GEDR-1WlY-7OOD-Bwi4-5tig7
>
>
> Hardware:
>
> Supermicro Mainboard
> C2D CPU
> 4 GB ECC RAM
> Areca SATA RAID Controller
>
> The system was running as backuppc server for 18 months without
> problems. No power failure or other harware problems were detected
> before the fail.
>
> Since Friday I've been running memtest86+ (20 passes, app. 25 hours),
> prime95 and badblocks. No problems so far.
>
>   

Did you check all your hard drives with badblocks after the crash?

If yes, then try to build and check the same configuration with the
same hard drives on another box. No more ideas..

Thanks,
Edward.

> What can I do next? Any chance to save the fs? Gladly I've a second
> backup system, so not all backups are lost. But if I can get this fs
> back, I'd be happy.
>
> Ralf
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

