From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Fix reiser4 compile warnings
Date: Thu, 24 Sep 2009 00:16:32 +0200
Message-ID: <4ABA9E40.2080000@gmail.com>
References: <9bb377710909122034mb8da551x299032990230efe0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <9bb377710909122034mb8da551x299032990230efe0@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Brandon Berhent <cheater1034@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hello.
Seems to be correct.

Thanks,
Edward.

Brandon Berhent wrote:
> Please check the attached patch for correctness
>
> It fixes the following warnings on compile:
>   CC      fs/reiser4/plugin/compress/compress.o
> fs/reiser4/plugin/compress/compress.c: In function =91lzo1_compress=92=
:
> fs/reiser4/plugin/compress/compress.c:289: warning: passing argument =
4
> of =91lzo1x_1_compress=92 from incompatible pointer type
> fs/reiser4/plugin/compress/compress.c: In function =91lzo1_decompress=
=92:
> fs/reiser4/plugin/compress/compress.c:313: warning: passing argument =
4
> of =91lzo1x_decompress_safe=92 from incompatible pointer type
>   CC      fs/reiser4/plugin/item/item.o
> fs/reiser4/plugin/item/item.c:556: warning: initialization from
> incompatible pointer type
> fs/reiser4/plugin/item/item.c:609: warning: initialization from
> incompatible pointer type
>
> I am not the original other of this patch, please consider it if it i=
s
> correct :)
>  =20

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
