From: Jose R R <jose.r.r@metztli.com>
Subject: Re: Reiser4: Format 4.0.1: Meta(data) checksums
Date: Wed, 9 Sep 2015 00:54:54 -0700
Message-ID: <CAM12Q5T43V0-j5fGDrY4euTJE7jA5Tv2L+L678oRMvV6vJgyqA@mail.gmail.com>
References: <55E470E0.2070304@gmail.com>
	<CAM12Q5Qkx-3ShOJjXd02_4Af0it3wv+39hXDW4sFhBosg=i3SQ@mail.gmail.com>
	<CAFCWPPL+qqq0UgqV0F2T54EfmvVYmN6iWeuoVNvExR+dYqZWmg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAFCWPPL+qqq0UgqV0F2T54EfmvVYmN6iWeuoVNvExR+dYqZWmg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: milan.buska@gmail.com, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Scratch my previous issue, Ed. It is *not* related to your new Reiser4
software release 4.0.1 module nor reiser4progs.

My usual development environment is a modified non-systemd Debian Sid
(unstable) on a Reiser4 root partition. The kernels built won't boot
in *that* particular instance due to a least one other additional
issue:
target filesystem does not have requested /sbin/init

However, I tried one of my recently built reiser4-patched kernels into
a systemd Debian Sid -- also running on reiser4 root partition -- and
the system booted and behaved as you predicted.

< https://pbs.twimg.com/media/COccj66UAAA7mfp.png:large >

Sorry about that, Ed. It's my fault for only testing in the build
environment (although I had not had an issue with reiser4 builds until
this kernel 4.x and new 4.0.1 software combination change).

On Tue, Sep 8, 2015 at 4:20 PM, Milan Bu=C5=A1ka <milan.buska@gmail.com=
> wrote:
> Hi all.
>
> I'm not an expert but I think that the error happened during kernel
> compilation.
> I have compiled into the kernel filesystem reiser4 directly into the =
kernel,
> not as modules and yet I have no problems. This is a record of my boo=
t.
>
> Loading Linux 4.1.6-reiser4 ...
> early console in decompress_kernel
>
> Decompressing Linux... Parsing ELF... done.
> Booting the kernel.
> INIT: version 2.88 booting
> The system is coming up.  Please wait.
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
>
> Fscking the /dev/sda2 block device.
> Will check the consistency of the Reiser4 SuperBlock.
> Will check the consistency of the Reiser4 FileSystem.
> ***** fsck.reiser4 started at Wed Sep  9 00:31:06 2015
> Reiser4 fs was detected on /dev/sda2.
> Master super block (16):
> magic:          ReIsEr4
> blksize:        4096
> format:         0x0 (format40)
> uuid:           631c2925-dca7-41be-b40c-46e7b2052e28
> label:          SYSTEM-ROOT
>
> Format super block (17):
> plugin:         format40
> description:    Disk-format plugin.
> version:        1
> magic:          ReIsEr40FoRmAt
> mkfs id:        0x6129d214
> flushes:        0
> blocks:         27000832
> free blocks:    26270124
> root block:     118355
> tail policy:    0x2 (smart)
> next oid:       0x86a7b6
> file count:     170068
> tree height:    5
> key policy:     LARGE
>
>
> CHECKING THE STORAGE TREE
>         Read nodes 269426
>         Nodes left in the tree 269426
>                 Leaves of them 265060, Twigs of them 4257
>         Time interval: Wed Sep  9 00:31:06 2015 - Wed Sep  9 00:31:22=
 2015
> CHECKING EXTENT REGIONS.
>         Read twigs 4257
>         Time interval: Wed Sep  9 00:31:22 2015 - Wed Sep  9 00:31:22=
 2015
> CHECKING THE SEMANTIC TREE
>         Found 171872 objects (some could be encountered more then onc=
e).
>         Time interval: Wed Sep  9 00:31:22 2015 - Wed Sep  9 00:31:25=
 2015
> ***** fsck.reiser4 finished at Wed Sep  9 00:31:25 2015
> Closing fs...done
>
> FS is consistent.
>
> hostname: ishi
> font: ter-v16n
> keyboard: us
> INIT: Entering runlevel: 2
> starting services: sysklogd lo net firewall crond gpm dbus
>
> Version reiser4progs:
> $ /sbin/fsck.reiser4 --version
> /sbin/fsck.reiser4 1.1.0
> Format release: 4.0.1
> Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
> reiser4progs/COPYING.
>
> $ uname -a
> Linux ishi 4.1.6-reiser4 #1 SMP Tue Sep 1 17:44:08 CEST 2015 x86_64 I=
ntel(R)
> Core(TM) i5-3570K CPU @ 3.40GHz GenuineIntel GNU/Linux
>
> I also recommend checking with such parameters and patches reiser4pro=
gs is
> compiled on Debian. See the debian / rules.
>
> Greeting
>
> Milan
>

I appreciate your input Milan, thank you.

I usually build a reiser4 module in Debian and make sure that
initramfs-tools are aware of it during kernel installation by editing
/etc/initramfs-tools/modules, adding directive: reiser4
Otherwise, reiser4 module will not be included in the initrd and the
system will not boot.

Thank you all.


Best Professional Regards.


--=20
Jose R R
http://metztli.it
-----------------------------------------------------------------------=
----------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
-----------------------------------------------------------------------=
----------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy =
way!
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
