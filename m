From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Reiser4 for linux-2.6.22?
Date: Tue, 10 Jul 2007 16:11:21 +0300
Message-ID: <200707101611.22496.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org

Hello,

Is there a patch for kernel 2.6.22 yet?

When I try to use reiser4-for-2.6.21.patch.gz I get:

[...]
patching file mm/filemap.c
Hunk #3 succeeded at 721 (offset 1 line).
Hunk #4 succeeded at 841 with fuzz 2 (offset 60 lines).
Hunk #5 succeeded at 842 (offset 3 lines).
[...]

and finally:

[...]
mm/filemap.c:845: error: redefinition of =E2=80=98__kcrctab_find_get_pa=
ges_tag=E2=80=99
mm/filemap.c:786: error: previous definition of =E2=80=98__kcrctab_find=
_get_pages_tag=E2=80=99=20
was here
mm/filemap.c:845: error: redefinition of =E2=80=98__kstrtab_find_get_pa=
ges_tag=E2=80=99
mm/filemap.c:786: error: previous definition of =E2=80=98__kstrtab_find=
_get_pages_tag=E2=80=99=20
was here
mm/filemap.c:845: error: redefinition of =E2=80=98__ksymtab_find_get_pa=
ges_tag=E2=80=99
mm/filemap.c:786: error: previous definition of =E2=80=98__ksymtab_find=
_get_pages_tag=E2=80=99=20
was here
make[1]: *** [mm/filemap.o] Error 1
make: *** [mm] Error 2
make: *** Waiting for unfinished jobs....
[...]

Any ideas?


Thanks,

Ray

--=20
You cannot discover new oceans unless
you have the courage to lose sight of
the shore
-
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
