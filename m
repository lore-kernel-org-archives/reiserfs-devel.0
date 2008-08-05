From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 warning: nikita-3233, extent2tail/release_unix_file failure
Date: Tue, 05 Aug 2008 22:09:04 +0400
Message-ID: <48989740.4080004@gmail.com>
References: <54b33ccd0808050840i5ea6c424q4aa0f5ca2cb20142@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <54b33ccd0808050840i5ea6c424q4aa0f5ca2cb20142@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marti Raudsepp <marti@juffo.org>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Marti Raudsepp wrote:
> Hello reiserfs-devel,
>
> I don't know what sort of workload caused this problem, but I found
> these warnings in my dmesg. I am using reiser4 for /usr/portage
>   

Hello.

Actually this is complaints about no disk space (28 == ENOSPC).
And your free disk space looks far from being exhausted, right?

I think this is other side of the problem I have announced
(leak of disk space related to tail conversion). Unfortunately,
I have lost the scenario for reproducing this problem.
Will go to todo-list.

Thanks,
Edward.


> (Gentoo Portage tree) and /usr/src and /var/tmp where compilation
> takes place, so presumably it's one of: rsync on lots of small files,
> untarring, compiling, copying files off the partition, or recursive
> rm.
>
> I have a hunch that these errors happened during the icedtea6 Java VM
> compilation, which failed with awkward "file not found" errors once,
> but worked on the second attempt, and the timestamp seems to agree.
> Whatever it was, it's gone now. Reading all files on the partition did
> not reproduce the warnings (using "find -xdev -type f |xargs cat --
>   
>> /dev/null"); nor did fsck.reiser4 find any problems with any of the
>>     
> file systems.
>
> Someone else also reported this warning back in 2006 June:
> http://www.mail-archive.com/reiserfs-list@namesys.com/msg21231.html
>
> I'm using the vanilla 2.6.26 kernel, with reiser4-for-2.6.25.patch.gz,
> on AMD64; reiser4 partitions are all mounted from LVM2 logical volumes
> on a single SATA disk.
>
> Here's the dmesg output:
>
> [1006806.639929] reiser4[scanelf(873)]: extent2tail
> (fs/reiser4/plugin/file/tail_conversion.c:666)[]:
> [1006806.639931] WARNING: reiser4_write_tail failed
> [1006806.639939] reiser4[scanelf(873)]: release_unix_file
> (fs/reiser4/plugin/file/file.c:2332)[nikita-3233]:
> [1006806.639941] WARNING: Failed (-28) to convert in release_unix_file (4915530)
> [1006806.695995] reiser4[scanelf(873)]: extent2tail
> (fs/reiser4/plugin/file/tail_conversion.c:666)[]:
> [1006806.695995] WARNING: reiser4_write_tail failed
> [1006806.695995] reiser4[scanelf(873)]: release_unix_file
> (fs/reiser4/plugin/file/file.c:2332)[nikita-3233]:
> [1006806.695995] WARNING: Failed (-28) to convert in release_unix_file (4915541)
> [1006806.723582] reiser4[scanelf(873)]: extent2tail
> (fs/reiser4/plugin/file/tail_conversion.c:666)[]:
> [1006806.723584] WARNING: reiser4_write_tail failed
> [1006806.723589] reiser4[scanelf(873)]: release_unix_file
> (fs/reiser4/plugin/file/file.c:2332)[nikita-3233]:
> [1006806.723591] WARNING: Failed (-28) to convert in release_unix_file (4915584)
> [1006806.726080] reiser4[scanelf(873)]: extent2tail
> (fs/reiser4/plugin/file/tail_conversion.c:666)[]:
> [1006806.726082] WARNING: reiser4_write_tail failed
> [1006806.726086] reiser4[scanelf(873)]: release_unix_file
> (fs/reiser4/plugin/file/file.c:2332)[nikita-3233]:
> [1006806.726088] WARNING: Failed (-28) to convert in release_unix_file (4915586)
> [1006894.003824] reiser4[scanelf(873)]: extent2tail
> (fs/reiser4/plugin/file/tail_conversion.c:666)[]:
> [1006894.003826] WARNING: reiser4_write_tail failed
> [1006894.003834] reiser4[scanelf(873)]: release_unix_file
> (fs/reiser4/plugin/file/file.c:2332)[nikita-3233]:
> [1006894.003836] WARNING: Failed (-28) to convert in release_unix_file (4845576)
> [1006894.007824] reiser4[scanelf(873)]: extent2tail
> (fs/reiser4/plugin/file/tail_conversion.c:666)[]:
> [1006894.007826] WARNING: reiser4_write_tail failed
> [1006894.007831] reiser4[scanelf(873)]: release_unix_file
> (fs/reiser4/plugin/file/file.c:2332)[nikita-3233]:
> [1006894.007832] WARNING: Failed (-28) to convert in release_unix_file (4845584)
> [1006894.024284] reiser4[scanelf(873)]: extent2tail
> (fs/reiser4/plugin/file/tail_conversion.c:666)[]:
> [1006894.024286] WARNING: reiser4_write_tail failed
> [1006894.024291] reiser4[scanelf(873)]: release_unix_file
> (fs/reiser4/plugin/file/file.c:2332)[nikita-3233]:
> [1006894.024293] WARNING: Failed (-28) to convert in release_unix_file (4845637)
>
> That's all I could think of.
>
> Regards,
> Marti
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

