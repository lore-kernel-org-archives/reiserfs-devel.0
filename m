From: Edward Shishkin <edward@namesys.com>
Subject: Re: Installing Fedora Core with root on Reiserfs
Date: Mon, 18 Jul 2005 11:43:47 +0400
Message-ID: <42DB5DB3.3020809@namesys.com>
References: <42DAB928.9000303@namesys.com> <200507181701.26284.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25172-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200507181701.26284.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: russell@coker.com.au
Cc: reiserfs-list@namesys.com, fedora-test-list@redhat.com, jeffm@suse.com, reiser@namesys.com

Russell Coker wrote:

>On Monday 18 July 2005 06:01, Edward Shishkin <edward@namesys.com> wrote:
>  
>
>>FC4-test3 (and perhaps FC4) installs its own version of grub which seems
>>to interact incorrectly with reiserfs. The problem is that reiserfs.ko
>>module located on reiserfs partition can not be loaded.
>>    
>>
>
>Firstly there is no situation in which reiserfs.ko will be loaded from a 
>reiserfs partition.
>  
>

Hmmm... actually this is a default situation when installing with root 
on reiserfs..

>If the root file system is reiserfs then reiserfs.ko will (or at least should) 
>be included in the initrd. 
>

Right, but initrd is in /boot which is not something separate: it is on the
same reiserfs root partition..

> The GRUB support for ReiserFS is based on the 
>file /boot/grub/reiserfs_stage1_5 which is only needed for /boot on ReiserFS.
>
>Some people believe that /boot should be a separate file system to the root 
>file system regardless of all other issues.  All systems which use LVM for 
>the root file system on Fedora (the default partitioning involves LVM) will 
>have a separate /boot file system because GRUB apparently doesn't support LVM 
>(yet).
>
>So having a /boot with Ext2/3 is an easy solution to any ReiserFS booting 
>issues, and a solution that will be forced on the users if they use LVM.  
>When using a small /boot file system ReiserFS is not a good choice.  A quick 
>test showed that Ext3 gave 18M more usable disk space from a 100M file system 
>than ReiserFS, this will essentially force all LVM users to use Ext3 
>for /boot.
>
>  
>
>>1. (Requires some partition formatted by ext2).
>>   At the end of installation process (after invitation to reboot) boot
>>from some rescue CD, mount reiserfs root partition (say to /mnt) and move
>>all the compressed images (vmlinuz-xxx and initrd-xxx located at /mnt/boot)
>>to your ext2 partition. Then edit the file /mnt/boot/grub/grub.conf
>>pointing a new location for the images. Reboot and finish the
>>installation
>>   process.
>>    
>>
>
>This can be done automatically through the Anaconda GUI or through kickstart.  
>Just specify that /boot is to be a separate partition of type Ext3.
>
>  
>

