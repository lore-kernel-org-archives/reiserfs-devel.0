From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Partial data loss with reiserfs3
Date: Mon, 14 Feb 2005 19:21:58 +0300
Message-ID: <200502141921.58903.vitaly@namesys.com>
References: <1108315756.420f8e6ce67b0@webmail.vu.lt> <200502141544.34513.vitaly@namesys.com> <1108392048.4210b87003405@webmail.vu.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1108392048.4210b87003405@webmail.vu.lt>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Laurynas Biveinis <Laurynas.Biveinis@mif.vu.lt>
Cc: reiserfs-list@namesys.com

On Monday 14 February 2005 17:40, Laurynas Biveinis wrote:
> Hello,
>
> Cituojant Vitaly Fertman <vitaly@namesys.com>:
> > reboot is required between repartitioning a drive and starting to use
> >
> > moved/created partitions. without that the kernel may continue to
> > use
> > old partition table. so it would be great to recall step-by-step
> > history
> > of your copings, removes, repatitionings and reboots.
>
> Starting from the last successful cpio between old and new /home
> partitions - can I assume that data was intact at this point if cpio
> succeeded?
>
> At this point the disk has, in order of physical layout: /dev/hda5
> (NTFS), 4GB /dev/hda6 (no FS), 2GB /dev/hda7 (reiser).
>
> I tried my best to reconstruct this history, but there might be some
> mistakes, of course.
>
> [root@laurynas-pc ~]# mkfs -t reiserfs /dev/hda6

did you shrink ntfs under win and reboot?
what happened between the last boot and mkfs? 
did you run fdisk then? did you reboot after that fdisk run?

-- 
Thanks,
Vitaly Fertman

