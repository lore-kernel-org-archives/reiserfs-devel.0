From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4: errors AFTER fsck
Date: Sat, 05 Apr 2008 00:21:01 +0400
Message-ID: <47F68DAD.5010305@gmail.com>
References: <200804041938.18418.volker.armin.hemmann@tu-clausthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200804041938.18418.volker.armin.hemmann@tu-clausthal.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Volker Armin Hemmann <volker.armin.hemmann@tu-clausthal.de>
Cc: ReiserFS List <reiserfs-devel@vger.kernel.org>

Volker Armin Hemmann wrote:

>Hi,
>
>I have /var on reiser4 with compression plugin. /var contains the usual stuff 
>+ gentoo portage tree + kernel-sources.
>
>An hour ago I wanted to emerge --sync, which failed. I got fs errors.
>  
>


What exactly was wrong with emerge?
Did you access to compressed reiser4 partition via nfs?


>I rebooted into busybox and did fsck.reiser4 /dev/sda6
>
>It ran and told me that  --build-fs was needed.
>
>So I ran it. It fixed lots of stuff (mostly lenght correction) and put 222 
>files into lost+found.
>
>After boot, I tried to access some of the files there, to figure out what I 
>lost:
>
>[  566.765093] reiser4[ls(4761)]: key_warning 
>(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
>[  566.765094] WARNING: Error for inode 248375 (-2)
>[  566.765109] reiser4[ls(4761)]: key_warning 
>(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
>[  566.765111] WARNING: Error for inode 248373 (-2)
>[  566.765125] reiser4[ls(4761)]: key_warning 
>(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
>[  566.765127] WARNING: Error for inode 248374 (-2)
>
>  
>

Uhm.. fsck created inaccessible lost+found..

Would you please pack your metadata by
debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
and let me download the file meta.gz

Thanks,
Edward.
