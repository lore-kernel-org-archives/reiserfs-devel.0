From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: (reiser4)install on root
Date: Fri, 26 Nov 2004 18:35:22 +0300
Message-ID: <1101483321.1768.507.camel@tribesman.namesys.com>
References: <20041126085828.DE0DB37CF0@sitemail.everyone.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22586-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041126085828.DE0DB37CF0@sitemail.everyone.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: bluegod@linuxwaves.com
Cc: reiserfs-list@namesys.com

Hello

On Fri, 2004-11-26 at 11:58, BLuEGoD wrote:
>  Hi, i want to know how to install reiser4 on root with only 1 HD.. I use mkfs.reiser4 from the reiser4 utils after compile and install kernel & patches on a debian woody 2.2.. with a scsi HD, but it crashes (errors found doing mkfs.reiser4 on root device and on next boot I saw a kernel panic).. Note: I did it with the root mounted.. because i need to boot with that HD..
> 

You need a spare partition on that HD. 
mkfs.reiser4 it
mount it /mnt (you need kernel with reiser4 support here)
cp -ax / /mnt
edit /mnt/etc/fstab
make changes in your boot loader. This is the most tricky part.
reboot with reiser4 reboot

PS: if you have troubles - please provide more detailed information
about what you do and what you get.

> Thx
> 
> _____________________________________________________________
> Get your FREE, LinuxWaves.com Email Now! --> http://www.LinuxWaves.com
> Join Linux Discussions! --> http://Community.LinuxWaves.com
> 

