From: Marcus Becker <Becker_Marcus1@web.de>
Subject: Re: problem with corrupted filesystem
Date: Tue, 30 Mar 2010 18:06:46 +0200 (CEST)
Message-ID: <2277622.85186.1269965206483.JavaMail.fmail@mwmweb062>
References: <10637573.555449.1269939595054.JavaMail.fmail@mwmweb063>,
 <4BB1D144.4070506@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4BB1D144.4070506@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hi Edward,

I uploaded the file here:
http://omploader.org/vM3pxYw

hope I can help,

Marcus


-----Urspr=C3=BCngliche Nachricht-----
Von: Edward Shishkin <edward.shishkin@gmail.com>
Gesendet: Mar 30, 2010 12:24:04 PM
An: Marcus Becker=20
Betreff: Re: problem with corrupted filesystem

>Marcus Becker wrote:
>> the problem is actual reproduceable. I emerged gcc again and the exc=
act same happened:
>>
>> disi-laptop portage # rm -r *
>> rm: cannot remove `sys-devel/gcc-4.4.3/work/gcc-4.4.3/libjava/classp=
ath/resource/gnu/java/locale': Directory not empty
>>  =20
>
>Hello.
>
>Would you please pack the metadata by
>debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
>and let me download the file meta.gz
>
>Thanks,
>Edward.
>
>
>> =20
>>
>> I am not sure, why it doesn't like that particular folder..
>
___________________________________________________________
WEB.DE DSL: Internet, Telefon und Entertainment f=C3=BCr nur 19,99 EUR/=
mtl.!
http://produkte.web.de/go/02/
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
