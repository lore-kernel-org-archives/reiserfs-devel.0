From: "Yura Umanets" <umanets@priocom.com>
Subject: Re: about crash
Date: Thu, 25 Apr 2002 19:40:34 +0300
Message-ID: <3CC83182.4020500@priocom.com>
References: <3CC8173B.8030507@priocom.com> <1061290531.20020425170549@tnonline.net> <3CC81E0F.90000@priocom.com> <1672863140.20020425173202@tnonline.net> <3CC82770.4050607@priocom.com> <1294772062.20020425180352@tnonline.net> <3CC82C0B.7030604@priocom.com> <1685846437.20020425182146@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10176-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Anders Widman wrote:
> ok.. This is the output I get when running "debugreiserfs
> /dev/Server/FTPRoot -B"
> 
> 
> <-------------debugreiserfs, 2002------------->
> reiserfsprogs 3.x.1c-pre2
> 
> debugreiserfs: option requires an argument -- B
> 
> Filesystem state: consistent
> 
> Reiserfs super block in block 16 on 0x3a00 of format 3.6 with standard journal
> Count of blocks on the device: 213532672
> Number of bitmaps: 6517
> Blocksize: 4096
> Free blocks (count of blocks - used [journal, bitmaps, data, reserved] blocks): 
> 20694828
> Root block: 67992
> Filesystem is cleanly umounted
> Tree height: 5
> Hash function used to sort names: "r5"
> Objectid map size 550, max 972
> Journal parameters:
>         Device [0x0]
>         Magic [0x0]
>         Size 8193 blocks (including 1 for journal header) (first block 18)
>         Max transaction length 0 blocks
>         Max batch size 0 blocks
>         Max commit age 0
> Blocks reserved by journal: 0
> Fs state field: 0x0
> sb_version: 2
> inode generation number: 52783
> UUID: ce0c6cd1-e381-4597-bd30-edc0074968ab
> LABEL: 
> Set flags in SB:
> 
> 
> 
> This is what I get when running "debugreiserfs /dev/Server/FTPRoot -B
> 669227":
> 
> 
> [root@server /]# debugreiserfs /dev/Server/FTPRoot -B 669227
> 
> <-------------debugreiserfs, 2002------------->
> reiserfsprogs 3.x.1c-pre2
> 
> Will try to extract list of bad blocks and save it to '669227' file
> Done
> 
> 
> I end up with a file called 669227 which is 0 bytes long. I'll try
> with the same version of debugreiserfs as you are running.
> 
> 


You should be using

debugreiserfs /dev/Server/FTPRoot -1 669227


-- 
Yury Umanets,
IT Engeneer of Priocom Corp.
Phone: +380 44 4924636, ICQ: 55494590

