From: zic422@gmail.com
Subject: Re: [fsck.reiser4 --fix] segfaults and reports that it fixed problem
 (but it doesn't)
Date: Sat, 21 Aug 2010 16:53:49 +0300
Message-ID: <AANLkTi=HNDZS65d6N5UNQz9r=vayPx9ZaQzNBno_mbm0@mail.gmail.com>
References: <AANLkTi=wQuQ4_ReRZXvzLx2BxhQRVryqQviFkqi+V5ye@mail.gmail.com>
	<4C6FB62A.6040708@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001636c5bf53b0841b048e55bec0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=O/8dgbfTFzBkIDRMBPqqIHn4WpPo/qYWAc11davVDlo=;
        b=btZY6kahg+ag8+kzT4X5Cj7eADAPTVhIZDJ00zrCPj/BQtB8MIwP7ECgAP0U8aoZDV
         d9KyeU41jJW5fR5/YRsvk0RCH/o+c0qpS6qSkmnIQ3BpMCMD4XugdYcGmHZdaSXwMwLf
         tthnEe3NBlYlIAZxhp+O6Cpm0BVRHeiNslAqs=
In-Reply-To: <4C6FB62A.6040708@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

--001636c5bf53b0841b048e55bec0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Problem solved. Thanks. Log is in attachment.

On Sat, Aug 21, 2010 at 2:19 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> zic422@gmail.com wrote:
>> Check was perfomed from Debian Squeeze.
>> Even if I explicitly write -o
>> create=3Dccreg40,compress=3Dlzo1,cluster=3D4K,compressMode=3Dultim the o=
nly
>> difference is that there is no segfault.
>>
>
> Please, make sure you have the following patch applied:
> http://marc.info/?l=3Dreiserfs-devel&m=3D127504471326353&w=3D2
>
> Thanks,
> Edward.
>
>



--=20
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 spu=C7=9D
bu=C4=B1=C9=A5=CA=87=CA=8E=C9=B9=C7=9D=CA=8C=C7=9D

--001636c5bf53b0841b048e55bec0
Content-Type: application/x-bzip2; name="log-2010-08-21.txt.bz2"
Content-Disposition: attachment; filename="log-2010-08-21.txt.bz2"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gd4j652z0

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
--001636c5bf53b0841b048e55bec0--
