From: Edward Shishkin <edward@namesys.com>
Subject: Re: Undeletable directory in reiser4
Date: Wed, 11 Jul 2007 16:31:35 +0400
Message-ID: <4694CDA7.504@namesys.com>
References: <2a12af650707101003i660dc33fv33ff1557ee84e3e2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <2a12af650707101003i660dc33fv33ff1557ee84e3e2@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marti Raudsepp <marti@juffo.org>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Marti Raudsepp wrote:

> Hi,


Hi,
any ideas about kernel version that generated such
inconsistency? It seems this is an old bug..

Please, check your partition by fsck.reiser4.
To check root partition, boot in single mode and remount it as
readonly.

Thanks,
Edward.

>
> I seem to have found a tripped on a bug in reiser4: there is a
> directory on my reiser4 partition that cannot be deleted since it is
> supposedly "not empty", however, rm -rf cannot find any more files to
> delete.
>
> # rm -rf /var/tmp/portage
> rm: cannot remove directory `/var/tmp/portage/sys-devel/gcc-4.1.2/work/
> gcc-4.1.2/libjava/classpath/resource/gnu/java/locale': Directory not 
> empty
>
> I mounted the partition as read-only to get some more information out
> of it with the debugfs.reiser4 tool. Note that the partition's vartmp/
> directory is bind-mounted to /var/tmp.
>
> Is there anything else I can do to help debug this? Will
> CONFIG_REISER4_DEBUG help?
>
> # debugfs.reiser4 /dev/primary/reiser4 --print-file 
> /vartmp/portage/sys-devel/
> gcc-4.1.2/work/gcc-4.1.2/libjava/classpath/resource/gnu/java/locale
>
> exts:           3
> mask:           0x7
> plugin:         sdext_lw
> offset:         2
> len:            14
> mode:           drwxr-xr-x
> nlink:          2
> size:           3
> plugin:         sdext_unix
> offset:         16
> len:            28
> uid:            250
> gid:            250
> atime:          Wed Jun 27 12:24:27 2007
> mtime:          Wed Jun 27 13:16:01 2007
> ctime:          Tue Jul 10 03:10:03 2007
> rdev:           182
> bytes:          182
> plugin:         sdext_lt
> offset:         44
> len:            12
> atime:          0
> mtime:          0
> ctime:          0
>
>
> NR(2)  NAME     OFFSET HASH                              SDKEY
>  0 .            54 0000000000000000:0000000000000000 041aac1:0041aad
>  1 ..           78 0000000000000000:0000000000000000 041aab1:0041aac
>
> # debugfs.reiser4 /dev/primary/reiser4 --print-file 
> /vartmp/portage/sys-devel/
> gcc-4.1.2/work/gcc-4.1.2/libjava/classpath/resource/gnu/java
>
> exts:           3
> mask:           0x7
> plugin:         sdext_lw
> offset:         2
> len:            14
> mode:           drwxr-xr-x
> nlink:          3
> size:           3
> plugin:         sdext_unix
> offset:         16
> len:            28
> uid:            250
> gid:            250
> atime:          Wed Jun 27 12:24:27 2007
> mtime:          Wed Jun 27 13:16:01 2007
> ctime:          Tue Jul 10 03:10:03 2007
> rdev:           150
> bytes:          150
> plugin:         sdext_lt
> offset:         44
> len:            12
> atime:          0
> mtime:          0
> ctime:          0
>
>
> NR(3)  NAME     OFFSET HASH                              SDKEY
>  0 .            80 0000000000000000:0000000000000000 041aab1:0041aac
>  1 ..          104 0000000000000000:0000000000000000 041a981:0041aab
>  2 locale      128 0000000000000000:0000000000000000 041aac1:0041aad
>
>
> Hope this helps.
>
> Regards,
> Marti Raudsepp
> -
> To unsubscribe from this list: send the line "unsubscribe 
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>

