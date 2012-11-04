From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [FIXED?] reiser4: problem with key inconsistency
Date: Sun, 04 Nov 2012 16:14:44 +0400
Message-ID: <1569445.vz5sd52eAA@intelfx-laptop>
References: <508DA9FE.5060005@gmail.com> <2414795.eiFhpRrsg9@intelfx-laptop> <5091713A.4000000@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-transfer-encoding:content-type;
        bh=uqJRZZpObRIZZytUzSFxUxHS4mYwpMtfuvbk1EV9W/k=;
        b=bcNeqYUHQq9P1VmzNGINfEdQm6TpI1spNzF3MSzPSdPR3IU2g6hM46WSh1M8o5Is6V
         cFrsGP3Byqbpymxpa/XMePAQa1wzHH5hhRu6Qk6LG+aJh52OcxdlktalhIX9AGXMGz7F
         UlKerK71Ra03nF6Pg0mUuRA7bO58gzv1pmUwCa43A4t7g6Kyg7v8XIDSjOWAkooSUNBa
         ZIBKBRczI5h+vFyQyGkvdHfpLx9w2P9UH+hr8RQyC7qaR+rn1W7O+awcwlk6FMrGnVhZ
         Rs+lkyCIuiQj3iR2KqAIuUszpOLA7BjvuJxUfJr3PuSPMBaIiO97ddkjaq2E+KQDr8KM
         xubg==
In-Reply-To: <5091713A.4000000@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 31 Nov 2012 19:43:06 Edward Shishkin wrote:
> On 10/31/2012 06:24 PM, Ivan Shapovalov wrote:
> > On 28 =D0=BE=D0=BA=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2012 22:56:14 Edwa=
rd Shishkin wrote:
> >> Hi all.
> >> It seems I do have the long-awaited fix.
> >>=20
> >> The symptoms of the problem: kernel starts to issue complaints
> >> about key inconsistency with the suggestions to check the partitio=
n
> >> with fsck. Fsck sometimes finds corruptions, but sometimes reports
> >> that file system is consistent.
> >>=20
> >> Please apply the attached patch to reiser4 stuff for 3.6.2, or
> >> download reiser4-for-3.6.4 (which already contains this patch), an=
d
> >> let me know if the problem has not gone:
> >> http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.=
x/
> >>=20
> >> Please, don't rush to deploy production systems on reiser4: it can
> >> take up to 80 hours to reproduce the problem with high workload.
> >>=20
> >> Thank you for your help.
> >> Edward.
> >=20
> > Alas, it hasn't gone... Or maybe it's a different problem, but toda=
y (on a
> > debugless build) I've got a massive crash (mostly -2 and -5 errors =
for
> > different VFS operations - e.g.
> > nikita-717/edward-1611/edward-430/nikita-2219/nikita-2221, many vs-=
3533
> > and
> > edward-1460/edward-1608/edward-156 warnings).
>=20
> Hmm, strange..
> It has gone for me.. At least, my machine works already
> 110 hours without complaints (before fixing I encountered
> this usually in 30-50 h). Well, I'll continue stressing.
>=20
> Anybody else has the problems with the patched stuff?
>=20
> > Fsck said SIGSEGV, so I had to restore from a daily backup. Don't k=
now if
> > that is related to allocator, but anyway.
> >=20
> > And I don't have much time these days to set up VM with a clone of =
my
> > system for kgdb, sorry... Though I hope I'll do that on next week (=
on
> > vacations).
> >=20
> > BTW, changing RAM didn't help, and old RAM passes memtest - so here=
 it's
> > truly a bug somewhere in allocator.
>=20
> May I ask you also to test your partition with badblock program?

3 passes (non-destructive R/W test, random pattern on each pass), no er=
rors.

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
