From: Oleg Drokin <green@namesys.com>
Subject: Re: Problems with Reiser log overhead !!Need help
Date: Wed, 24 Jul 2002 14:09:04 +0400
Message-ID: <20020724140904.A881@namesys.com>
References: <006b01c232fb$dea91c00$e803a8c0@patni.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11077-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <006b01c232fb$dea91c00$e803a8c0@patni.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anita Koshy <anita.koshy@patni.com>
Cc: reiserfs-list@namesys.com

Hello!

   How do you perform updates of log files?
   Is that truncate followed by write of something like that?

Bye,
    Oleg
On Wed, Jul 24, 2002 at 03:51:25PM +0530, Anita Koshy wrote:
> Hi ,
> Iam currently using Reiserfs partition on my compact flash as a root/boot disk.Due to some driver incompatibilities, cannot use kernel 2.4/2.5 series & am currently using 2.2 This is my first attempt at Reiserfs & due to size restrictions of the Flash (16MB), I have tuned the following parameters at compile time:
> Used Patch : linux-2.2.16-reiserfs-3.5.24-patch for linux 2.2.16-22 kernel.
> 
>  Set kernel config option CONFIG_REISERFS=y. By default Reiserfs uses a journal of size=32MB.
> 
> Tuned some Reiserfs Parmeters as follows:                    
> 
>                /usr/src/linux/include/linux/reiserfs_fs_sb.h -> JOURNAL_TRANS_MAX = 64 (default-1024)
>                                                                                -> RESERVED_FOR_PRESERVE_LIST=0(default-500) 
>                 /usr/src/linux/include/linux/reiserfs_fs.h  ->  JOURNAL_BLOCK_COUNT = 512 (default-8192)
>                                                          ->  JOURNAL_MAX_BATCH = 63 (default-900)       
> I mount Reiserfs as root using the following options 
> mount -t reiserfs -o notail /dev/hdc1 /mnt
> 
>  The filesytem recovers fine on crash/hardware reset , however I find a consistent increase in my filesytem size(reflected by df not du), which gradually reaches around 92% & all consequetive writes /updates fail.
> 
> As far as changes to files are concerned , I do not create/ delete new files. Only updates are made to some application log files.As such from tuning my journal size is around 2MB now, & I find that any when hardware resets are done, immediately following an update/write, causes recovery of the old log file as well(I assume).
> 
> My total partition size i s 16MB.Here are the filesytem size variations as tracked from du(raw not supported) & df:
> 
> filesystem size             du            df
> 
> original                         11M        13.7M
> 
> update/write                  12M        15.6M
> 
> reboot(s/w reset)            12M        14.2M
> 
> h/w reset/crash              12M         14.2M
> 
> update/write                    12M        15.6M
> 
> reboot                            12M        14.2M
> 
> However, as soon as I do a hardware/cpu reset following an update, the filesytem is recovered, but data is corrupted & filesystem size increases(seems to be appending).
> 
>  filesystem size             du            df
> 
> original                         11M        13.7M
> 
> update/write                  12M        15.6M
> 
> h/w reset                       12M        15.6M.
> 
> update/write -> no space left on device.      
> 
> As I understand, the transaction log/journal is used only for recovery .looks like the old meta data is being preserved.
> 
>  Why keep a backup of the old log/journal on the filesystem , once the filesytem is recovered??Has anyone tested with RESERVED_FOR_PRESERVE_LIST=0 ??
> 
> Do not intend to use -nolog option with mount, as I need journalling on my disk.
> 
> Iam new to journalling/logging concepts.Am I missing something here??How do I curb this overhead??
> 
> Also heard there is patch available for data journalling on reiserfs. But think it would further cause problems with the size restraints(16MB). Is there any way i could achieve both?? Right now Iam syncing data to disks at frequent intervals!
> 
> Any help????
> 
> Thanking in anticipation,
> 
> -Anita
> 
> 
> 
> 
> 
> 
> 
> 
> 
