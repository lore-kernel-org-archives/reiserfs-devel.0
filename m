From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: multiple rebuild-tree aborts
Date: Mon, 30 Jan 2006 19:49:43 +0300
Message-ID: <200601301949.43296.vitaly@namesys.com>
References: <3FB53C8FED80D440841DCFE8CB0514CF043277@AES-MAILCLST.aes.de.ittind.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27937-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FB53C8FED80D440841DCFE8CB0514CF043277@AES-MAILCLST.aes.de.ittind.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: "Bryant, Phillip -AES" <Phillip.Bryant@itt.com>

On Monday 30 January 2006 18:57, Bryant, Phillip -AES wrote:
> RedHat ES Workstation, 2.6.9-11smp
> Dell Precision 530 workstation
> Dell Powervault RAID with 500Gb RAID partition
> reiserfs 3.6.19
>  
> The virtual RAID disk was inadvertantly broken when the Dell powervault was 
> split into two seperate controlers. When the server was brought back up the 
> original virtual disk had to be recreated on the RAID controler.    
>  
> I was surprised that the problem did not wipe out all of the data on the 
> partition but reiserfsck --rebuild-tree had been unable to repiar the 
> partition so it can be mounted. It holds the backups for all servers and 
> pc's in my office.    
>  
> This last run did not abort with bad root block as all previous runs had (4). 

would you describe the message appeared 4 times more precisely?
  
> last run ended with:
>  
> Pass 3a (looking for lost dir/files):
> Looking for lost directories:
> /1956276_1956286/304c28018c1a645410c2905a0c355871semantic_rebuild.c 563 
> get_next_directory_item 
> get_next_directory_item: item [61312722 61312723 0x2a1 DRCT (2)]: hidden entry 0 ''
> Aborted
> 
> I believe all previous aborts happened in phase 0 but I don't really know if 
> this is a good sign or not.  

would you extract the reiserfs metadata with 
	debugreiserfs -p <device> | bzip2 -c > <device>.bz2
and provide the result file for downloading to allow us to debug 
the fsck locally?

have fsck ended with the last message 1 or more times?

> I've run debugreiserfs and gotten this:
>  
> Filesystem state: consistency is not checked after last mounting
> Reiserfs super block in block 16 on 0x5001 of format 3.6 with standard journal
> Count of blocks on the device: 143372080
> Number of bitmaps: 4376
> Blocksize: 4096
> Free blocks (count of blocks - used [journal, bitmaps, data, reserved] blocks): 143372080
> Root block: 0
> Filesystem is NOT clean
> Tree height: 65535
> Hash function used to sort names: "r5"
> Objectid map size 972, max 972
> Journal parameters:
>         Device [0x0]
>         Magic [0x5e4c8641]
>         Size 8193 blocks (including 1 for journal header) (first block 18)
>         Max transaction length 1024 blocks
>         Max batch size 900 blocks
>         Max commit age 30
> Blocks reserved by journal: 0
> Fs state field: 0xfa02:
>         FATAL corruptions exist.
> sb_version: 2
> inode generation number: 23368281
> UUID: fbf09431-c46c-4075-bb79-748d7b26f0a0
> LABEL:
> Set flags in SB:
>         ATTRIBUTES CLEAN
> 
> ************************************
> This e-mail and any files transmitted with it are proprietary and intended 
> solely for the use of the individual or entity to whom they are addressed. 
> If you have received this e-mail in error please notify the sender. Please 
> note that any views or opinions presented in this e-mail are solely those 
> of the author and do not necessarily represent those of ITT Industries, Inc.
> The recipient should check this e-mail and any attachments for the presence 
> of viruses. ITT Industries accepts no liability for any damage caused by any
> virus transmitted by this e-mail.       
> ************************************
> 

-- 
Vitaly
