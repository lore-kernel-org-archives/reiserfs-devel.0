From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: some filesystem 'benchmarking' with 2.6.26-rc8
Date: Tue, 01 Jul 2008 03:42:13 +0400
Message-ID: <48696F55.6050802@gmail.com>
References: <200806301812.22490.volker.armin.hemmann@tu-clausthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200806301812.22490.volker.armin.hemmann@tu-clausthal.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Volker Armin Hemmann <volker.armin.hemmann@tu-clausthal.de>
Cc: reiserfs-devel@vger.kernel.org

Volker Armin Hemmann wrote:
[...]
> I plan to do reiser4 with gzip and without compression in the next co=
uple of=20
> days. If you want me to try one of the other fs with different option=
s, just=20
> say so.=20
>  =20
160000 mails is ~1G, and other 21G is pictures and movies?

If so, then reiser4 with gzip will show the same results.
Reiser4 without mkfs options should be a bit faster (if some
movies were wrongly evaluated as compressible files).

Thanks,
Edward.

> I was very surprised by jfs and xfs. The first was faster than expect=
ed (even=20
> with the unfairness in its favour) and xfs was much, much slower than=
=20
> expected. XFS was pretty fast with the films, but suffered a lot with=
 the=20
> emails, while reiserfs and reiser4 dealt very well with the emails.
>
> Gl=FCck Auf,
> Volker
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
