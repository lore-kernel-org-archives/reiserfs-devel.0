From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: After `quotacheck` ReiserFS Root Filesystem Won't Mount Read-Write
Date: Tue, 17 Aug 2004 03:03:40 +0200
Sender: bernd-schubert@web.de
Message-ID: <200408170303.41737.bernd-schubert@web.de>
References: <22c16c22abfc.22abfc22c16c@optonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20346-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <22c16c22abfc.22abfc22c16c@optonline.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tuesday 17 August 2004 02:12, nickyt44@optonline.net wrote:
> Hi All,
>
> I hope someone can help me to fix my broken system.  I'm using Libranet
> 2.8.1 (debian-based) with kernel 2.4.26. It's a dual-boot (grub

You probably didn't apply Chris' patches, they are required for quota support 
in 2.4.X

ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.25/

(they also apply to 2.4.{26,27}

> bootloader) with Win XP.  I'm pretty sure I know what happened and why,
> I just don't know how to resolve it.
>
>
> Now that the `usrquota` option is choking my system, I want to edit it
> out...but I can't because the root (/) filesystem will only mount
> read-only.  Which brings me to the crux of the matter:  if I can't
> re-edit the /etc/fstab file to eliminate the offending option, and I
> can't force reiserfs to mount properly as a read-write root filesystem,
> how do I recover my system?
>
> mount:  / not mounted already or bad option`.  I've tried using a
> knoppix live cd to edit the /etc/fstab directory, but the /etc/fstab
> shown when I cd to /etc/fstab is one created by knoppix and not the
> /etc/fstab on my root /dev/hde2.

This would work, you should make familiar yourself with "chroot", read the 
manpage! E.g. from knoppix:

mount /dev/hde2 /mnt/hde2
chroot /mnt/hde2
vi /etc/fstab
exit
reboot

>
> How do I force reiserfs to mount read-write in order to edit the
> /etc/fstab file?  Although I have a recent backup of my Libranet system,
> I'm hoping not to do a reinstall.  TIA.

There are a dozens other ways for doing this, e.g. issuing as kernel parameter
"init=/bin/bash rw"

Then after booting:
vi /etc/fstab
sync; sync;  sync
reboot     
(This command (reboot) will probably fail, so you will have to press the reset 
button ;) )


Cheers,
 Bernd

