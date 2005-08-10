From: sergey ivanov <seriv@parkheights.dyndns.org>
Subject: Re: reiser4 problem with pam_mktemp
Date: Tue, 09 Aug 2005 23:41:28 -0400
Message-ID: <42F97768.5010602@parkheights.dyndns.org>
References: <42E907E4.7090003@parkheights.dyndns.org> <42ECD354.8010304@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25384-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42ECD354.8010304@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Hi Vladimir,
pam_mktemp can work on filesystem which does not support ext2's file attributes.
For example, it works well on tmpfs.
For pam_mktemp to recognize the case and work without attributes, 
the filesystem should return 'ENOTTY' (Inappropriate ioctl for device) 
as a result of an setting/getting attributes call, as it tmpfs does. 
But reiser4 returns 'ENOSYS' (Function not implemented).
Will you accept patch changing this code to 'ENOTTY'?
	Sergey

Vladimir V. Saveliev wrote:

> Hello
>
> sergey ivanov wrote:
>
>> I have a problem with reiser4.
>> Recently I have installed Altlinux Compact-rc2 on reiserfs (v3.6),
>> patched kernel 2.6.12 with patch 2.6.12-mm2, created new reiser4
>> partition hda6 and copied by #cp -ax / /mnt/hda6 there. Fixed /etc/fstab
>> and /boot/grub for new partition and booted. And could not login, with
>> messages in virtual consoles :
>> ---
>>
>> pam_tcb[8386]:  login: Authentication passed for root from (uid=0)
>> Login incorrect
>> ---
>> So I rebooted in original on reiserfs 3.6, edited
>> /mnt/hda6/etc/inittab to change one of "/sbin/mingetty tty6" to be
>> "/bin/bash" and after reboot to reiser4 based system saw, that the
>> problem in pam_mktemp, by commenting out string # account  required 
>> pam_mktemp.so
>> in file /etc/pam.d/system_auth the problem get fixed. Also it get
>> fixed if I create some non-reiser4 partition to place /tmp on it.
>>
>
> Thanks for the report.
> The problem is that reiser4 does not support ext2's file attributes
> pam_mktemp deals with.
>
> Maybe reiser4 should have support for that like reiserfs, but now it
> does not.


