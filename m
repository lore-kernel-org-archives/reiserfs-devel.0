From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 5/7] arch: m68k: remove ReiserFS from defconfig
Date: Tue, 19 Sep 2023 09:19:56 +0200
Message-ID: <CAMuHMdVQaBBZgSsgZyNR2HxMsck2fWNjG6fK93eBFFeyDz0Hkw@mail.gmail.com>
References: <20230918175529.19011-1-peter@n8pjl.ca> <20230918175529.19011-6-peter@n8pjl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20230918175529.19011-6-peter@n8pjl.ca>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Peter Lafreniere <peter@n8pjl.ca>
Cc: linux-m68k@lists.linux-m68k.org, jack@suse.cz, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Peter,

On Mon, Sep 18, 2023 at 7:57=E2=80=AFPM Peter Lafreniere <peter@n8pjl.ca> w=
rote:
> ReiserFS has been deprecated for a year and a half, yet is still built
> as part of a defconfig kernel.
>
> According to commit eb103a51640e ("reiserfs: Deprecate reiserfs"), the
> filesystem is slated to be removed in 2025. Remove it from the defconfig
> profiles now, as part of its deprecation process.
>
> Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>

Thanks for your patch!

Given these defconfigs enable ReiserFS as a module (not built-in),
and that ReiserFS is still available upstream, and enabled by distros
like Debian, I would like to keep it that way.
The m68k defconfigs will be updated after the removal of ReiserFS,
as part of the regular defconfig resync.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
