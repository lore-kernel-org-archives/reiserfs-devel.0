From: "Ronny T. Lampert" <telecaadmin@uni.de>
Subject: Re: reiserfsck failing with external journal
Date: Thu, 30 Sep 2004 17:11:35 +0200
Message-ID: <415C2227.603@uni.de>
References: <415C0EEC.30906@uni.de> <415C1D99.9050005@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21975-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <415C1D99.9050005@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shishkin <edward@namesys.com>
Cc: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

Hi,

thanks for your fast answer.

> It is essential to specify right journal device for fsck, although I am 
I am not 100% sure it should be essential.

Eg. jfs_fsck (and all jfs-utils) extracts the journal-dev from the SB (if 
external) and go on checking without any manual intervention, no matter where 
the journal is.
Only if the external journal is broken or somesuch, it will yell.

> Let's first take a look at the scripts that will be broken ;)
My RH9 scripts simply call "fsck -T -R -A -a $fsckoptions" (in 
/etc/rc.d/rc.sysinit).

YOS 2.1.X (which happens to be my test-system) also fails at boot-up dropping 
me into

*** An error occurred during the file system check.
*** Dropping you to a shell; the system will reboot
*** when you leave the shell.

when entering that volume into fstab.

Kind regards,
Ronny
