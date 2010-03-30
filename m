From: Marcus Becker <Becker_Marcus1@web.de>
Subject: Re: problem with corrupted filesystem
Date: Tue, 30 Mar 2010 19:47:15 +0200 (CEST)
Message-ID: <6815382.158116.1269971235110.JavaMail.fmail@mwmweb061>
References: <10637573.555449.1269939595054.JavaMail.fmail@mwmweb063>,
 <4BB1D144.4070506@gmail.com>
 <2277622.85186.1269965206483.JavaMail.fmail@mwmweb062>,
 <4BB22BD0.6000406@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4BB22BD0.6000406@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-2022-jp"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Nothing wrong with it, just couldn't clean up afterwards. No crash etc.
emerge uses /var/tmp/portage as a build directory and when the binaries=
 are finished it moves them to the live system and removes all files in=
 there.
It cleans all other files/folders but cannot remove that folder (same a=
s me).

Actual, I built gcc just again to see if the same happens again.
this time I ran it again after moving the folder to /root and without f=
sck.=20
It ended up in a segmentation fault
Also I have another "locale" folder that cannot be removed.
Third time, same happens.

I'll now go ahead and do fsck again, remove those 2 folders and see aft=
erwards if gcc builds fine again.

Always different inode, same problem with that "locale" folder
I can emerge other ebuilds without problems.

Cheers,

Marcus

-----Urspr=C3=BCngliche Nachricht-----
Von: Edward Shishkin <edward.shishkin@gmail.com>
Gesendet: Mar 30, 2010 6:50:24 PM
An: Marcus Becker=20
Betreff: Re: problem with corrupted filesystem

>Marcus Becker wrote:
>> Hi Edward,
>>
>> I uploaded the file here:
>> http://omploader.org/vM3pxYw
>>  =20
>
>Ok, got it. Thanks.
>
>So what's up with your emerge? Why did it fail? With what error?
>Was is a system crash, power loss, etc?
>
>Edward.
>
>> hope I can help,
>>
>> Marcus
>>
>>
>> -----Urspr=C3=BCngliche Nachricht-----
>> Von: Edward Shishkin <edward.shishkin@gmail.com>
>> Gesendet: Mar 30, 2010 12:24:04 PM
>> An: Marcus Becker=20
>> Betreff: Re: problem with corrupted filesystem
>>
>>  =20
>>> Marcus Becker wrote:
>>>    =20
>>>> the problem is actual reproduceable. I emerged gcc again and the e=
xcact same happened:
>>>>
>>>> disi-laptop portage # rm -r *
>>>> rm: cannot remove `sys-devel/gcc-4.4.3/work/gcc-4.4.3/libjava/clas=
spath/resource/gnu/java/locale': Directory not empty
>>>>  =20
>>>>      =20
>>> Hello.
>>>
>>> Would you please pack the metadata by
>>> debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
>>> and let me download the file meta.gz
>>>
>>> Thanks,
>>> Edward.
>>>
>>>
>>>    =20
>>>> =20
>>>>
>>>> I am not sure, why it doesn't like that particular folder..
>>>>      =20
>> ___________________________________________________________
>> WEB.DE DSL: Internet, Telefon und Entertainment f=C3=BCr nur 19,99 E=
UR/mtl.!
>> http://produkte.web.de/go/02/
>>
>>  =20
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
