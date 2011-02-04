From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: problem compiling reise4progs-1.0.7 on fedora-14
Date: Fri, 04 Feb 2011 21:04:31 +0100
Message-ID: <4D4C5BCF.2020505@gmail.com>
References: <AANLkTikKHkJqJSkiwDnbQweJynwZw-dpF6CteEJxVOrO@mail.gmail.com>	<4D4C27E4.9010803@gmail.com>	<AANLkTi=yhmD_rJEe7y2tVzVd=qhJhtgYNY8G6Bxzwhaz@mail.gmail.com>	<AANLkTikaErC2UB50kWFEg38p6ycyH85=CRRCC8k8jwQa@mail.gmail.com> <AANLkTikYmpY5PzpnDz-ysfOnYv2__7TK=nRyD6FTgLxa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <AANLkTikYmpY5PzpnDz-ysfOnYv2__7TK=nRyD6FTgLxa@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: sergey ivanov <sergey57@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, Viji V Nair <viji@fedoraproject.org>

sergey ivanov wrote:
> Ok, I hacked the spec file in reiser4progs-1.0.7 to build it
> successfully on Fedora-14:
> {{{
> [seriv@gauntlet work]$ diff -u reiser4progs-1.0.7{,.good}/reiser4progs.spec
> --- reiser4progs-1.0.7/reiser4progs.spec	2009-02-09 11:09:42.000000000 -0500
> +++ reiser4progs-1.0.7.good/reiser4progs.spec	2011-02-04
> 14:49:10.541656092 -0500
> @@ -25,6 +25,8 @@
>  %setup -q
>
>  %build
> +sed -i -e 's/#include <stdlib.h>//g' configure demos/busy.h
> libmisc/misc.c plugin/format/format40/format40.c \
> +  progs/fsck/fsck.h progs/measurefs/measurefs.c
>  %configure \
>  %if %{enable_debug}
>          --enable-debug \
> @@ -56,6 +58,9 @@
>  %{_libdir}/libreiser4-1.0.so.*
>  %{_libdir}/libreiser4-minimal-1.0.so.*
>  %{_libdir}/librepair-1.0.so.*
> +%{_libdir}/libreiser4.so
> +%{_libdir}/libreiser4-minimal.so
> +%{_libdir}/librepair.so
>  %{_sbindir}/debugfs.reiser4
>  %{_sbindir}/fsck.reiser4
>  %{_sbindir}/make_reiser4
> }}}
> I understand it's a dirty solution.
>   

I can not qualify it, but anyway, I think this solution will be useful.

Thanks!
Edward.

