From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: newbie question about mounting options
Date: Fri, 09 Apr 2004 14:41:33 +0400
Message-ID: <1081507293.2354.6.camel@tribesman.namesys.com>
References: <000a01c41d82$7e69bf70$3acac9d2@pierre2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17815-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <000a01c41d82$7e69bf70$3acac9d2@pierre2>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pierre Fafet <pierre.fafet@ladservices.fr>
Cc: 'Reiserfs List' <reiserfs-list@namesys.com>

Hello

On Thu, 2004-04-08 at 19:59, Pierre Fafet wrote:
> Hi,
> 
> Sorry if this question was already seen, I'm newbie on this list.
> 
> I tried creating a reiserfs file system with external journal device
> mkreiserfs work fine but I can't mount the FS as you can see on the
> following screen copy :
> 
>     [root@CORTON root]# mkreiserfs -s 8193 -j /dev/sdf1 /dev/sdg2
> 
>     <-------------mkreiserfs, 2002------------->
>     reiserfsprogs 3.6.4
> 
>     mkreiserfs: Guessing about desired format..
>     mkreiserfs: Kernel 2.4.20-30.9smp is running.

This kernel is too old. External journal support was included in 2.4.22

>     Format 3.6 with non-standard journal
>     Count of blocks on the device: 8865871
>     Number of blocks consumed by mkreiserfs formatting process: 289
>     Blocksize: 4096
>     Hash function used to sort names: "r5"
>     Journal Device [0x851]
>     Journal Size 8193 blocks (first block 0)
>     Journal Max transaction length 1024
>     Space on this device reserved by journal: 0
>     inode generation number: 0
>     UUID: 874b3d7c-48b8-48ca-90e1-80bc98c74193
>     ATTENTION: YOU SHOULD REBOOT AFTER FDISK!
>             ALL DATA WILL BE LOST ON '/dev/sdg2' AND ON JOURNAL DEVICE
> '/dev/sdf1'!
>     Continue (y/n):y
>     Initializing journal - 0%....20%....40%....60%....80%....100%
>     Syncing..ok
> 
>     The [...]
>     Have fun.
> 
>     [root@CORTON root]# mount -t reiserfs /dev/sdg2 /mnt
>     mount: wrong fs type, bad option, bad superblock on /dev/sdg2,
>            or too many mounted file systems
>     [root@CORTON root]#
> 
> Why is it not working ?
> 
> My distrib is Red Hat Linux 9
> 
> 
> P.F.
> 
> 

