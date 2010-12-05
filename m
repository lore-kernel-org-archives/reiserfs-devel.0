From: =?utf-8?B?0K7RgNC40Lkg0JfQsNC40LrQuNC9?= <yzaikin@gmail.com>
Subject: RE: Reiser4 for Linux-2.6.36
Date: Sun, 5 Dec 2010 20:33:00 +0200
Message-ID: <000c01cb94aa$daeda670$90c8f350$@com>
References: <4CE87674.4090909@gmail.com> <4CE93CEB.8050504@ya.ru> <4CE9603B.7050103@gmail.com> <000001cb89be$cebdfc20$6c39f460$@com> <4CE9D9D3.2010901@gmail.com> <4CE9E967.4020605@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language;
        bh=ZlVXsu7YP+KKMPQtYHpaEB4KhOIRZ6I8q4bDrkSk1Sk=;
        b=BW694tEZkGAIJDpYepj7Zwek0O+MMPjtZIKZ83s8wOdBgb5nyQIqSGK8XiY8yfLFKU
         81n/8hYXsE5U0JP90SZQzfEgBthP9GHLGeyZ4pOzDSmbrElMYfYJHZhCZ3ROOkXLVxP5
         dcHWzJXZaiJY6IJTYAgbiXeEYL2FKKX3fqoCM=
In-Reply-To: <4CE9E967.4020605@gmail.com>
Content-Language: ru
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: 'Edward Shishkin' <edward.shishkin@gmail.com>
Cc: 'Reiserfs mailing list' <reiserfs-devel@vger.kernel.org>

Works, thanks

-----Original Message-----
=46rom: Edward Shishkin [mailto:edward.shishkin@gmail.com]=20
Sent: Monday, November 22, 2010 5:54 AM
To: =D0=AE=D1=80=D0=B8=D0=B9 =D0=97=D0=B0=D0=B8=D0=BA=D0=B8=D0=BD
Cc: dimas000@ya.ru; 'Reiserfs mailing list'
Subject: Re: Reiser4 for Linux-2.6.36

Edward Shishkin wrote:
> =D0=AE=D1=80=D0=B8=D0=B9 =D0=97=D0=B0=D0=B8=D0=BA=D0=B8=D0=BD wrote:
>  =20
>> The bug with building OpenOffice is still there though now it doesn'=
t produce a kernel panic. The build script just randomly fails with IO =
exceptions.
>>    =20
>
> Is compression enabled (did you format the partition with=20
> "create=3Dccreg40" option)?
>
> Thanks for the report.

Ah, I see..
Could you please apply the attached patch?
Does it fix your problem?

Thanks,
Edward.



--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
