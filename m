From: Volker Armin Hemmann <volkerarmin@googlemail.com>
Subject: Re: Reiser4: Compilation Error on 2.6.28.1_[Scanned]
Date: Sun, 25 Jan 2009 18:13:50 +0100
Message-ID: <200901251813.50957.volkerarmin@googlemail.com>
References: <1232326407.2948.7.camel@localhost> <4974F05A.7090406@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4974F05A.7090406@gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: reiserfs-devel@vger.kernel.org

On Montag 19 Januar 2009, Edward Shishkin wrote:
> Ingo Bormuth wrote:
> > Reiser4-for-2.6.28 does apply but fails to compile on
> > vanilla-2.6.28.1 due to the following commit:
> >
> > http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;=
a=3Dcommit
> >diff;h=3D54566b2c1594c2326a645a3551f9d989f7ba3c5e
> >
> > Attached is a tiny fix which works fine here.
>
> yeah, with your patch it will act as earlier,
> however, -mm guys decided to get rig of __GFP_FS flag:
> http://userweb.kernel.org/~akpm/mmotm/broken-out/fs-symlink-write_beg=
in-all
>ocation-context-fix-reiser4-fix.patch it seems they found it deadlocky=
=2E.

so without Ingo Bormuth's patch you can't use r4 with 2.6.28.1 and late=
r and=20
with his patch there is a risk of deadlocks?

Gl=C3=BCck Auf,
Volker
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
