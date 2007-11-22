From: "Dushan Tcholich" <dusanc@gmail.com>
Subject: Fwd: bug report: reiser4 + kde4
Date: Thu, 22 Nov 2007 14:07:51 +0100
Message-ID: <a08621850711220507t770795edvfcd31a02f638bcdc@mail.gmail.com>
References: <20071122101615.178410@gmx.net>
	 <a08621850711220425r8467edfj588677fb5c91579f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=+l4OlAKyfy4Txv7QnCMF2G+cIhQIBcqxiyZkgWGpouo=;
        b=gzY+VgEAqOdsIVlXKo08ZW8mBjl2HOs2bC11hjdMjKgfyUxZSqgggk2Xyonan7kIl2lWY4ShnRAYwKlejBIoEq6Z/t31cUcGH4u7lECeTM8AdkcERJXwEwc4DKLXzSLGQ0/Vk1IPwj9yOXkf+QOzclQWITRuj3DPkiZU6M75lJI=
In-Reply-To: <a08621850711220425r8467edfj588677fb5c91579f@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-devel@vger.kernel.org

---------- Forwarded message ----------
=46rom: Dushan Tcholich <dusanc@gmail.com>
Date: Nov 22, 2007 1:25 PM
Subject: Re: bug report: reiser4 + kde4
To: Sven M=FCller <musv@gmx.de>


As I read reiser4.patch you used was from kamikaze sources, and that
patch can be found here:
http://kamikaze.waninkoko.info/patches/2.6.23/kamikaze5/broken-out/reis=
er4-2.6.23-2.patch
Am  correct?


On Nov 22, 2007 11:16 AM, "Sven M=FCller" <musv@gmx.de> wrote:
> Hi,
>
> according to my post in http://forums.gentoo.org/viewtopic-t-614771.h=
tml I was told to file that bug report to you.
>
> Scenario:
> I tried to install KDE4-svn on a PentiumIII notebook. The root partit=
ion on that notebook runs on a reiser4 partition. The partition was cre=
ated without any additional options (no compress or encryption). After =
starting KDE4 I get that kernel oops.
>
> Reproducable: always.
> Steps to reproduce: Install kde4-svn on an reiser4 partition and star=
t gdm, select kde4-svn and wait for a few seconds until kde4 stops load=
ing.
>
> dmesg:
> ...
> agpgart: Found an AGP 2.0 compliant device at 0000:00:00.0.
> agpgart: Putting AGP V2 device at 0000:00:00.0 into 4x mode
> agpgart: Putting AGP V2 device at 0000:01:00.0 into 4x mode
> [drm] Setting GART location based on new memory map
> [drm] writeback test succeeded in 1 usecs
> BUG: unable to handle kernel NULL pointer dereference at virtual addr=
ess 0000016                                                            =
                                    c
