From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: 2 minutes for a reiser4 filesystem to mount.
Date: Sat, 24 Oct 2015 01:58:01 +0300
Message-ID: <B4C46971-499C-4275-A153-D0FE220401D3@gmail.com>
References: <n0b6ql$6t4$1@ger.gmane.org> <1445636264.2412.0.camel@gmail.com> <BLU436-SMTP17E43BAB1F0262E99F242F9B260@phx.gbl>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=references:mime-version:in-reply-to:content-type
         :content-transfer-encoding:message-id:cc:from:subject:date:to;
        bh=3XidWSF7+KOG9pk3tzOasDGHcBp8CJRE5/xXWfQTtbk=;
        b=YNqt2xdpfocleaAFnTxPiHThZ5k8JK//j/uqAW+ktTYkHYq+BIdeXAAH/AYm0e3FDf
         MFnCOEyYRr49kxEc++Y7O1PM3mNQ7hHowBljNiB1n2ruzZ1z8Uma+ubjDy6yLIPDL6Zh
         q62JGkKTN4t0lk54twCd1buYYPKIvvEubqTZwArSu04dkp3U18cnQviEyKgXVMhYpxhN
         z7s/Dx6EGYDxQSqBmgPSKD7Sb67TBxJMl0r1AOH0bAybMbAy0vBPKOwSHdjOnvroynah
         cYB9kvj1expEnwTJQ/ihNKI1iyTM12Lj3I22FO/VuArbTglB6C/BcRQt2EBQSDjgrZnN
         ggCA==
In-Reply-To: <BLU436-SMTP17E43BAB1F0262E99F242F9B260@phx.gbl>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Georgios Tsalikis <georgios.tsalikis@hol.gr>
Cc: reiserfs-devel@vger.kernel.org

> 24 =D0=BE=D0=BA=D1=82. 2015 =D0=B3., =D0=B2 1:06, Georgios Tsalikis <=
georgios.tsalikis@hol.gr> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=
=B0):
>=20
>> On 24/10/2015 12:37 =CF=80=CE=BC, Ivan Shapovalov wrote:
>>> On 2015-10-22 at 20:38 +0300, Georgios Tsalikis wrote:
>>> The filesystem is 1.7GB large, lies in a GPT patition and is format=
ed
>>> with -o node=3Dnode41 without any other override. The kernel is 4.2=
=2E3
>>> with
>>> the 4.2.2 patch.
>>> I tried the same on a 250MB partition and it mounts instantly. dmes=
g
>>> shows nothing special
>>> Any ideas? Thanks in advance. :)
>> Hello,
>>=20
>> try "dont_load_bitmap" in mount options. However, this is anyway ver=
y
>> strange for a ~2GB partition...
>=20
> I am sorry, did i write 1.7GB? I meant 1.7TB... i am old and such fig=
ures dont fit my mind easily!

Ah, so it's 1.7 TB? Then it's not unusual at all. Indeed, try mounting =
with `-o dont_load_bitmap`.

--
Ivan Shapovalov / intelfx /

(Sent from a phone. Havoc may be wreaked on the formatting.)--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
