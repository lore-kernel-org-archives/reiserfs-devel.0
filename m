From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Sat, 28 Aug 2004 02:55:00 -0700
Message-ID: <41305674.6030405@namesys.com>
References: <412D9FE6.9050307@namesys.com> <200408261812.i7QICW8r002679@localhost.localdomain> <20040827203216.GC1284@nysv.org> <Pine.LNX.4.58.0408271335421.14196@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20965-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0408271335421.14196@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Linus Torvalds <torvalds@osdl.org>
Cc: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Andrew Morton <akpm@osdl.org>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Linus Torvalds wrote:

>On Fri, 27 Aug 2004, Markus T=F6rnqvist wrote:
> =20
>
>>People will say it when people stop using Linux on servers because
>>they can integrate metadata easier in other operating systems ;)
>>   =20
>>
>
>Heh. Considering that WinFS seems to be delayed yet more, I don't think=20
>that's a very strong argument.
>
>Hell will freeze over before Microsoft does a filesystem right. Besides,
>WinFS is likely almost in user mode anyway, ie mostly a library, rather
>like the gnome people are already doing with nome storage.
>
>So there's really no point in trying to push your agenda by trying to=20
>scare people with MS activities. Linux kernel developers do what's right=20
>because it is _right_, not because somebody else does it.
>
>		Linus
>
>
> =20
>
Apple will get it right.  I promise it.  I have met Dominic, and he is=20
very very sharp.  Look at the Tiger demos on their website.  Simple=20
interface, looks nice to me....=20

The one area he might screw up is performance, but I don't care to count=20
on that.

WinFS first tried to put it all in the FS, and then it became a user=20
mode library almost certainly because they are making the standard=20
mistakes the database guys make when they try to emulate file systems=20
without changing the core balanced tree algorithms, and their=20
performance sucked and they had to back off.  It took 11 years for me to=20
get it right, and they aren't as crazy-err-persistent as I am.;-)

We might get lucky and have them produce another NTFS, but then again,=20
when Microsoft focuses on a task, they do much better at it than they do=20
most of the time, and they are focused on WinFS.  They have hired very=20
sharp people.  We can hope that they don't know how to use them, but=20
when they hire people like Gerard Salton for $1 million a year, there is=20
just possibly a chance that they might try to get their money's worth=20
out of him.

You should not be complacent about WinFS being delayed to 2007, because=20
even if I get funding for enhanced ReiserFS semantics tomorrow we also=20
can't get the job done before 2007.  This is big science, not writing a=20
device driver.

Finally, how much harm will it be if we do it right and it is important=20
and they fail?  Suppose I am wrong about them, and we create a powerful=20
unifying namespace for Linux before any other OS does?  Is that so bad?

Creating a powerful namespace at the heart of Linux is the most=20
important enhancement you can make to the OS.=20

Finally the storage layer is good enough to support putting the=20
relationship between keywords (actually keyobjects in my scheme....) and=20
their documents directly into the FS without losing performance for=20
traditional file system usage patterns, and I get to stop tweaking=20
performance and go have fun with semantics in the next major release.

Hans
