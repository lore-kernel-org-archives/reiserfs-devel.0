From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: WARNING: Cannot unlink 2281245 (-2)
Date: Thu, 14 Aug 2008 14:01:13 +0400
Message-ID: <48A40269.6000102@gmail.com>
References: <48A3E64F.4090401@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <48A3E64F.4090401@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anders Aagaard <aagaande@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Anders Aagaard wrote:
> Hi
>
> I've been testing reiser4 on root for the last day or so, and I ran
> into some trouble while rebuilding my world file (on a gentoo system).
>
> I get this rebuilding gcc:
>
> reiser4[rm(8699)]: reiser4_unlink_common
> (fs/reiser4/plugin/inode_ops.c:295)[nikita-3398]:
> WARNING: Cannot unlink 2281245 (-2)
>
> At the same time I see this in the build output:
> rm: cannot remove directory
> `/var/tmp/portage/sys-devel/gcc-4.2.4/work/gcc-4.2.4/libjava/classpath/resource/gnu/java/locale':
> Directory not empty
>
> This is reiser4 mounted directly from a hd, no lvm/raid/encryption on
> this drive, it's mounted with noatime, and built with
> create=ccreg40,compress=lzo1.
>
> I use reiser4progs from gentoo, latest (aka reiser4progs-1.0.6 with
> reiser4progs-1.0.6-preen.patch applied).  And gentoo-sources 2.6.25-r7
> with reiser4-for-2.6.25.patch applied (from kernel.org).
>
> Unfortunatly due to the massive spam from reiser4fsck when running
> compressed filesystem I have no idea if I've gotten any
> errors/warnings there.
>
> Let me know what kind of additional information you need.

Has fsck finished work?
If yes, then what is the latest message about filesystem status?
Note, that spam can be suppressed by the option -s.

Thanks,
Edward.

>
> Anders Aagaard
>
> PS : Computer survives memtest and prime overnight, smartd reports no
> errors on the disk.
> -- 
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

