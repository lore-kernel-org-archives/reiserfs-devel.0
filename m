From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Kernel Ooops when using kdesu
Date: Sat, 09 Oct 2010 00:33:39 +0200
Message-ID: <4CAF9C43.2050804@gmail.com>
References: <20101008221833.202470@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20101008221833.202470@gmx.net>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?B?U3ZlbiBNw7xsbGVy?= <musv@gmx.de>
Cc: reiserfs-devel@vger.kernel.org

Sven M=C3=BCller wrote:
>> Hello.
>> Could you please try the attached patch and report about results?
>>
>> Thanks,
>> Edward.
>>    =20
>
> It's working like a charm. Thx a lot. Would be fine, if it's included=
 into the next kernel patch.
>  =20

Note, this is only partial fix up (for cryptcompress).
The unix_file plugin is still buggy and should be fixed
in the same manner (a bit later)...
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
