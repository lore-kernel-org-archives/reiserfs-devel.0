From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: fsck.reiser4: segfault in aux_adler32 at aux.c:194
Date: Mon, 07 Feb 2011 15:11:00 +0100
Message-ID: <4D4FFD74.8060903@gmail.com>
References: <AANLkTi=5pCaXg49iC+YZ0H_HHKHjxJD-uf0O9gyyYUHa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=5pCaXg49iC+YZ0H_HHKHjxJD-uf0O9gyyYUHa@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: =?UTF-8?B?TWFyY2luIEJhY3p5xYRza2k=?= <marbacz@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Marcin Baczy=C5=84ski wrote:
> Hi,
> following the instructions at reiser4.wiki.kernel.org I'm reporting h=
ere
> sigsegv I get when fscking resiser4 fs.
>
> I'm using reiser4progs 1.0.7. Attached backtrace is from patched
> version, with patch from [1] applied, but the same crash happens
> with unpatched version.
>  =20

Could you please also try this one:
http://marc.info/?l=3Dreiserfs-devel&m=3D127504471326353&w=3D2

> Let me know if you need more info.
>  =20

If it doesn't help, then provide all fsck output (not only stacktrace).

Thanks,
Edward.

> [1] http://article.gmane.org/gmane.comp.file-systems.reiserfs.general=
/23447
>  =20

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
