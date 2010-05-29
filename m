From: Danila Beketov <danila.beketov@gmail.com>
Subject: Re: reiser4: mv command lost folder.
Date: Sat, 29 May 2010 09:08:50 +0400
Message-ID: <AANLkTildYHfsdvVPxZmpgAUuyF4BEfp7GOYakjclVuAx@mail.gmail.com>
References: <AANLkTilTr_Yt0OWx1ED8pt2pM0rZc4FCg9obrNKVX2w9@mail.gmail.com>
	<4BFF90A9.2050209@gmail.com>
	<AANLkTimGrw7rDQb8d21MfP1xZHRFki-QhjzoLFD4cUJB@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=+GBix568LHx3fR+C+G1HTFgUgADQb23UnVYWE7aOFV8=;
        b=DGOJHJ/Bi9WfMO/8/u6DBBOC3np8X6nRF8K/4xfQakUNf2cvPgndmFAGl6coo1DriR
         8CMhYA4WRCmUdT3xsG0s2xgA8cLQwNeOGm9x3hCNAdfngqrHoKatBz8uekWEYJKCTrwj
         B7fhCcMY/fsp+LojlJGViWp3P631+kPxN0K4s=
In-Reply-To: <AANLkTimGrw7rDQb8d21MfP1xZHRFki-QhjzoLFD4cUJB@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: reiserfs-devel@vger.kernel.org

2010/5/28 Edward Shishkin <edward.shishkin@gmail.com>:
> Danila Beketov wrote:
>> Hello,
>>
> Hello
>> Need help to return my lost folder, that has disappeared after mv
>> command execution by magic way.
>>
>
> Interesting. Just has disappeared without any kernel complaints?

No any kernel errors about it.

> This is fsck bug.
>
> Would you please pack the metadata by
> debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
> and let me download the file meta.gz

Here's the link for download http://rapidshare.com/files/392785083/meta=
=2Egz.html

Problems with my home on reiser4 started when I have updated kernel
from 31 to 32. Once I found than my system has suspened.
Below part of /var/log/messages of that moment.

