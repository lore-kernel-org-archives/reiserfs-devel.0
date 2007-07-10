From: Edward Shishkin <edward@namesys.com>
Subject: Re: Reiser4 for linux-2.6.22?
Date: Tue, 10 Jul 2007 20:13:28 +0400
Message-ID: <4693B028.9000009@namesys.com>
References: <200707101611.22496.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200707101611.22496.rmeijer@internet.gr>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "Raymond A. Meijer" <rmeijer@internet.gr>
Cc: reiserfs-devel@vger.kernel.org

Raymond A. Meijer wrote:

>Hello,
>
>Is there a patch for kernel 2.6.22 yet?
> =20
>
Hello.
I have some fixes to push to -mm first.
So, maybe on this week..

Thanks,
Edward.

>When I try to use reiser4-for-2.6.21.patch.gz I get:
>
>[...]
>patching file mm/filemap.c
>Hunk #3 succeeded at 721 (offset 1 line).
>Hunk #4 succeeded at 841 with fuzz 2 (offset 60 lines).
>Hunk #5 succeeded at 842 (offset 3 lines).
>[...]
>
>and finally:
>
>[...]
>mm/filemap.c:845: error: redefinition of =E2=80=98__kcrctab_find_get_p=
ages_tag=E2=80=99
>mm/filemap.c:786: error: previous definition of =E2=80=98__kcrctab_fin=
d_get_pages_tag=E2=80=99=20
>was here
>mm/filemap.c:845: error: redefinition of =E2=80=98__kstrtab_find_get_p=
ages_tag=E2=80=99
>mm/filemap.c:786: error: previous definition of =E2=80=98__kstrtab_fin=
d_get_pages_tag=E2=80=99=20
>was here
>mm/filemap.c:845: error: redefinition of =E2=80=98__ksymtab_find_get_p=
ages_tag=E2=80=99
>mm/filemap.c:786: error: previous definition of =E2=80=98__ksymtab_fin=
d_get_pages_tag=E2=80=99=20
>was here
>make[1]: *** [mm/filemap.o] Error 1
>make: *** [mm] Error 2
>make: *** Waiting for unfinished jobs....
>[...]
>
>Any ideas?
>
>
>Thanks,
>
>Ray
>
> =20
>

-
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
