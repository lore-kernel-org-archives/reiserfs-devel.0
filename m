From: =?ISO-8859-2?Q?Konstantin_M=FCnning?= <konstantin@muenning.com>
Subject: Re: we have got hash function screwed up
Date: Mon, 05 Sep 2005 19:51:38 +0200
Message-ID: <431C85AA.9070700@muenning.com>
References: <431C738F.4010803@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25866-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <431C738F.4010803@freemail.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi!

Gabor HALASZ wrote:

> root@sk8n:~# touch
> /home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.deb
> 
> touch: cannot touch
> `/home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.deb':
> Device or resource busy

Errors like these I've seen mostly with corrupted FS. Umount the
partition (reboot from some live-CD if it's your root partition) and do
an fsck.reiserfs /dev/xxx. I'm quite sure it will find something.

Before trying repairs check if your disk is operational (at least
badblocks -s /dev/xxx) as otherwise things can get worse. And don't
forget to backup as much of your important data as possible - it is very
likely but there's no guarantee that it will survive a repair.

If fsck don't show anything then someone better informed should help you.

Have luck,
Konstantin
