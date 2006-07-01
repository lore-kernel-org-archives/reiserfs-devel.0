From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Subject: Re: reiser4 oops
Date: Sat, 01 Jul 2006 22:13:10 +0200
Message-ID: <op.tb0038ovd4os1z@localhost>
References: <op.tb00v9njd4os1z@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28886-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.tb00v9njd4os1z@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Dnia Sat, 01 Jul 2006 22:08:23 +0200, =A3ukasz Mierzwa =20
<prymitive@pcserwis.net> napisa=B3:

> I'm running x86 gentoo system with / on reiser4, I'm using
> suspend-sources-2.6.16-r8 kernel with 2.6.16-4 patch. Today I run emerge
> --sync, after that I started to compile new xine-lib while browsing net,
> when xine-lib was finishing I got this errors:
>
> kernel BUG at fs/inode.c:253!
> invalid opcode: 0000 [#1]
> PREEMPT

I tried to build new xine-lib again and at the end I got this again:

kernel BUG at fs/inode.c:253!
invalid opcode: 0000 [#1]
PREEMPT
Modules linked in: nls_iso8859_2 nls_cp852 vfat fat nls_base ndiswrapper =20
fglrx acer_acpi nsc_ircc irda crc_ccitt snd_atiixp snd_ac97_codec =20
snd_ac97_bus yenta_socket rsrc_nonstatic pcmcia_core tifm_7xx1 tifm_core
CPU:    0
EIP:    0060:[<c017bc56>]    Tainted: P      VLI
EFLAGS: 00010206   (2.6.16-suspend2-r8 #2)
EIP is at clear_inode+0x16/0xb0
eax: 00000003   ebx: dcdfc3a0   ecx: 00000000   edx: dcdfc478
esi: dfd09180   edi: ceb7a000   ebp: ceb7a000   esp: ceb7be94
ds: 007b   es: 007b   ss: 0068
Process emerge (pid: 18073, threadinfo=3Dceb7a000 task=3Dc4745550)
Stack: <0>dfd09180 dcdfc3a0 dfd09180 c01db519 c017a385 00000000 00000400 =20
dcdfc4a8
        dcdfc3a0 ceb7a000 d2f894f4 dcdfc3a0 c01db4e0 c017bd59 dcdfc3a0 =20
df339000
               c017b81c d2f894f4 c017a431 00000000 df339000 df029000 =20
ceb7bf50 c0172d74
               Call Trace:
                [<c01db519>] reiser4_delete_inode+0x39/0xc0
                 [<c017a385>] dput+0x25/0x170
                  [<c01db4e0>] reiser4_delete_inode+0x0/0xc0
                   [<c017bd59>] generic_delete_inode+0x69/0x100
                    [<c017b81c>] iput+0x5c/0x70
                     [<c017a431>] dput+0xd1/0x170
                      [<c0172d74>] sys_renameat+0x1c4/0x1f0
                       [<c0172dc7>] sys_rename+0x27/0x30
                        [<c0102ef3>] sysenter_past_esp+0x54/0x75
                        Code: 80 98 00 00 00 8b 40 38 eb c4 8d 74 26 00 8d =
=20
bc 27 00 00 00 00 56 53 89 c3 83 ec 04 e8 14 b0 fe ff 8b 83 c4 00 00 00 85 =
=20
c0 74 08 <0f> 0b fd 00 ab d4 37 c0 8b 83 20 01 00 00 a8 10 75 08 0f 0b ff
                         <4>reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?
                         reiser4[emerge(18073)]: release_unix_file =20
(fs/reiser4/plugin/file/file.c:2294)[vs-44]:
                         WARNING: out of memory?

It happend while portage was merging files from temporary build dir to =20
system dirs:

>>> /usr/lib/xine/plugins/1.1.2/vidix/pm2_vid.so
>>> /usr/lib/xine/plugins/1.1.2/vidix/pm3_vid.so
>>> /usr/lib/xine/plugins/1.1.2/vidix/radeon_vid.so
>>> /usr/lib/xine/plugins/1.1.2/vidix/rage128_vid.so
>>> /usr/lib/xine/plugins/1.1.2/vidix/savage_vid.so
>>> /usr/lib/xine/plugins/1.1.2/vidix/sis_vid.so
>>> /usr/lib/xine/plugins/1.1.2/vidix/unichrome_vid.so
>>> /usr/lib/xine/plugins/1.1.2/xineplug_ao_out_alsa.so
>>> /usr/lib/xine/plugins/1.1.2/xineplug_ao_out_file.so
>>> /usr/lib/xine/plugins/1.1.2/xineplug_ao_out_none.so
>>> /usr/lib/xine/plugins/1.1.2/xineplug_ao_out_oss.so
Naruszenie ochrony pami=EAci (memory protection fault)
