From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: fs-level crypto
Date: Mon, 20 Apr 2015 13:35:17 +0200
Message-ID: <5534E475.5070502@gmail.com>
References: <5534C02A.10507@niksula.hut.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=Va0ZVMx7CZXhE5AabE9P2wYd+5OBgKmoFKRSj21JOrs=;
        b=A0bPGlsgLjcdZ5b3BYZyx802cHS5ucQxzm2ZlqLxzKt6auR2s+9G0WTBh5BsUWtUpR
         Gs8UBXUSMU7f9pSl8cDjNEBTHPDMV1fBxXzeHyn8njV15K+23aEE536MW0rjUi0Um572
         ZWDKezDCgd9X78bpgA40hPcKJwRvjkszPHiAeXw3Z9tGz4neUJokjV5bO0rN/6fY00zp
         XRZxjSr4zlNKtfWxN+cssnocA6a05SVslDhyzlN28vUMtRf7EwlgTNwrLKjLCCAs85wk
         z06HZnxAGAT7ymqGambiw9lqiE4me6WVM4kHrjeojP7HouQbqIMgMue0Dn/UIFrh0nen
         L6xw==
In-Reply-To: <5534C02A.10507@niksula.hut.fi>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: =?UTF-8?B?4oCg?= <god12@niksula.hut.fi>, reiserfs-devel@vger.kernel.org

Hello everyone,

I have already implemented a common solution for distributed systems=20
with detection
of tampering on non-trusted servers:
http://www.gluster.org/community/documentation/index.php/Features/disk-=
encryption

It also works for a local file system: just deploy GlusterFS on the=20
single brick.
GlusterFS can not be deployed on reiser4 though (because of lack of xat=
trs).

Native solution for encryption in reiser4 is implemented on 90%.
One just needs to call a proper cipher transform (AES-XTS) at=20
inflate/deflate_cluster(),
and add key management bits.
Decryption is going at ->readpage(s) time. Encryption is going only at=20
commit time
(right before writing data to disk).

Thanks,
Edward.


On 04/20/2015 11:00 AM, =E2=80=A0 wrote:
> Hi.
>
> There's ext4 filesystem-level encryption support pushed for upcoming =
4.1 kernel. As
> far as I recall there's been talks about possibility of sharing some =
of that code to
> implement similar feature for f2fs as well.
>
> I wonder if it could be possible to reuse this code to get fs-level e=
ncryption for R4
> too? Or maybe there's already crypto implementation which I've overlo=
oked?
>
> cheers,
> Max.
>
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
