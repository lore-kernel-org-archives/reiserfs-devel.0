From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 patch and formatting partitions
Date: Fri, 31 Aug 2012 08:38:46 +0200
Message-ID: <50405BF6.3070809@gmail.com>
References: <ffc5fb825e3c08c0f37e9696d3025d65@mail.velocitynet.com.au> <5040588D.10501@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=cgQFsDS8EAR2OQ4nUNchGUCkl71CcwuRzztjuYUvqeQ=;
        b=myB69UtPmGU/k6GLptoQzBuHOPS5TV680aGFcxLJK2vUHzu22CiZyJTA5W44iD/Xoh
         uN60yII5vSLXMr7VoapKS0MDCxiYqu5HcEOd1W1na1+1o4RDUCRxI62Rm2CZPnl2h/nA
         dHoMaNKDO42tGcIrcRQO0d1I/+ZDcy+k6P/IcbbRaXbkp35wgnThwL/KqO8xjrQqkMq1
         zZV+D+U4I2q8H6FQWm5+xjjj78iObELB35a++WgmfHSthTgViC2ENgs3lN2/TslcFdEt
         xNR17t+MG5SP99f4HZL3COemb+e2fl1atDahis6njnk4a9Yju94r0NiD1IP+WaFUHfun
         fqMw==
In-Reply-To: <5040588D.10501@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: doiggl@velocitynet.com.au
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On 08/31/2012 08:24 AM, Edward Shishkin wrote:
> On 08/31/2012 05:19 AM, doiggl@velocitynet.com.au wrote:
>> Hello,
>> Is the reiser4 patch with the [kernel 3.1 stuff by Marcin Baczy=C5=84=
ski]
>> available somewhere to try out.
>> - Can the patch be accessed from [1] when it is released.
>
>
> This is not yet reviewed/tested.
>
>
>> - Should I use the format option -o "formatting=3Dextents" when crea=
ting a
>> partition e.g
>> mkfs.reiser4 -o create=3Dccreg40,formatting=3Dextents /dev/sdaX
>
>
> No.
> Cryptcompress file plugin doesn't use extents. It uses
> tail packing technique, which uses the buggy balance primitive.


That said, use

mkfs.reiser4 -o create=3Dreg40,formatting=3Dextents /dev/sdaX

or just

mkfs.reiser4 -o formatting=3Dextents /dev/sdaX

because "reg40" is default file plugin


Edward.

>
>
>>
>> Information from this thread [2]
>>
>> Thanks
>> Glenn
>>
>> [1] http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-=
2.6/
>> [2] http://www.spinics.net/lists/reiserfs-devel/msg03216.html
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
