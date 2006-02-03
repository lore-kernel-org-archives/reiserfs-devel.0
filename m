From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: Reiser4 on powerpc; unresolved symbol, panic
Date: Fri, 03 Feb 2006 09:52:20 -0600
Message-ID: <1138981940.24587.45.camel@gentoo>
References: <1713.66.131.16.74.1138976256.squirrel@x2a.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28001-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1713.66.131.16.74.1138976256.squirrel@x2a.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Bastien-Filiatrault <joe@x2a.org>
Cc: reiserfs-list@namesys.com

I tried the same change with the 2.6.15-1 patch on my beige g3 and got a
hard lock attempting to mount a reiser4 filesystem and no messages
logged. The previous behavior has been for reiser4 filesystems, even
created on a working architecture, to gracefully fail to mount.

I don't think Namesys is prioritizing PPC support yet, which is
understandable.

On Fri, 2006-02-03 at 09:17 -0500, Jonathan Bastien-Filiatrault wrote:
> Hi,
> Seing that reiser4 was pretty much stable on my i386 workstation, I
> decided to give it a try on my iBook 2001 dual-usb.
> 
> While compiling the new kernel for my laptop (2.6.15 + debian, reiser4
> patched, built-in), it gave new_page as an unresolved symbol in
> fs/reiser4/plugin/item/tail.c . By looking at the context of the file, I
> changed new_page for page.
> 
> With that, I was able to start rsyncing my system back on the laptop
> (using a rescue partition, with the same kernel). Unfortunately, about
> halfway through, it gave a pretty ugly panic; the dmesg output is
> attached. Running 'sync' or 'umount' on the filesystem resulted in that
> userspace program to stop responding completely. After a reboot, a fsck on
> the reiser4 filesystem resulted in total anhilation (thousands of files in
> lost+found, none in the rest of the filesystem).
> 
> Hopefully, I have good backup habits (my workstation is backed up twice a
> week in case of reiser4 snafu), no data was lost, so I wont be suing
> namesys ;P.
> 
> Thanks for the great filesystem,
> Keep up the great work,
> Jonathan
-- 
Jake Maciejewski <maciejej@msoe.edu>

