From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Partial data loss with reiserfs3
Date: Mon, 14 Feb 2005 20:08:32 +0300
Message-ID: <200502142008.32009.vitaly@namesys.com>
References: <1108315756.420f8e6ce67b0@webmail.vu.lt> <200502141921.58903.vitaly@namesys.com> <1108399109.4210d40511ea6@webmail.vu.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1108399109.4210d40511ea6@webmail.vu.lt>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Laurynas Biveinis <Laurynas.Biveinis@mif.vu.lt>
Cc: reiserfs-list@namesys.com

On Monday 14 February 2005 19:38, Laurynas Biveinis wrote:
> Cituojant Vitaly Fertman <vitaly@namesys.com>:
> > > [root@laurynas-pc ~]# mkfs -t reiserfs /dev/hda6
> >
> > did you shrink ntfs under win and reboot?
>
> NTFS was shrinked several reboots ago under Linux with
> ntfsresize/fdisk.
>
> > what happened between the last boot and mkfs?
>
> I do not remember well and .bash_history isn't very helpful there. It's
> very likely that mkfs was the first thing after boot.
>
> > did you run fdisk then? did you reboot after that fdisk run?
>
> I'm not sure what does "then" mean? After "mkfs -t reiserfs /dev/hda6"?
> No, I didn't run fdisk or reboot then - I copied data.

then meant before. ok, if you did not run fdisk between boot and 
mkreiserfs, then mount, copy, umount were probably fine.

after that you run fidsk -- have you run 'reiserfsck --rebuild-sb' after fdisk? 
actually resize.reiserfs does not touch data on expand at all, it just writes
bitmap blocks to the added part.

what does 
	debugreiserfs /dev/hda6
say?

what version of reiserfsprogs do you use?

-- 
Thanks,
Vitaly Fertman