May 19 20:04:32 beda kernel: ------------[ cut here ]------------
May 19 20:04:32 beda kernel: kernel BUG at fs/reiser4/txnmgr.c:1116!
May 19 20:04:32 beda kernel: invalid opcode: 0000 [#1] PREEMPT
May 19 20:04:32 beda kernel: last sysfs file:
/sys/devices/pci0000:00/0000:00:1f.2/host3/target3:0:0/3:0:0:0/block/sd=
b/dev
May 19 20:04:32 beda kernel: Modules linked in: vboxnetadp vboxnetflt
vboxdrv ipv6 oss_usb oss_envy24ht osscore btusb bluetooth nvidia(P)
uvcvideo videodev v4l1_compat i2c_i801 parport_pc parport i2c_core
May 19 20:04:32 beda kernel:
May 19 20:04:32 beda kernel: Pid: 1453, comm: ent:sda8! Tainted: P
=A0 =A0 =A0(2.6.32-gentoo-r7 #1) MS-6728
May 19 20:04:32 beda kernel: EIP: 0060:[<c10d4625>] EFLAGS: 00010202 CP=
U: 0
May 19 20:04:32 beda kernel: EIP is at reiser4_txn_end+0x511/0x55f
May 19 20:04:32 beda kernel: EAX: 000073cd EBX: 00000000 ECX: 00000001
EDX: ed46a9a8
May 19 20:04:32 beda kernel: ESI: f6adfe48 EDI: f661d0ec EBP: f6adfe68
ESP: f6adfe10
May 19 20:04:32 beda kernel: DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 00=
68
May 19 20:04:32 beda kernel: Process ent:sda8! (pid: 1453, ti=3Df6ade00=
0
task=3Df7083000 task.ti=3Df6ade000)
May 19 20:04:32 beda kernel: Stack:
May 19 20:04:32 beda kernel: f6adfe40 00000000 edce7e00 f6b3ec00
edce7ee8 edce7e74 ef133100 00000000
May 19 20:04:32 beda kernel: <0> f70832e8 f7083000 f6adff30 f6adff6c
ed46a900 f6adff6c 000000a4 00000000
May 19 20:04:32 beda kernel: <0> 00000000 00000000 00000000 f6adff30
ed46a900 f661d0dc f6adfe74 c10d467e
May 19 20:04:32 beda kernel: Call Trace:
May 19 20:04:32 beda kernel: [<c10d467e>] ? reiser4_txn_restart+0xb/0x1=
a
May 19 20:04:32 beda kernel: [<c10d49b3>] ? flush_some_atom+0x326/0x40d
May 19 20:04:32 beda kernel: [<c10e1a3c>] ? reiser4_writeout+0xe5/0x1af
May 19 20:04:32 beda kernel: [<c1099d8a>] ? writeback_inodes_wb+0x308/0=
x398
May 19 20:04:32 beda kernel: [<c10e2390>] ? entd+0x19a/0x36a
May 19 20:04:32 beda kernel: [<c10e21f6>] ? entd+0x0/0x36a
May 19 20:04:32 beda kernel: [<c1036fa3>] ? kthread+0x66/0x68
May 19 20:04:32 beda kernel: [<c1036f3d>] ? kthread+0x0/0x68
May 19 20:04:32 beda kernel: [<c10033e3>] ? kernel_thread_helper+0x7/0x=
14
May 19 20:04:32 beda kernel: Code: ff ff 83 68 14 01 f6 40 08 08 0f 84
07 fd ff ff e8 24 f7 1c 00 e9 fd fc ff ff 8d 74 26 00 e8 16 f7 1c 00
8d 76 00 e9 47 ff ff ff <0f> 0b eb fe 8b 15 0c 72 3b c1 89 44 24 1c c7
44 24 18 66 62 35
May 19 20:04:32 beda kernel: EIP: [<c10d4625>]
reiser4_txn_end+0x511/0x55f SS:ESP 0068:f6adfe10
May 19 20:04:32 beda kernel: ---[ end trace b124ba6423e10bd4 ]---
May 19 20:04:32 beda kernel: note: ent:sda8![1453] exited with preempt_=
count 1

I hasn't started fsck after reset at once and has shown in the log the =
follow:

May 19 20:19:20 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:20 beda kernel: WARNING: Too many iterations: 128
May 19 20:19:20 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:20 beda kernel: WARNING: Too many iterations: 256
May 19 20:19:20 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:20 beda kernel: WARNING: Too many iterations: 512
May 19 20:19:20 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:20 beda kernel: WARNING: Too many iterations: 1024
May 19 20:19:20 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:20 beda kernel: WARNING: Too many iterations: 2048
May 19 20:19:20 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:20 beda kernel: WARNING: Too many iterations: 4096
May 19 20:19:20 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:20 beda kernel: WARNING: Too many iterations: 8192
May 19 20:19:20 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:20 beda kernel: WARNING: Too many iterations: 16384
May 19 20:19:20 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:20 beda kernel: WARNING: Too many iterations: 32768
May 19 20:19:21 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:21 beda kernel: WARNING: Too many iterations: 65536
May 19 20:19:21 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:21 beda kernel: WARNING: Too many iterations: 131072
May 19 20:19:23 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:23 beda kernel: WARNING: Too many iterations: 262144
May 19 20:19:25 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:725)[nikita-373]:
May 19 20:19:25 beda kernel: WARNING: reiser-2018: Too many
iterations. Tree corrupted, or (less likely) starvation occurring.:
level: 5, lock_level: 2, stop_level: 1 lock_mode: write, bias:
left-slant
May 19 20:19:25 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:25 beda kernel: WARNING: Too many iterations: 128
May 19 20:19:25 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:25 beda kernel: WARNING: Too many iterations: 256
May 19 20:19:25 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:25 beda kernel: WARNING: Too many iterations: 512
May 19 20:19:25 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:25 beda kernel: WARNING: Too many iterations: 1024
May 19 20:19:25 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:25 beda kernel: WARNING: Too many iterations: 2048
May 19 20:19:25 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:25 beda kernel: WARNING: Too many iterations: 4096
May 19 20:19:26 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:26 beda kernel: WARNING: Too many iterations: 8192
May 19 20:19:26 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:26 beda kernel: WARNING: Too many iterations: 16384
May 19 20:19:26 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:26 beda kernel: WARNING: Too many iterations: 32768
May 19 20:19:26 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:26 beda kernel: WARNING: Too many iterations: 65536
May 19 20:19:27 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:27 beda kernel: WARNING: Too many iterations: 131072
May 19 20:19:28 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:28 beda kernel: WARNING: Too many iterations: 262144
May 19 20:19:31 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:725)[nikita-373]:
May 19 20:19:31 beda kernel: WARNING: reiser-2018: Too many
iterations. Tree corrupted, or (less likely) starvation occurring.:
level: 5, lock_level: 2, stop_level: 1 lock_mode: write, bias:
left-slant
May 19 20:19:31 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:31 beda kernel: WARNING: Too many iterations: 128
May 19 20:19:31 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:31 beda kernel: WARNING: Too many iterations: 256
May 19 20:19:31 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:31 beda kernel: WARNING: Too many iterations: 512
May 19 20:19:31 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:31 beda kernel: WARNING: Too many iterations: 1024
May 19 20:19:31 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:31 beda kernel: WARNING: Too many iterations: 2048
May 19 20:19:31 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:31 beda kernel: WARNING: Too many iterations: 4096
May 19 20:19:31 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:31 beda kernel: WARNING: Too many iterations: 8192
May 19 20:19:31 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:31 beda kernel: WARNING: Too many iterations: 16384
May 19 20:19:31 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:31 beda kernel: WARNING: Too many iterations: 32768
May 19 20:19:31 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:31 beda kernel: WARNING: Too many iterations: 65536
May 19 20:19:32 beda kernel: reiser4[firefox(4427)]: traverse_tree
(fs/reiser4/search.c:692)[nikita-1481]:
May 19 20:19:32 beda kernel: WARNING: Too many iterations: 131072
=2E..
=2E..
=2E..
Than fsck has fixed pertition and i lost 1 level names in my
/home/<user> directory. I found its in lost+found and renamed.
I decided to update kernel to 33 zen. Later the kernel has suspend
again but without kernel errors. From live cd I ran fsck again but
there's no too many errors as the first time. After all rolled back to
31 kernel because the system was stable on it.

