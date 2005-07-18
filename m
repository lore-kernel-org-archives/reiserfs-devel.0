From: Russell Coker <russell@coker.com.au>
Subject: Re: Installing Fedora Core with root on Reiserfs
Date: Mon, 18 Jul 2005 17:01:19 +1000
Message-ID: <200507181701.26284.russell@coker.com.au>
References: <42DAB928.9000303@namesys.com>
Reply-To: russell@coker.com.au,
	For testers of Fedora Core development releases <fedora-test-list@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <fedora-test-list-bounces@redhat.com>
In-Reply-To: <42DAB928.9000303@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <http://www.redhat.com/mailman/listinfo/fedora-test-list>,
	<mailto:fedora-test-list-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/fedora-test-list>
List-Post: <mailto:fedora-test-list@redhat.com>
List-Help: <mailto:fedora-test-list-request@redhat.com?subject=help>
List-Subscribe: <http://www.redhat.com/mailman/listinfo/fedora-test-list>,
	<mailto:fedora-test-list-request@redhat.com?subject=subscribe>
Sender: fedora-test-list-bounces@redhat.com
Errors-To: fedora-test-list-bounces@redhat.com
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: reiserfs-list@namesys.com, fedora-test-list@redhat.com, jeffm@suse.com, reiser@namesys.com

On Monday 18 July 2005 06:01, Edward Shishkin <edward@namesys.com> wrote:
> FC4-test3 (and perhaps FC4) installs its own version of grub which seems
> to interact incorrectly with reiserfs. The problem is that reiserfs.ko
> module located on reiserfs partition can not be loaded.

Firstly there is no situation in which reiserfs.ko will be loaded from a 
reiserfs partition.

If the root file system is reiserfs then reiserfs.ko will (or at least should) 
be included in the initrd.  The GRUB support for ReiserFS is based on the 
file /boot/grub/reiserfs_stage1_5 which is only needed for /boot on ReiserFS.

Some people believe that /boot should be a separate file system to the root 
file system regardless of all other issues.  All systems which use LVM for 
the root file system on Fedora (the default partitioning involves LVM) will 
have a separate /boot file system because GRUB apparently doesn't support LVM 
(yet).

So having a /boot with Ext2/3 is an easy solution to any ReiserFS booting 
issues, and a solution that will be forced on the users if they use LVM.  
When using a small /boot file system ReiserFS is not a good choice.  A quick 
test showed that Ext3 gave 18M more usable disk space from a 100M file system 
than ReiserFS, this will essentially force all LVM users to use Ext3 
for /boot.

> 1. (Requires some partition formatted by ext2).
>    At the end of installation process (after invitation to reboot) boot
> from some rescue CD, mount reiserfs root partition (say to /mnt) and move
> all the compressed images (vmlinuz-xxx and initrd-xxx located at /mnt/boot)
> to your ext2 partition. Then edit the file /mnt/boot/grub/grub.conf
> pointing a new location for the images. Reboot and finish the
> installation
>    process.

This can be done automatically through the Anaconda GUI or through kickstart.  
Just specify that /boot is to be a separate partition of type Ext3.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

-- 
fedora-test-list mailing list
fedora-test-list@redhat.com
To unsubscribe: 
http://www.redhat.com/mailman/listinfo/fedora-test-list
