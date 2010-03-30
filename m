From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: problem with corrupted filesystem
Date: Tue, 30 Mar 2010 23:07:32 +0200
Message-ID: <4BB26814.9000007@gmail.com>
References: <10637573.555449.1269939595054.JavaMail.fmail@mwmweb063>, <4BB1D144.4070506@gmail.com> <2277622.85186.1269965206483.JavaMail.fmail@mwmweb062>, <4BB22BD0.6000406@gmail.com> <28084896.266414.1269980037917.JavaMail.fmail@mwmweb061>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <28084896.266414.1269980037917.JavaMail.fmail@mwmweb061>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-2022-jp"; format="flowed"
To: Marcus Becker <Becker_Marcus1@web.de>
Cc: reiserfs-devel@vger.kernel.org

Marcus Becker wrote:
> Hi,
>
> I tried using hash=3Dtea as mount option with the same result.
>  =20

I don't think that reiser4 supports such mount option

> Is this something I can change on an already formatted partition?
>  =20

What do you want to change? IMHO the type of hash can be assigned only
in mkfs time. There was an interface to change it on-line per-directory=
 (via
so-called pseudo-files), but this is still deprecated and is not used.

> Where can I check, which hash is used?

In the plugin table of (root) directory of debugfs.reiser4 -t output.
Attributes of other objects are inherited through the semantic tree
by default and, hence, are not shown.

In your case (that you have sent me) we have the following:

NODE (715370) LEVEL=3D1 ITEMS=3D22 SPACE=3D0 MKFS ID=3D0x7c4de18e FLUSH=
=3D0x0
#0  SD (stat40): [29:1(SD):0:2a:0] OFF=3D28, LEN=3D94, flags=3D0x0
[...]
permission : id =3D 0
formatting : id =3D 2 (smart)
hash : id =3D 1 (r5_hash) <<<<<<<<<<<<<<<
fibration : id =3D 2 (ext_1_fibre)
statdata : id =3D 0 (stat40)
diritem : id =3D 2 (cde40)
crypto : id =3D 0
digest : id =3D 0
compress : id =3D 0 (lzo1)
compressMode : id =3D 4 (conv)
cluster : id =3D 0 (64K)
create : id =3D 0 (reg40)

Edward.

>  /proc/mounts doesn't list the option.
>
> Thanks,
>
> Marcus
>
>
> -----Urspr=C3=BCngliche Nachricht-----
> Von: Edward Shishkin <edward.shishkin@gmail.com>
> Gesendet: Mar 30, 2010 6:50:24 PM
> An: Marcus Becker=20
> Betreff: Re: problem with corrupted filesystem
>
>  =20
>> Marcus Becker wrote:
>>    =20
>>> Hi Edward,
>>>
>>> I uploaded the file here:
>>> http://omploader.org/vM3pxYw
>>>  =20
>>>      =20
>> Ok, got it. Thanks.
>>
>> So what's up with your emerge? Why did it fail? With what error?
>> Was is a system crash, power loss, etc?
>>
>> Edward.
>>
>>    =20
>>> hope I can help,
>>>
>>> Marcus
>>>
>>>
>>> -----Urspr=C3=BCngliche Nachricht-----
>>> Von: Edward Shishkin <edward.shishkin@gmail.com>
>>> Gesendet: Mar 30, 2010 12:24:04 PM
>>> An: Marcus Becker=20
>>> Betreff: Re: problem with corrupted filesystem
>>>
>>>  =20
>>>      =20
>>>> Marcus Becker wrote:
>>>>    =20
>>>>        =20
>>>>> the problem is actual reproduceable. I emerged gcc again and the =
excact same happened:
>>>>>
>>>>> disi-laptop portage # rm -r *
>>>>> rm: cannot remove `sys-devel/gcc-4.4.3/work/gcc-4.4.3/libjava/cla=
sspath/resource/gnu/java/locale': Directory not empty
>>>>>  =20
>>>>>      =20
>>>>>          =20
>>>> Hello.
>>>>
>>>> Would you please pack the metadata by
>>>> debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
>>>> and let me download the file meta.gz
>>>>
>>>> Thanks,
>>>> Edward.
>>>>
>>>>
>>>>    =20
>>>>        =20
>>>>> =20
>>>>>
>>>>> I am not sure, why it doesn't like that particular folder..
>>>>>      =20
>>>>>          =20
>>> ___________________________________________________________
>>> WEB.DE DSL: Internet, Telefon und Entertainment f=C3=BCr nur 19,99 =
EUR/mtl.!
>>> http://produkte.web.de/go/02/
>>>
>>>  =20
>>>      =20
> ___________________________________________________________
> GRATIS f=C3=BCr alle WEB.DE-Nutzer: Die maxdome Movie-FLAT!
> Jetzt freischalten unter http://movieflat.web.de
>
>  =20

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
