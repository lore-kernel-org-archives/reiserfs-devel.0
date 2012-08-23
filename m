From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: A best approach to get a summary of r4-conflicting kernel changes
 from 2.6.39
Date: Thu, 23 Aug 2012 19:39:12 +0200
Message-ID: <50366AC0.8000903@gmail.com>
References: <5669697.fA5P36S773@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=JHNvnyGt5raphPL3SlvhFVIybNA2X807FAy0p+Pb1fw=;
        b=BfBvx4nxJjH0M+hdIUPg+bqAESjh4oVqEmowTu9kwZeDtNYa6vSWQHAm7WWOcZowLs
         yrBFjMXuawRpx3xFfvIa86pRmalevYQh6o9KTEtmBjJBtnFXj6Mp2aNPB8GS8ek6QyWR
         POes9tzg1jbVZ3okatCcTpHJRHM5z0GtOPxjVr7rn8JP9XXVvdnFj2+tFh52lU5NdLTr
         GRxhPo08SMB1GFHHq3KLSIpxv1l4sSHnss8EXxI3Z0vmjOOMdd+Oyh0p9VQvLaYnxCte
         Fy7L6BFpa/kVkbnKI9NbJog9mlLgIumefAswppt22P1RzRZ7AcW3uELS1Ew/xQLOc8E0
         3c1w==
In-Reply-To: <5669697.fA5P36S773@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hi Ivan,

Such summaries can be found at http://kernelnewbies.org/RecentChanges
(see section "VFS" of each summary).

Reiser4 makes a friendship with Linux VFS in all items except
fs-writeback. So I think it will be enough just to look at respective
changes, say, in ReiserFS (v3).

As to modifications in fs-writeback: Reiser4 has been adjusted to
3.1 stuff by Marcin Baczy=C5=84ski (I can forward the patch). I believe
this can be easily ported also to the next kernels.

Thanks,
Edward.
P.S.
Here I explained bits where reiser4 clashes with fs-writeback:
http://marc.info/?l=3Dreiserfs-devel&m=3D132603099732236&w=3D2




On 08/17/2012 10:53 PM, Ivan Shapovalov wrote:
> Hello,
>
> What is the best way to get some "summary" of changes that the kernel=
 had
> undergone from 2.6.39 (last reiser4-compatible) to current? I need no=
t all
> changes, but only those which make the current kernel reiser4-incompa=
tible.
> In particular, will "git log" suffice - and if yes, to which files/di=
rectories
> shall it be applied?
>
> Thanks in advance,
> Ivan Shapovalov
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
