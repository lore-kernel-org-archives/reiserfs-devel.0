From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4 problem with pam_mktemp
Date: Sun, 31 Jul 2005 17:34:12 +0400
Message-ID: <42ECD354.8010304@namesys.com>
References: <42E907E4.7090003@parkheights.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25274-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42E907E4.7090003@parkheights.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: sergey ivanov <seriv@parkheights.dyndns.org>
Cc: reiserfs-list@namesys.com

Hello

sergey ivanov wrote:
> I have a problem with reiser4.
> Recently I have installed Altlinux Compact-rc2 on reiserfs (v3.6),
> patched kernel 2.6.12 with patch 2.6.12-mm2, created new reiser4
> partition hda6 and copied by #cp -ax / /mnt/hda6 there. Fixed /etc/fstab
> and /boot/grub for new partition and booted. And could not login, with
> messages in virtual consoles :
> ---
> 
> pam_tcb[8386]:  login: Authentication passed for root from (uid=0)
> Login incorrect
> ---
> So I rebooted in original on reiserfs 3.6, edited /mnt/hda6/etc/inittab to change one of "/sbin/mingetty tty6" to be "/bin/bash" and after reboot to reiser4 based system saw, that the problem in pam_mktemp, by commenting out string 
> # account  required  pam_mktemp.so
> in file /etc/pam.d/system_auth the problem get fixed. 
> Also it get fixed if I create some non-reiser4 partition to place /tmp on it.
> 

Thanks for the report.
The problem is that reiser4 does not support ext2's file attributes pam_mktemp deals with.

Maybe reiser4 should have support for that like reiserfs, but now it does not.
