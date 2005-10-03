From: Hans Reiser <reiser@namesys.com>
Subject: Re: latest 2.6.13 reiser4 patch
Date: Sun, 02 Oct 2005 23:25:01 -0700
Message-ID: <4340CEBD.1080508@namesys.com>
References: <000901c5c542$31765840$0300a8c0@JUICE1>	 <e692861c0509301320p13dfe1faq9f020589ee4ef06c@mail.gmail.com>	 <002501c5c6b7$92e5dda0$0300a8c0@JUICE1> <1128196222.9989.32.camel@gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26379-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1128196222.9989.32.camel@gentoo>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>, reiserfs-list@namesys.com

Jake Maciejewski wrote:

>On Sat, 2005-10-01 at 20:40 +0200, Artur Mak=F3wka wrote:
> =20
>
>>>>Will it work also with 2.6.13.2 kernel  ? or is it only for 2.6.13 ( or
>>>>2.6.13.1 )
>>>>
>>>>i couldnt find any information about this on page, and i want to be=20
>>>>sure...
>>>>       =20
>>>>
>>>I used it fine with 2.6.13.2... but my wireless card isn't supported
>>>there. (it's been included in 2.6.14x, so it was never patches against
>>>2.6.13.. I tried backporting my wireless driver but there were a lot
>>>of changes in both directions).  The patch also applies cleanly
>>>against 2.6.14-rc1/2 but 2.6.14-rc1/2 panic on initrd uncompress for
>>>me, and I can't troubleshoot it because the backtrace scrolls my
>>>screen and I can't do a serial console on my laptop. :(
>>>
>>>In any case I tested reiser4 out some on 13.2, and the only bug I hit
>>>was a panic on unmount.
>>>     =20
>>>
>>but is there some official statment about using 2.6.x reiser4 patches wit=
h=20
>>2.6.x.x kernels? i mean, does patch called reiser 4 2.6.13 patch is also =

>>intended to work with 2.6.13.2 for example or only with 2.6.13 ?
>>   =20
>>
>
>2.6.x.y patches are obvious security or bug fixes that aren't supposed
>to introduce new bugs. I'm in no position to make an official statement,
>but until the development process changes again, 2.6.x reiser4 patches
>should always work on 2.6.x.y versions.=20
>
> =20
>
It should work just fine.  That is not the same as saying it was tested
and it worked just fine, but it is the best I can do.
