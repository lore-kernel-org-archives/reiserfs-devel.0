From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4/2.6.11 dbench hang
Date: Wed, 06 Apr 2005 21:44:59 -0500
Message-ID: <42549EAB.8000602@slaphack.com>
References: <4249D57F.8020809@gmx.net>	 <1112188350.4761.671.camel@tribesman.namesys.com>	 <424B0A4F.8010809@gmx.net>	 <1112219882.4650.759.camel@tribesman.namesys.com>	 <424B299E.5020805@gmx.net> <1112290038.22814.10.camel@tribesman.namesys.com> <424DA147.2020903@gmx.net> <42549D81.5020702@parkheights.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23792-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42549D81.5020702@parkheights.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sergey ivanov <seriv@parkheights.dyndns.org>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

sergey ivanov wrote:
> So how about this deadlock? Is there any expectation about fix for it?
>     Wbr,
>         Sergey.
> 
> Christian Mayrhuber wrote:
> 
>> Vladimir Saveliev schrieb:
>>
>>>
>>> This problem is fixed, but running your test during several hours caused
>>> reiser4 crash. It just happened, so, tomorrow I will take a look at it.
>>>
>>
>> I was able to deadlock kernel 2.6.11 + reiser4-for-2.6.11-3.patch.gz
>> + elevator=cfq.

Is it just with elevator=cfq?

BTW, I heard something about anticipatory being bad (IO only goes one
way at a time).  Is this true?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQlSeqngHNmZLgCUhAQJasQ/+PEUD4RS4+vsRR0Raekx5RXNyyUspvqOO
8boVKC9fjUYxfFI14cD38TqOXvTgEVvoMobUkV6KaiYf/MdIFGFYx4G9M5/YsNCh
3jZ9ENKp8UzfmClX4ZkXtgySPTun85zk4yklv+GoFT56pdMzSbNUHXx/2u/ttRyv
/SMKAddqHRSwM0R6Svy33CBApDXmcyjCzzSWowBinO4u6vfZH6KJS/vdA9GYomTa
UreczCnx/iUN89fL1yPwLDamF787Wgp0This5ivbzxrq9KTeUPmsbS3dNJu1HuYs
spQ946jJW8gN15abszJuXG8qUFHr3Cy9t5FOBExcjHa25pYIJZ+lFjI5Euo5jaDl
1rLBAB2Ax3QdEEP4uiMfied+ynLvcGy1bOs9fS0jp0Ou53WXZlMuQ6jJTyF+XQJ0
MmLboyjZslg3JkyQSu2As5A3KwgN+rOWAjBqh1mbuHlZ4f727WSSaGbt4WRhyfxr
hrS8fW6sOSwK+50F/7ZnPuAwPuGZCWuQArNoEARE1CPwCQCduAs+bMOkM1p3Sowy
yLVxrJztGD5dssYmKJuE9UavYG+3ZPDk5hXG/FRczSJ0LHDu99z6bWR1BfEnmBoL
uMZMf0DhZwoQdtp99CE0hNL//wyrSrodtAnAx9q3YHL0qoQWCyYYFhnFWobsO/en
8ROwkSEKgyY=
=dHG5
-----END PGP SIGNATURE-----