>  printing eip:
> c019a041
> *pde =3D 00000000
> Oops: 0000 [#1]
> Modules linked in: sr_mod pcmcia cdrom
> CPU:    0
> EIP:    0060:[<c019a041>]    Not tainted VLI
> EFLAGS: 00210296   (2.6.23-gentoo-r1 #1)
> EIP is at reiser4_get_tree+0x0/0xa
> eax: 00000000   ebx: d72a2454   ecx: 00000000   edx: 00000000
> esi: d72a2400   edi: 00000000   ebp: 00000000   esp: d71a3d98
> ds: 007b   es: 007b   fs: 0000  gs: 0033  ss: 0068
> Process kded4 (pid: 6713, ti=3Dd71a2000 task=3Dd8674530 task.ti=3Dd71=
a2000)
> Stack: c01b7fac 00000000 00000175 d72a2400 00000000 d72a24b4 d71a3e44=
 00000000
>        088e9c44 d72a24c4 2d69636f 006b6465 0088e9c5 00000000 00000174=
 00000000
>        088e9c44 00000000 2d69636f 006b6465 0088e9c5 00000000 00000000=
 00000000
> Call Trace:
>  [<c01b7fac>] reiser4_write_extent+0x23/0x4bb
>  [<c01a473a>] setattr_unix_file+0x182/0x393
>  [<c0157415>] nameidata_to_filp+0x24/0x33
>  [<c0168c52>] mntput_no_expire+0x13/0x50
>  [<c0167dd1>] notify_change+0xf5/0x20c
>  [<c0157b05>] do_truncate+0x5e/0x75
>  [<c0157e00>] do_sys_truncate+0x15f/0x17a
>  [<c0158f62>] generic_file_llseek+0x0/0x82
>  [<c0221b3e>] copy_to_user+0x25/0x3b
>  [<c0159188>] sys_llseek+0x65/0x87
>  [<c0103be2>] sysenter_past_esp+0x5f/0x85
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Code: 83 c0 10 c3 8b 80 6c 01 00 00 8b 80 58 01 00 00 c3 8b 80 6c 01 =
00 00 8b 80                                                            =
                                     60 01 00 00 c3 8b 80 6c 01 00 00 8=
b 80 5c 01 00 00 c3 <8b> 80 6c 01 00 00 83 c0                          =
                                                                       =
14 c3 85 c0 89 c2 74 19 8b 80 6c 01 00
> EIP: [<c019a041>] reiser4_get_tree+0x0/0xa SS:ESP 0068:d71a3d98
> reiser4[kded4(6713)]: release_unix_file (fs/reiser4/plugin/file/file.=
c:2409)[vs-                                                            =
                                    44]:
> WARNING: out of memory?
> reiser4[kded4(6713)]: release_unix_file (fs/reiser4/plugin/file/file.=
c:2409)[vs-                                                            =
                                    44]:
> WARNING: out of memory?
> reiser4[kded4(6713)]: release_unix_file (fs/reiser4/plugin/file/file.=
c:2409)[vs-                                                            =
                                    44]:
> WARNING: out of memory?
> reiser4[kded4(6713)]: release_unix_file (fs/reiser4/plugin/file/file.=
c:2409)[vs-                                                            =
                                    44]:
> ...
>
>
> Linux configuration:
> Portage 2.1.3.19 (default-linux/x86/2007.0/desktop, gcc-4.2.2, glibc-=
2.7-r0, 2.6.23-gentoo-r1 i686)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> System uname: 2.6.23-gentoo-r1 i686 Mobile Intel(R) Pentium(R) III CP=
U - M 1000MHz
> Timestamp of tree: Fri, 19 Oct 2007 12:00:08 +0000
> distcc 2.18.3 i686-pc-linux-gnu (protocols 1 and 2) (default port 363=
2) [enabled]
> app-shells/bash:     3.2_p17-r1
> dev-java/java-config: 1.3.7, 2.1.2-r1
> dev-lang/python:     2.5.1-r3
> sys-apps/baselayout: 1.12.10-r5
> sys-apps/sandbox:    1.2.18.1-r2
> sys-devel/autoconf:  2.13, 2.61-r1
> sys-devel/automake:  1.5, 1.6.3, 1.7.9-r1, 1.8.5-r3, 1.9.6-r2, 1.10
> sys-devel/binutils:  2.18-r1
> sys-devel/gcc-config: 1.4.0-r4
> sys-devel/libtool:   1.5.24
> virtual/os-headers:  2.6.23
> ACCEPT_KEYWORDS=3D"x86 ~x86"
> CBUILD=3D"i686-pc-linux-gnu"
> CFLAGS=3D"-march=3Dpentium3 -Os -pipe -fomit-frame-pointer"
> CHOST=3D"i686-pc-linux-gnu"
> CXXFLAGS=3D"-march=3Dpentium3 -Os -pipe -fomit-frame-pointer"
>
> Maybe it helps to you. I downgraded to kde-3.5.8, so for me no proble=
m. kde3 with cache dir on tmpfs works pretty well on reiser4.
>
> Greetings
> Sven
> --
> Psssst! Schon vom neuen GMX MultiMessenger geh=F6rt?
> Der kann`s mit allen: http://www.gmx.net/de/go/multimessenger
> -
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
-
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
