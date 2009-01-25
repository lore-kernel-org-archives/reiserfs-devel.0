From: Volker Armin Hemmann <volkerarmin@googlemail.com>
Subject: Re: Reiser4: Compilation Error on 2.6.28.1_[Scanned]
Date: Sun, 25 Jan 2009 18:37:58 +0100
Message-ID: <200901251837.58313.volkerarmin@googlemail.com>
References: <200901251815.08030.volkerarmin@googlemail.com> <497CA235.9030504@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=deOrcWEJ2HSl7E+K0prquTe+qwNk92me6peWgOKm7cg=;
        b=jdHURkR+w9NoZUlOCVq/2N9nuplCYmCnIbaBX6f1Rw5yGhP3xDVbr8qWH5gZUmAPO/
         AMzjBTXxY6HLqDHuY8tL9scrAPJGkBvo4694NH+MZz24pth44MG+i23GLX/G3od9PlN8
         FbCKTdASjFXUGChbwK/CK+nbBP3U4aXC2ob4I=
In-Reply-To: <497CA235.9030504@gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On Sonntag 25 Januar 2009, Edward Shishkin wrote:
> Volker Armin Hemmann wrote:
> > On Montag 19 Januar 2009, Edward Shishkin wrote:
> >> Ingo Bormuth wrote:
> >>> Reiser4-for-2.6.28 does apply but fails to compile on
> >>> vanilla-2.6.28.1 due to the following commit:
> >>>
> >>> http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.gi=
t;a=3Dcomm
> >>>it diff;h=3D54566b2c1594c2326a645a3551f9d989f7ba3c5e
> >>>
> >>> Attached is a tiny fix which works fine here.
> >>
> >> yeah, with your patch it will act as earlier,
> >> however, -mm guys decided to get rig of __GFP_FS flag:
> >> http://userweb.kernel.org/~akpm/mmotm/broken-out/fs-symlink-write_=
begin-
> >>all ocation-context-fix-reiser4-fix.patch it seems they found it
> >> deadlocky..
> >
> > so without Ingo Bormuth's patch you can't use r4 with 2.6.28.1
>
> Ingo's patch is against -rc
>
> >  and later and
> > with his patch there is a risk of deadlocks?
>
> Not sure.
> Nobody complained so far..

hm, I had two lockups with 2.6.28 and your r4 patch so far. Suddenly th=
e box=20
only responded to sysrq - and on reboot the software raid5 with my r4=20
partitions on needed a resync. Might be related or not. I am back to 2.=
6.27=20
which never showed any misbehaviour.

Gl=C3=BCck Auf,
Volker

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