And now I have the problem with lost dir.

Thanks,
Danila Beketov

2010/5/28 Edward Shishkin <edward.shishkin@gmail.com>:
> Danila Beketov wrote:
>> Hello,
>>
> Hello
>> Need help to return my lost folder, that has disappeared after mv
>> command execution by magic way.
>>
>
> Interesting. Just has disappeared without any kernel complaints?
>
>> Execution of fsck.reiser4 --build-fs shows the follow:
>>
>
> [...]
>
>> CHECKING THE SEMANTIC TREE
>> Error: Entry "lost_name_1002b:6d757369630000:106e5" already exists.
>> Error: Can't add entry lost_name_1002b:6d757369630000:106e5 to
>> 1002b:6d757369630000:106e5.
>>
> This is fsck bug.
>
> Would you please pack the metadata by
> debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
> and let me download the file meta.gz
>
> Thanks,
> Edward.
>
>> =A0 =A0 =A0 =A0 Found 12142 objects.
>> =A0 =A0 =A0 =A0 Lost&found 1 objects.
>> =A0 =A0 =A0 =A0 Time interval: Fri May 28 09:17:12 2010 - Fri May 28=
 09:17:13 2010
>> ***** fsck.reiser4 finished at Fri May 28 09:17:13 2010
>> Closing fs...done
>>
>> Operational error occurred while fscking.
>>
>> but there's no lost_name_1002b:6d757369630000:106e5 file on the part=
ition.
>>
>> Does anyone know how to repair my partition?
>>
>> beda ~ # uname -a
>> Linux beda 2.6.31-gentoo-r10 #1 PREEMPT Sun May 23 11:29:07 MSD 2010
>> i686 Intel(R) Pentium(R) 4 CPU 2.40GHz GenuineIntel GNU/Linux
>>
>> beda ~ # fsck.reiser4 --version
>> fsck.reiser4 1.0.7
>> Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
>> reiser4progs/COPYING
>>
>> Danila.
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-d=
evel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>>
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
