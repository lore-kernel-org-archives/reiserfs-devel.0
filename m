From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Cryptocompress
Date: Thu, 03 Dec 2009 10:51:52 +0100
Message-ID: <4B178A38.7040509@gmail.com>
References: <26619602.post@talk.nabble.com> <op.u4ckimx4hogzsi@g17b>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <op.u4ckimx4hogzsi@g17b>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra.jonas@seznam.cz>
Cc: ReiserFS mailing list <reiserfs-devel@vger.kernel.org>

Jon=C3=A1=C5=A1 Vidra wrote:
> Dne Thu, 03 Dec 2009 02:27:32 +0100 drwowe <drwowe@yahoo.com> wrote:
>
>>
>> hello,
>> What is the status of the cryptcompress feature?  Is it stable enoug=
h=20
>> for
>> desktop use, or only for experimentation?
>
> Compression works and is stable,

The last complaint was on fsck ~1 yeah ago. Fixed.

> encryption is not implemented and it seems it never will be.

Actually it is implemented on a low level. Moreover,
long time ago I got a reiser4 partition transparently
compressed and ciphered by aes ecb. The problem
was that Linux didn't have a good key manager. Now
I believe that the situation is improved, so in order to
announce encryption we need:

1. a fast iv-generator stable to watermark attack for
    cbc encryption mode;
2. to adjust any convenient key manager to perform
    encryption per file/directory/volume.

I estimate the complexity of this task as 2 of 5.

Thanks,
Edward.

>
>
>
>> Also, is there any documentation that explains how to use the=20
>> feature?  I
>> seem to recall there was a mount options that turns it on, but also=20
>> to use
>> it I need to know how to do key management for encrypting files whic=
h I
>> haven't found.
>
> For compression, just format the FS with -o create=3Dccreg40.
> I also recommend setting hash to tea, since r5 hashing usually genera=
tes
> collisions for me, especially when compiling big stuff like GCC or=20
> OO.org,
> leading to minor corruptions requiring an offline fsck.
>

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
