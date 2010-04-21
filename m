From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: ReiserFS Crash
Date: Wed, 21 Apr 2010 23:04:12 +0200
Message-ID: <4BCF684C.2020609@gmail.com>
References: <4BCF6253.4040301@futureware.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4BCF6253.4040301@futureware.at>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?Philipp_G=FChring?= <pg@futureware.at>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Hello Philipp,

There were a number of fixups in the xattrs path since 2.6.25..
Could you consider upgrading your kernel?

Edward.


Philipp G=FChring wrote:
> Hi,
>
> I am currently analyzing a production machine that has (un)regular
> troubles, and discovered a problem in ReiserFS, I think:
>
> http://www2.futureware.at/~philipp/reiserfs-crash.txt
>
> I guess that some more NULL checks might be helpful in and around
> sprintf_le_key.
>
> If you need any additional information from that server, please let m=
e know.
> (I guess that there is probably a problem in the filesystem on the di=
sk,
> but I think that kernel crash is superfluous anyway)
>
> Best regards,
> Philipp G=FChring
>
>
>  =20

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
