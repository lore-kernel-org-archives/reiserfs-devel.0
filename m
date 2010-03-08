From: Arnold Layne <kostet@tut.by>
Subject: Re: How to handle bad blocks on Reiser4?
Date: Mon, 08 Mar 2010 14:06:11 +0200
Message-ID: <4B94E833.9000800@tut.by>
References: <4B941113.2090708@tut.by> <4B941EEB.3010206@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4B941EEB.3010206@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Thanks for the recommendation.
But I am interested to handle bad blocks for work with no UNC...
I'd tried to
fsck.reiser4 -B ./badblockslist --build-fs /dev/sda7
-B option non documented and adopted, but no result...

07.03.2010 23:47, Edward Shishkin =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> I would recommend dd_rescue -A -B 4096
> to the spare partition of the same size
> with the following fsck the last one.
>
> Edward.
>
>
> Arnold Layne wrote:
>   =20
>> Instructions http://chichkin_i.zelnet.ru/bad-block-handling.html
>> doesn't work with reiser4progs.
>> --=20
>> To unsubscribe from this list: send the line "unsubscribe
>> reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>     =20
>   =20
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
