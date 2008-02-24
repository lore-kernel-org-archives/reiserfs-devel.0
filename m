From: "Edward Shishkin" <edward.shishkin@gmail.com>
Subject: Re: Problems with nfs in 2.6.24
Date: Mon, 25 Feb 2008 02:42:29 +0300
Message-ID: <5c7c368b0802241542x6be9420cy48332f52ece73bc4@mail.gmail.com>
References: <20080224133851.249540@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=K4ABw7ve6WddsbvFyh9ETIl2N7EBVrcrmR5lVoyTkQw=;
        b=KR2yjX5Cqn6o/+WRt2/emD5ythzANcCMZENXyMKvqTGi9Zjxv2SqFALBwtvtHkMD5ebG/zwqUUsXwmpBSegoxgXHPqBrhiFbVoSITLXrfxkPU6p8bAuI0AemevlKdqHzmeqQLQrKYA0MGfLaxiHTKZgKUekdXOeowstknbmCeg8=
In-Reply-To: <20080224133851.249540@gmx.net>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Sven_M=FCller?= <musv@gmx.de>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Hello.

Would you please pack metadata by
debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
and let me download the file meta.gz, if possible.
What is the name of inaccessible object?

Thanks,
Edward.

On Sun, Feb 24, 2008 at 4:38 PM, "Sven M=FCller" <musv@gmx.de> wrote:
> Hi,
>
>  first the message I posted into the Gentoo-Forums:
>  http://forums.gentoo.org/viewtopic-t-295168-start-250.html#4895168
>
>  Problem:
>  On my computer I use Reiser4. When I try to access my computer via n=
fs from another computer I get a Kernel Ooops. I can still reboot the m=
achine. But several things in a term don't work anymore without reboot.
>
>  The nfs-server starts without problems on my computer. The error occ=
ures only when someony tries to access.
>
>  The error is reproducible and occures always when try to access via =
nfs.
>
>  Kernel Ooops:
>  Feb 24 09:20:01 Blechkasten BUG: unable to handle kernel NULL pointe=
r dereference at virtual address 00000050
>  Feb 24 09:20:01 Blechkasten printing eip: c01a8b1a *pde =3D 00000000
>  Feb 24 09:20:01 Blechkasten Oops: 0000 [#1]
>  Feb 24 09:20:01 Blechkasten Modules linked in: libafs(P) lirc_i2c(F)=
 lirc_dev nvidia(P) ne2k_pci 8390
>  Feb 24 09:20:01 Blechkasten
>  Feb 24 09:20:01 Blechkasten Pid: 4748, comm: nfsd Tainted: PF       =
(2.6.24-gentoo-r2 #3)
>  Feb 24 09:20:01 Blechkasten EIP: 0060:[<c01a8b1a>] EFLAGS: 00010286 =
CPU: 0
>  Feb 24 09:20:01 Blechkasten EIP is at max_item_size_node40+0xb/0x15
>  Feb 24 09:20:01 Blechkasten EAX: 00000000 EBX: 00000002 ECX: f56c7eb=
4 EDX: c01ae024
>  Feb 24 09:20:01 Blechkasten ESI: c04fc9e4 EDI: c04719da EBP: f4969bd=
c ESP: f4969b60
>  Feb 24 09:20:01 Blechkasten cron[24875]: (root) CMD (test -x /usr/sb=
in/run-crons && /usr/sbin/run-crons )
>  Feb 24 09:20:03 Blechkasten DS: 007b ES: 007b FS: 0000 GS: 0000 SS: =
0068
>  Feb 24 09:20:03 Blechkasten Process nfsd (pid: 4748, ti=3Df4968000 t=
ask=3Df4e4a550 task.ti=3Df4968000)
>  Feb 24 09:20:03 Blechkasten Stack: c01ae02f c019820d c01a86e2 ffffff=
dc c01a808b 0000000c f362c8b3 f4969c58
>  Feb 24 09:20:03 Blechkasten f56c7eb4 00000014 00000282 0000fa80 d8f3=
550c 00000008 c531d000 c037d0ee
>  Feb 24 09:20:03 Blechkasten c531d080 f4a0d4c6 00000008 00000000 0000=
0000 00000000 f4a0d4c6 000002c6
>  Feb 24 09:20:03 Blechkasten Call Trace:
>  Feb 24 09:20:03 Blechkasten [<c01ae02f>] max_name_len_cde+0xb/0xf
>  Feb 24 09:20:03 Blechkasten [<c019820d>] reiser4_max_filename_len+0x=
1e/0x1f
>  Feb 24 09:20:03 Blechkasten [<c01a86e2>] is_name_acceptable_common+0=
x8/0x12
>  Feb 24 09:20:03 Blechkasten [<c01a808b>] reiser4_lookup_name+0x2e/0x=
f4
>  Feb 24 09:20:03 Blechkasten [<c037d0ee>] skb_copy_and_csum_bits+0x15=
e/0x29c
>  Feb 24 09:20:03 Blechkasten [<c01a888a>] get_parent_common+0x50/0xbe
>  Feb 24 09:20:03 Blechkasten [<c03f7426>] __mutex_lock_slowpath+0x1b7=
/0x1bf
>  Feb 24 09:20:03 Blechkasten [<c037ec85>] memcpy_toiovec+0x27/0x4a
>  Feb 24 09:20:03 Blechkasten [<c0196eef>] reiser4_get_dentry_parent+0=
x1b/0x1d
>  Feb 24 09:20:03 Blechkasten [<c01e226a>] reconnect_path+0xa7/0x1d4
>  Feb 24 09:20:03 Blechkasten [<c0162fe4>] find_inode+0x1b/0x56
>  Feb 24 09:20:03 Blechkasten [<c01630af>] ifind+0x28/0x56
>  Feb 24 09:20:03 Blechkasten [<c01634c9>] iget5_locked+0x3b/0x126
>  Feb 24 09:20:03 Blechkasten [<c0197dbd>] reiser4_inode_find_actor+0x=
0/0x7e
>  Feb 24 09:20:03 Blechkasten [<c0198167>] reiser4_iget+0x277/0x297
>  Feb 24 09:20:03 Blechkasten [<c0197d88>] init_locked_inode+0x0/0x35
>  Feb 24 09:20:03 Blechkasten [<c01620dc>] d_alloc+0x1c/0x172
>  Feb 24 09:20:03 Blechkasten [<c0162489>] d_alloc_anon+0x3e/0xbb
>  Feb 24 09:20:03 Blechkasten [<c019e66b>] wire_get_common+0x34/0x6b
>  Feb 24 09:20:03 Blechkasten [<c0196f69>] reiser4_decode_fh+0x78/0x82
>  Feb 24 09:20:03 Blechkasten [<c0197095>] reiser4_fh_to_dentry+0x2a/0=
x31
>  Feb 24 09:20:03 Blechkasten [<c01e24dc>] exportfs_decode_fh+0x66/0x1=
a2
>  Feb 24 09:20:03 Blechkasten [<c011189f>] enqueue_task_fair+0x16/0x24
>  Feb 24 09:20:03 Blechkasten [<c0110da8>] enqueue_task+0xa/0x14
>  Feb 24 09:20:03 Blechkasten [<c03ef4d5>] cache_check+0x59/0x390
>  Feb 24 09:20:03 Blechkasten [<c01e83aa>] exp_get_by_name+0x43/0x52
>  Feb 24 09:20:03 Blechkasten [<c01e8909>] expkey_match+0x50/0x5f
>  Feb 24 09:20:03 Blechkasten [<c03ef4d5>] cache_check+0x59/0x390
>  Feb 24 09:20:03 Blechkasten [<c011de0f>] set_current_groups+0x126/0x=
130
>  Feb 24 09:20:03 Blechkasten [<c01ea240>] nfsd_setuser+0x120/0x16c
>  Feb 24 09:20:03 Blechkasten [<c03e9c36>] svc_sendto+0x235/0x297
>  Feb 24 09:20:03 Blechkasten [<c01e48f7>] nfsd_setuser_and_check_port=
+0x4f/0x57
>  Feb 24 09:20:03 Blechkasten [<c01e8811>] exp_find+0x56/0x5e
>  Feb 24 09:20:03 Blechkasten [<c01e8847>] rqst_exp_find+0x2e/0xa0
>  Feb 24 09:20:03 Blechkasten [<c01e5007>] fh_verify+0x237/0x450
>  Feb 24 09:20:03 Blechkasten [<c01e4d27>] nfsd_acceptable+0x0/0xa9
>  Feb 24 09:20:03 Blechkasten [<c011178c>] dequeue_entity+0xb/0x2a
>  Feb 24 09:20:03 Blechkasten [<c03ef7e3>] cache_check+0x367/0x390
>  Feb 24 09:20:03 Blechkasten [<c01eb810>] nfsd3_proc_getattr+0x8b/0xb=
8
>  Feb 24 09:20:03 Blechkasten [<c01e27df>] nfsd_dispatch+0xd3/0x1a0
>  Feb 24 09:20:03 Blechkasten [<c03e942d>] svc_process+0x39f/0x686
>  Feb 24 09:20:03 Blechkasten [<c01e2cd2>] nfsd+0x148/0x22a
>  Feb 24 09:20:03 Blechkasten [<c01e2b8a>] nfsd+0x0/0x22a
>  Feb 24 09:20:03 Blechkasten [<c0104767>] kernel_thread_helper+0x7/0x=
10
>  Feb 24 09:20:03 Blechkasten =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Feb 24 09:20:03 Blechkasten Code: eb 04 66 8b 43 fa 5b 66 29 d0 0f b=
7 c0 c3 b8 01 00 00 00 c3 b8 01 00 00 00 c3 b8 01 00 00 00 c3 a1 00 f0 =
4e c0 8b 80 f8 04 00 00 <8b> 40 50 8b 40 0c 83 e8 42 c3 53 0f b7 48 04 =
8b 18 6b c9 26 8b
>  Feb 24 09:20:03 Blechkasten EIP: [<c01a8b1a>] max_item_size_node40+0=
xb/0x15 SS:ESP 0068:f4969b60
>  Feb 24 09:20:03 Blechkasten ---[ end trace bfd93292002efce2 ]---
>
>
>  System:
>  Gentoo Linux
>  Gentoo-Sources-2.6.24-r2 with Reiser4-Patch from Edward's Homepage:
>  http://chichkin_i.zelnet.ru/namesys/reiser4-for-2.6.24.patch.gz
>
>  emerge --info (first part):
>  Portage 2.1.4.4 (default-linux/x86/2007.0/desktop, gcc-4.2.3, glibc-=
2.7-r1, 2.6.24-gentoo-r2 i686)
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  System uname: 2.6.24-gentoo-r2 i686 AMD Athlon(tm) XP 2600+
>  Timestamp of tree: Sun, 24 Feb 2008 03:00:01 +0000
>  distcc 2.18.3 i686-pc-linux-gnu (protocols 1 and 2) (default port 36=
32) [disabled]
>  ccache version 2.4 [enabled]
>  app-shells/bash:     3.2_p33
>  dev-java/java-config: 1.3.7, 2.1.4
>  dev-lang/python:     2.5.1-r5
>  dev-util/ccache:     2.4-r7
>  sys-apps/baselayout: 2.0.0_rc6-r1
>  sys-apps/sandbox:    1.2.18.1-r2
>  sys-devel/autoconf:  2.13, 2.61-r1
>  sys-devel/automake:  1.4_p6, 1.5, 1.7.9-r1, 1.8.5-r3, 1.9.6-r2, 1.10=
=2E1
>  sys-devel/binutils:  2.18-r1
>  sys-devel/gcc-config: 1.4.0-r4
>  sys-devel/libtool:   1.5.26
>  virtual/os-headers:  2.6.24
>  ACCEPT_KEYWORDS=3D"x86 ~x86"
>  CBUILD=3D"i686-pc-linux-gnu"
>  CFLAGS=3D"-march=3Dathlon-xp -Os -pipe -fomit-frame-pointer"
>  CHOST=3D"i686-pc-linux-gnu"
>  CONFIG_PROTECT=3D"/etc /usr/kde/3.5/env /usr/kde/3.5/share/config /u=
sr/kde/3.5/shutdown /usr/share/config"
>  CONFIG_PROTECT_MASK=3D"/etc/env.d /etc/env.d/java/ /etc/fonts/fonts.=
conf /etc/gconf /etc/gentoo-release /etc/php/apache2-php5/ext-active/ /=
etc/php/cgi-php5/ext-active/ /etc/php/cli-php5/ext-active/ /etc/revdep-=
rebuild /etc/splash /etc/terminfo /etc/texmf/web2c /etc/udev/rules.d"
>  CXXFLAGS=3D"-march=3Dathlon-xp -Os -pipe -fomit-frame-pointer"
>  DISTDIR=3D"/usr/portage/distfiles"
>  FEATURES=3D"autoaddcvs ccache cvs distlocks fixpackages sandbox sfpe=
rms strict unmerge-orphans userfetch usersandbox"
>  GENTOO_MIRRORS=3D"ftp.tu-chemnitz.de/pub/linux/gentoo http://ftp.tu-=
chemnitz.de/pub/linux/gentoo http://gentoo.osuosl.org/"
>  LANG=3D"de_DE@euro"
>  LC_ALL=3D"de_DE@euro"
>  LINGUAS=3D"de"
>  MAKEOPTS=3D"-j2"
>
>  Hope it helps.
>
>  Greetings
>  Sven
>  --
>  Psst! Geheimtipp: Online Games kostenlos spielen bei den GMX Free Ga=
mes!
>  http://games.entertainment.web.de/de/entertainment/games/free
>  -
>  To unsubscribe from this list: send the line "unsubscribe reiserfs-d=
evel" in
>  the body of a message to majordomo@vger.kernel.org
>  More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
-
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
