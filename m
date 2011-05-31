From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: ??? in directory listing on reier4 partition
Date: Tue, 31 May 2011 19:07:47 +0200
Message-ID: <4DE52063.4090406@gmail.com>
References: <83626a772bd9688776d2cce0f1dfdcba@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <83626a772bd9688776d2cce0f1dfdcba@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On 05/31/2011 06:11 PM, doiggl@velocitynet.com.au wrote:
> Hello,
> I spotted a directory with this in it [1] on a reiser 4 partition.
> #dmesg has the following in it [2]
> Is it repairable with the following command ?
> # fsck.reiser4 --build-fs  /dev/sdb

Making diagnostics is a deal of fsck.reiser4
running without options (or with the option
--check - this is the same).


> Do I have to run the fsck.reiser4 command multiple times ?

fsck.reiser4 (without options) should be run once.

Thanks,
Edward.

> Last time I ran it just once with this result.
> http://www.spinics.net/lists/reiserfs-devel/msg02855.html
>
> Thanks Glenn
>
> [1]
> # ll
> ??????????  ? ?    ?         ?            ? sysstat
> ??????????  ? ?    ?         ?            ? team-viewer
> ??????????  ? ?    ?         ?            ? tips
> -rw-r--r--  1 root root  51960 Oct 23  2009
> traceroute-howto-read-output.html
> drwxr-xr-x  2 root root      8 Oct 23  2009
> traceroute-howto-read-output_files
>
> [2]-#dmesg output has many more lines like this.
> [13582.086149] WARNING: Error for inode 965323 (-2)
> [13582.086200] reiser4[ls(23149)]: key_warning
> (/usr/src/packages/BUILD/kernel-reiser4-2.6.38.6/linux-2.6.38.6/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
> [13582.086205] WARNING: Error for inode 965335 (-2)
> [13582.086255] reiser4[ls(23149)]: key_warning
> (/usr/src/packages/BUILD/kernel-reiser4-2.6.38.6/linux-2.6.38.6/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
> [13582.086260] WARNING: Error for inode 965343 (-2)
> [13582.086335] reiser4[ls(23149)]: key_warning
> (/usr/src/packages/BUILD/kernel-reiser4-2.6.38.6/linux-2.6.38.6/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
> [13582.086340] WARNING: Error for inode 965352 (-2)
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

