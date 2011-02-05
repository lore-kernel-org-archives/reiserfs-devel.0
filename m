From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Is there any reason reiser4 took this long on a large file delete
 process.
Date: Sat, 05 Feb 2011 11:55:08 +0100
Message-ID: <4D4D2C8C.8000103@gmail.com>
References: <9af190a7cd5249f4cd484b1cfc20b89e@mail.velocitynet.com.au> <op.vqfaj8lghogzsi@g17b>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=p9LpbTvpUK7rTh7RDxdYeflZRW49VY2JI6ooyqG+mCs=;
        b=A8lBEwpynxtmbGw/DjPQB9YOpUV0UyFyabIUSGjM+l7dhUJx4dRkKK5uc3lkmgFHlm
         b5fJa/uBp+gz2H7Wq4lsyzljZiqhdugPpprGrmVE7+sLSa6QljcRRgyaHvEuQPKQwMxS
         hrP03zvMZOQQLN7dbLUewU0rOVSEFvqmzi5KI=
In-Reply-To: <op.vqfaj8lghogzsi@g17b>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra.jonas@seznam.cz>
Cc: doiggl@velocitynet.com.au, ReiserFS mailing list <reiserfs-devel@vger.kernel.org>

On 02/05/2011 10:13 AM, Jon=C3=A1=C5=A1 Vidra wrote:
> On Sat, 05 Feb 2011 04:14:41 +0100 <doiggl@velocitynet.com.au> wrote:
>
>> Hello,
>> Is there any reason reiser4 took this long on a large file delete pr=
ocess
>>
>> - File size 4,237,037,568 openSUSE-DVD-Build0957-i586.iso
>>
>> # time rm /media/disk/iso/openSUSE-DVD-Build0957-i586.iso
>>
>> real 12m4.027s
>> user 0m0.000s
>> sys 1m10.132s
>
> You use cryptcompress, right? A compressed file is AFAIK split into m=
any
> small fragments, which means that lots of records in the tree have to=
 be
> changed while deleting the file.
>

Unfortunately I don't know any good heuristic to detect
iso-files by content. So partition formatted with "ccreg40"
is not the best solution for media-files..

Edward.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
