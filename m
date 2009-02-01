From: Matthias Grobarek <UnclePain@gmx.de>
Subject: Small fix for reiser4 compiling issue
Date: Sun, 01 Feb 2009 20:59:08 +0100
Message-ID: <4985FF0C.6050502@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org

Hi,

while playing around with my Gentoo system, I decided to switch to a ha=
rdened profile, including the usage of a kernel from the Hardened Gento=
o
project. This is a heavily patched kernel 2.6.28, but it doesn=E2=80=99=
t include reiser4 support, so I needed to create a custom one from it t=
o include
the reiser4 2.6.28 patchset. When I tried to compile this kernel, I got=
 an error in one of the reiser4 files... and of course I forgot to note
the error down, something about using implicit declaration of a functio=
n. Luckily, I could see a simple solution in the other filesystem drive=
rs
in the kernel, so I changed the erroneous reiser4 file accordingly and =
voil=C3=A0, the kernel compiled.

I=E2=80=99m not familar with creating patches and such, so I just give =
you the diff output. The file it=E2=80=99s referring to is:
fs/reiser4/plugin/file/file_conversion.c

689c689
<       page =3D __grab_cache_page(mapping, index);
---
>       page =3D grab_cache_page(mapping, index);

I still haven=E2=80=99t tested the kernel, but the fact that it compile=
s is enough for me to believe it will work (just as reiser4 has been wo=
rking for
me flawlessly). Furthermore, I have absolutely no clue about kernel dri=
ver development, so I=E2=80=99m not sure what implications this change =
has.

Regards,


Matthias Grobarek
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
