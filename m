From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [FIXED?] reiser4: problem with key inconsistency
Date: Wed, 31 Oct 2012 21:24:49 +0400
Message-ID: <2414795.eiFhpRrsg9@intelfx-laptop>
References: <508DA9FE.5060005@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-transfer-encoding:content-type;
        bh=4aG6EOK2MpKnDBbzcNWsqaCUgEbZrqV0DdtsQV8Wp9s=;
        b=Oqh7UAA3yOqQ8er3bLXzlzPZmLDC3HO8pK0smQgj14PaC8j59OhxK2WdiHNOsn1JIk
         XIpqSa6eV/3b7P124KsVlrFkO7UbhCbEcvQh1QgD4Y5QgEifmiam0hlJY6qsf69tLlAz
         8C2Afl4RRV6CdRSf3xYNl9ayJCCGWgjZ9aKsMyibE4OB47d0jSLDDoPyBnWgbt2trDOU
         TTC58u6H1fq8IoqHzKSB/tOPJGE3VnFTJrQ2c5yzMUdbnqXV0+UIfbiS/A+G/i/dUtti
         EFbo+393MS8JWS7efNPWpSZlRuLqiSF0BVTf+Fcp0Bqr7fargirAbYouJJN+FWADuSUR
         ht7g==
In-Reply-To: <508DA9FE.5060005@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: edward.shishkin@gmail.com
Cc: reiserfs-devel@vger.kernel.org

On 28 =D0=BE=D0=BA=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2012 22:56:14 Edward S=
hishkin wrote:
> Hi all.
> It seems I do have the long-awaited fix.
>=20
> The symptoms of the problem: kernel starts to issue complaints
> about key inconsistency with the suggestions to check the partition
> with fsck. Fsck sometimes finds corruptions, but sometimes reports
> that file system is consistent.
>=20
> Please apply the attached patch to reiser4 stuff for 3.6.2, or
> download reiser4-for-3.6.4 (which already contains this patch), and
> let me know if the problem has not gone:
> http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.x/
>=20
> Please, don't rush to deploy production systems on reiser4: it can
> take up to 80 hours to reproduce the problem with high workload.
>=20
> Thank you for your help.
> Edward.

Alas, it hasn't gone... Or maybe it's a different problem, but today (o=
n a=20
debugless build) I've got a massive crash (mostly -2 and -5 errors for=20
different VFS operations - e.g.=20
nikita-717/edward-1611/edward-430/nikita-2219/nikita-2221, many vs-3533=
 and=20
edward-1460/edward-1608/edward-156 warnings).
=46sck said SIGSEGV, so I had to restore from a daily backup. Don't kno=
w if that=20
is related to allocator, but anyway.

And I don't have much time these days to set up VM with a clone of my s=
ystem=20
for kgdb, sorry... Though I hope I'll do that on next week (on vacation=
s).

BTW, changing RAM didn't help, and old RAM passes memtest - so here it'=
s truly=20
a bug somewhere in allocator.

Regards,
Ivan.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
