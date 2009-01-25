From: Volker Armin Hemmann <volkerarmin@googlemail.com>
Subject: Re: Reiser4: Compilation Error on 2.6.28.1_[Scanned]
Date: Sun, 25 Jan 2009 18:15:07 +0100
Message-ID: <200901251815.08030.volkerarmin@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:to:subject
         :content-disposition:from:date:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=/6141hKL/hSlx7q1Mx4b9AFJjtCjpFeIp40IcMvl3D8=;
        b=AVVR3dJyTOh4XMy+S1/4OC/+RMQthPThC3Ka3OX1Sn23l5HcqrROdzRFNcjtoRr2U3
         KPC+or2ICAiowEwLg9hItezYnLkaHvZXh0xe0W6+9z47g5buMLS87qOSO0WJarn3IMKw
         pDLlj6X0F/AA2rgBC9GVvJzluLMTFGp/iOnd8=
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
