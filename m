From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 patch and formatting partitions
Date: Fri, 31 Aug 2012 09:27:20 +0200
Message-ID: <50406758.4000101@gmail.com>
References: <ffc5fb825e3c08c0f37e9696d3025d65@mail.velocitynet.com.au> <5040588D.10501@gmail.com> <8a02fe7a19b065bf0a2b411df2db1e20@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=j9rWLukIX4522OXpkfMt05zN0isTc9CfEusJb171+Vw=;
        b=TKBtSr7VYaYJtGjp/Zlw4JeDkbwpP97kRhL2pAte+8M2vTE2nm+0oz+/zkzCR6GO3R
         2oHkXrPAJ/V60hEbfYBGnGtJsXEUfIEfqVunK+Jkxf/VSp85ucVt0J5muBVUPRGSXEIF
         Iv5Sjl282Pt1qyt9+i9waclfc8Y3JzJdg8YGPAGs1zr8Rw2vV7/bHgQ92ls9jf5pxJnn
         R1G1CAXjZOSO3SHsCgSKQ+psszy6FytmSgF0WmqgSwZfDKSwJcYZ8DXMZVAx8y/BZjWV
         Ob9SNvQwhbMtbeGOkUo0uhagZAOmZFQJJQWw47b/S9ESexU9TcjFq6J8ipFwaPieE4T2
         6TnA==
In-Reply-To: <8a02fe7a19b065bf0a2b411df2db1e20@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: doiggl@velocitynet.com.au
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On 08/31/2012 06:05 AM, doiggl@velocitynet.com.au wrote:
> On Fri, 31 Aug 2012 08:24:13 +0200, Edward Shishkin
> <edward.shishkin@gmail.com>  wrote:
>> On 08/31/2012 05:19 AM, doiggl@velocitynet.com.au wrote:
>>> Hello,
>>> Is the reiser4 patch with the [kernel 3.1 stuff by Marcin Baczy=C5=84=
ski]
>>> available somewhere to try out.
>>> - Can the patch be accessed from [1] when it is released.
>>
>>
>> This is not yet reviewed/tested.
>>
>>
>>> - Should I use the format option -o "formatting=3Dextents" when cre=
ating
> a
>>> partition e.g
>>> mkfs.reiser4 -o create=3Dccreg40,formatting=3Dextents /dev/sdaX
>>
>>
>> No.
>> Cryptcompress file plugin doesn't use extents. It uses
>> tail packing technique, which uses the buggy balance primitive.
>>
>>
>>>
>>> Information from this thread [2]
>>>
>>> Thanks
>>> Glenn
>>>
>>> [1]
> http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-2.6/
>>> [2] http://www.spinics.net/lists/reiserfs-devel/msg03216.html
>>>
>
>
>
>>> - Should I use the format option -o "formatting=3Dextents" when cre=
ating
> a
>>> partition e.g
>>> mkfs.reiser4 -o create=3Dccreg40,formatting=3Dextents /dev/sdaX
>>
>> No.
>> Cryptcompress file plugin doesn't use extents. It uses
>> tail packing technique, which uses the buggy balance primitive.
>
> Hello,
>
> Question:
> Have you got an example on how to format a reiser4 partition please, =
what
> would be safe to use ?
>
> mkfs.reiser4 -o XXXXX /dev/sda
> where XXXXX =3D ??? options


mkfs.reiser4 -o formatting=3Dextents /dev/sdaX

Edward.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
