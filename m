From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: (reiser4)install on root
Date: Fri, 26 Nov 2004 18:02:01 +0200
Message-ID: <20041126160201.GN26192@nysv.org>
References: <20041126085828.DE0DB37CF0@sitemail.everyone.net> <1101483321.1768.507.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22587-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1101483321.1768.507.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: bluegod@linuxwaves.com, reiserfs-list@namesys.com

On Fri, Nov 26, 2004 at 06:35:22PM +0300, Vladimir Saveliev wrote:
>
>You need a spare partition on that HD. 
>mkfs.reiser4 it
>mount it /mnt (you need kernel with reiser4 support here)
>cp -ax / /mnt
>edit /mnt/etc/fstab
>make changes in your boot loader. This is the most tricky part.
>reboot with reiser4 reboot

After the mount you can run debootstrap on it, copy the reiser4-enabled
kernel .deb, chroot and install the kernel.

Then just edit fstab and do the bootloader edit, then reboot.

-- 
mjt

