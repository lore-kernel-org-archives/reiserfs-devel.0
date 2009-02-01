From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Small fix for reiser4 compiling issue
Date: Sun, 01 Feb 2009 23:36:43 +0300
Message-ID: <498607DB.7070000@gmail.com>
References: <4985FF0C.6050502@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4985FF0C.6050502@gmx.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Matthias Grobarek <UnclePain@gmx.de>
Cc: reiserfs-devel@vger.kernel.org

Matthias Grobarek wrote:
> Hi,
>  =20
Hello.

> while playing around with my Gentoo system, I decided to switch to a =
hardened profile, including the usage of a kernel from the Hardened Gen=
too
> project. This is a heavily patched kernel 2.6.28, but it doesn=E2=80=99=
t include reiser4 support, so I needed to create a custom one from it t=
o include
> the reiser4 2.6.28 patchset. When I tried to compile this kernel, I g=
ot an error in one of the reiser4 files... and of course I forgot to no=
te
> the error down, something about using implicit declaration of a funct=
ion. Luckily, I could see a simple solution in the other filesystem dri=
vers
> in the kernel, so I changed the erroneous reiser4 file accordingly an=
d voil=C3=A0, the kernel compiled.
>
> I=E2=80=99m not familar with creating patches and such, so I just giv=
e you the diff output. The file it=E2=80=99s referring to is:
> fs/reiser4/plugin/file/file_conversion.c
>
> 689c689
> <       page =3D __grab_cache_page(mapping, index);
> ---
>  =20
>>       page =3D grab_cache_page(mapping, index);
>>    =20
>
>  =20

Here  is the correct patch:
http://userweb.kernel.org/~akpm/mmotm/broken-out/fs-symlink-write_begin=
-allocation-context-fix-reiser4-fix.patch

Thanks,
Edward.

> I still haven=E2=80=99t tested the kernel, but the fact that it compi=
les is enough for me to believe it will work (just as reiser4 has been =
working for
> me flawlessly). Furthermore, I have absolutely no clue about kernel d=
river development, so I=E2=80=99m not sure what implications this chang=
e has.
>
> Regards,
>
>
> Matthias Grobarek
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  =20

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
