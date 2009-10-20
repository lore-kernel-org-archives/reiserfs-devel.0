From: Viji V Nair <viji@fedoraproject.org>
Subject: Re: reiser4progs-1.0.7 compilation error.
Date: Wed, 21 Oct 2009 00:59:42 +0530
Message-ID: <84c89ac10910201229l2d0ca68dw7a3f2595cd5dcc3@mail.gmail.com>
References: <84c89ac10910200135i2f8c3b11q5850d08bb63ab1e0@mail.gmail.com>
	 <4ADD9904.4080202@gmail.com>
	 <84c89ac10910200442m404688e4jcd73173cb97fbbb3@mail.gmail.com>
	 <4ADDADCC.1080603@gmail.com>
	 <84c89ac10910201110o5613a6edv259018698f77e285@mail.gmail.com>
	 <1256062393.3234.0.camel@fz.local>
	 <84c89ac10910201155o7b28aaa1w1fbfa4ee5f6aaa55@mail.gmail.com>
	 <1256065288.3234.2.camel@fz.local> <4ADE0E32.5080100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=AARIMhP8nT7n9nCErC7RUalQpj2LZT+ufIS/9qJpyHk=;
        b=qqlon9dBpmYtIwhtYv4cLawSaMoBkIom7LJv4lkiKCAFpmI/hDF8WiUEsCxqMVgOAL
         GkRmY3Cte7ofvZRfQxKmJ9WNlAAYrga/VE6WZnfR69wEbbpK/tKmC8draMuyLUkhrcaa
         1xYW580Xn6gbhkUgy2ad9AU7j3J51BpQ62DsM=
In-Reply-To: <4ADE0E32.5080100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Felix Zielcke <fzielcke@z-51.de>, reiserfs-devel@vger.kernel.org

On Wed, Oct 21, 2009 at 12:53 AM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Felix Zielcke wrote:
>>
>> Am Mittwoch, den 21.10.2009, 00:25 +0530 schrieb Viji V Nair:
>>
>>>
>>> configure:24168: gcc -o conftest -fno-stack-protector
>>> -I/usr/local/include =A0-L/usr/local/lib conftest.c -laal =A0>&5
>>> configure:24174: $? =3D 0
>>> configure:24261: gcc -o conftest -fno-stack-protector
>>> -I/usr/local/include -static =A0-L/usr/local/lib conftest.c -laal =A0=
>&5
>>> /usr/bin/ld: cannot find -lc
>>> collect2: ld returned 1 exit status
>>
>> Looks like you don't have the static libc.a or at least ld couldn't =
find
>> it.
>
> thanks, Felix.
>
> Viji, I think it makes sense to consult with Fedora's libc maintainer=
s..
>
> As per my Fedora 11: I don't upgrade it since my new hp xw4600
> can not boot kernels >=3D 2.6.30 because of bios bug..
>
> Edward.
>
>
installing glibc-static on fedora has fixed the issue, I think this
has not documented anywhere. I think I can write a howto page with
exact steps and publish it.

I am benchmarking reiser4 for a large number (50 million) of small
images (1-30k), thank you all for your support.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
