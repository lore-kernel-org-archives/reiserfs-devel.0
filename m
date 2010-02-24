From: hank peng <pengxihan@gmail.com>
Subject: Re: reiserfs issuce on MPC8548 board
Date: Wed, 24 Feb 2010 15:47:57 +0800
Message-ID: <389deec71002232347o656af0a3v8dbbd91087b5a7a6@mail.gmail.com>
References: <389deec71002221814u29f19356ucd449762473dbdde@mail.gmail.com>
	 <alpine.DEB.2.01.1002232315500.28195@bogon.housecafe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=lUF7PZiO/0hKl43r56UxdhCy0Hywv1Y816QF5INGhd0=;
        b=hyrhvSPeBunm/gDZmL2c74m8PYI3bBPn5e8mQK/cHYJVy+/0c/kV1l4gO6xGWz3VDy
         e/dczXWtBsBKxMnUWSHr8TCeSrhSKNK83GsK4znJxUJe+QadWbCZSNG8KICOwaEAXs6Y
         CnkcPdLDpExBz/453BCuPcY5p/kdMFv/ZQXTA=
In-Reply-To: <alpine.DEB.2.01.1002232315500.28195@bogon.housecafe.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christian Kujau <lists@nerdbynature.de>
Cc: reiserfs-devel@vger.kernel.org

2010/2/24 Christian Kujau <lists@nerdbynature.de>:
> On Tue, 23 Feb 2010 at 10:14, hank peng wrote:
>> Feb =C2=A05 14:45:36 axAC123 user.crit kernel: REISERFS error (devic=
e
>> dm-1): reiserfs-2025 reiserfs_cache_bitmap_metadata: bitmap block 0 =
is
>> corrupted: first bit must be 1
>
> Most probably hardware failures (disks/cabling/RAM), is there nothing=
 else
> in syslog? Try dd'ing from dm-1 and see if there are any read errors.
>
Thanks for your reply.
When this problem happened, there is not other error or warning message=
s.
I suspect there is something wrong with memory, because it is a
self-built board. However, the system used to work fine for 12 days
without any problem, but now this trouble happened.
> Christian.
> --
> BOFH excuse #275:
>
> Bit rot
>



--=20
The simplest is not all best but the best is surely the simplest!
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
