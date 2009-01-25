From: Volker Armin Hemmann <volkerarmin@googlemail.com>
Subject: Re: Reiser4: Compilation Error on 2.6.28.1_[Scanned]
Date: Sun, 25 Jan 2009 18:56:15 +0100
Message-ID: <200901251856.15678.volkerarmin@googlemail.com>
References: <200901251815.08030.volkerarmin@googlemail.com> <200901251837.58313.volkerarmin@googlemail.com> <497CA4F1.3050807@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:references:in-reply-to:cc:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=8y7OJkiXQ1VV5NfP2SjG95a9kCYx2WtAqGokcXGM48I=;
        b=o8qJUh6ftygXH7kidzWpSN8VswwQpmGkNSx8KSM62IwROQPIM3tiJ4vmuXpywUfRKo
         o74tpaBIHvHtBFVnXlYNrRFsFhA1XcaaQGCn/tgwUJ+IkKAfQL+H2vRc6SWTIRJvhkLG
         PpgQPJcqWuUa1ARvnZbj4GOrQRTb0rjoB1/U0=
In-Reply-To: <497CA4F1.3050807@gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On Sonntag 25 Januar 2009, you wrote:
> Volker Armin Hemmann wrote:
> > On Sonntag 25 Januar 2009, Edward Shishkin wrote:
> >> Volker Armin Hemmann wrote:
> >>> On Montag 19 Januar 2009, Edward Shishkin wrote:
> >>>> Ingo Bormuth wrote:
> >>>>> Reiser4-for-2.6.28 does apply but fails to compile on
> >>>>> vanilla-2.6.28.1 due to the following commit:
> >>>>>
> >>>>> http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.=
git;a=3Dco
> >>>>>mm it diff;h=3D54566b2c1594c2326a645a3551f9d989f7ba3c5e
> >>>>>
> >>>>> Attached is a tiny fix which works fine here.
> >>>>
> >>>> yeah, with your patch it will act as earlier,
> >>>> however, -mm guys decided to get rig of __GFP_FS flag:
> >>>> http://userweb.kernel.org/~akpm/mmotm/broken-out/fs-symlink-writ=
e_begi
> >>>>n- all ocation-context-fix-reiser4-fix.patch it seems they found =
it
> >>>> deadlocky..
> >>>
> >>> so without Ingo Bormuth's patch you can't use r4 with 2.6.28.1
> >>
> >> Ingo's patch is against -rc
> >>
> >>>  and later and
> >>> with his patch there is a risk of deadlocks?
> >>
> >> Not sure.
> >> Nobody complained so far..
> >
> > hm, I had two lockups with 2.6.28 and your r4 patch so far. Suddenl=
y the
> > box only responded to sysrq
>
> Would you please send the sysrq-t output?

I wish I could - but the logs were empty - and I couldn't even make it =
back to=20
vt. X froze partially, no reaction to input, but apps running continued=
 to do=20
so, e, i  killed apps, s and u seemed to have some effect and b worked =
- but=20
after that, raid resync and fsck for the mounted ext2 partition went of=
f. I=20
did t too - but as I wrote above, there were nothing in the logs. I am =
not=20
blaming r4 - I am using fglrx which could be the cause.=20

Gl=C3=BCck Auf,
Volker


--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
