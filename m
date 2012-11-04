From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [FIXED?] reiser4: problem with key inconsistency
Date: Sun, 04 Nov 2012 16:09:15 +0400
Message-ID: <4898149.3YCWtrZZtf@intelfx-laptop>
References: <508DA9FE.5060005@gmail.com> <2414795.eiFhpRrsg9@intelfx-laptop> <50954002.50105@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-transfer-encoding:content-type;
        bh=Kmb0z1neTNtiQ6r9+1WuTivQ/F7cf+nP2Vbn84bBEGA=;
        b=CSEvhYNukLViEh6246+wmMxdoPleq3RuF8wPVcBd28xN5WglQ8A7drGuwFx/4IJmg0
         SMrPRA8fEAM5c6wkXQAOf8ltiv4PL0vpHcYU8XjOzgwwkIYNdpgPqqb22UeceQ9JRqwK
         Vn/7T6CDEHjD4uCULQ4MOVckgLMlgIytfibA3qGa341Omy8l+S7VJbbigvxG7QETyI/m
         D/Vl1ySY7jNOraauHHlmPSlnNBNDRhGLcn0uMKKmGjM74uWcxmGVOT8BlMg6CKeSO+zR
         y6Gir+lArl43Gl+I8vTFgAikpCTTZnaiJQ/QmKrEOM/6X1jSfUcHQC7iA+J8G0n0UZ1I
         y3Gw==
In-Reply-To: <50954002.50105@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 03 Nov 2012 17:02:10 Edward Shishkin wrote:
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
> > Fsck said SIGSEGV,
>=20
> There are pending patches for reiser4progs, please don't forget to ap=
ply
> them when checking your partitions:
>=20
> http://marc.info/?l=3Dreiserfs-devel&m=3D129703129519745&w=3D2
> http://marc.info/?l=3Dreiserfs-devel&m=3D127504471326353&w=3D2

Ah, these were not applied. Anyway, I don't have the faulty partition i=
mage,
so I'll probably wait for the next crash (with unpatched fsck) and chec=
k if=20
the problem is gone after patching.

Thanks,
Ivan.

>=20
>=20
> >  so I had to restore from a daily backup. Don't know if that
> > is related to allocator, but anyway.
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
> >=20
> > Regards,
> > Ivan.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
