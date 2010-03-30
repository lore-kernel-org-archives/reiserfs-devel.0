From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: problem with corrupted filesystem
Date: Tue, 30 Mar 2010 18:50:24 +0200
Message-ID: <4BB22BD0.6000406@gmail.com>
References: <10637573.555449.1269939595054.JavaMail.fmail@mwmweb063>, <4BB1D144.4070506@gmail.com> <2277622.85186.1269965206483.JavaMail.fmail@mwmweb062>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <2277622.85186.1269965206483.JavaMail.fmail@mwmweb062>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Marcus Becker <Becker_Marcus1@web.de>
Cc: reiserfs-devel@vger.kernel.org

Marcus Becker wrote:
> Hi Edward,
>
> I uploaded the file here:
> http://omploader.org/vM3pxYw
>  =20

Ok, got it. Thanks.

So what's up with your emerge? Why did it fail? With what error?
Was is a system crash, power loss, etc?

Edward.

> hope I can help,
>
> Marcus
>
>
> -----Urspr=C3=BCngliche Nachricht-----
> Von: Edward Shishkin <edward.shishkin@gmail.com>
> Gesendet: Mar 30, 2010 12:24:04 PM
> An: Marcus Becker=20
> Betreff: Re: problem with corrupted filesystem
>
>  =20
>> Marcus Becker wrote:
>>    =20
>>> the problem is actual reproduceable. I emerged gcc again and the ex=
cact same happened:
>>>
>>> disi-laptop portage # rm -r *
>>> rm: cannot remove `sys-devel/gcc-4.4.3/work/gcc-4.4.3/libjava/class=
path/resource/gnu/java/locale': Directory not empty
>>>  =20
>>>      =20
>> Hello.
>>
>> Would you please pack the metadata by
>> debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
>> and let me download the file meta.gz
>>
>> Thanks,
>> Edward.
>>
>>
>>    =20
>>> =20
>>>
>>> I am not sure, why it doesn't like that particular folder..
>>>      =20
> ___________________________________________________________
> WEB.DE DSL: Internet, Telefon und Entertainment f=C3=BCr nur 19,99 EU=
R/mtl.!
> http://produkte.web.de/go/02/
>
>  =20

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
