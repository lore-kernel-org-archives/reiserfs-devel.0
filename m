From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: mount throws a nikita-3228 on me
Date: Thu, 27 May 2004 11:02:47 +0400
Message-ID: <1085641367.1915.197.camel@tribesman.namesys.com>
References: <20040525080001.GF4990@nysv.org>
	 <1085473856.1915.99.camel@tribesman.namesys.com>
	 <20040525211133.GG4990@nysv.org>
	 <20040526052052.GO1583@backtop.namesys.com>
	 <20040526204050.GI4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18866-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040526204050.GI4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus =?koi8-r?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: Alex Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com

Hello

On Thu, 2004-05-27 at 00:40, Markus T=C6rnqvist wrote:
> On Wed, May 26, 2004 at 09:20:53AM +0400, Alex Zarochentsev wrote:
> >
> >There is a delay (up to 24h) in the public BK update.=20
>=20
> OK. I tried it with what was suggested on the list.
> It did not, however work. I added the lines to reiser4.h;=20

did you remove lines from debug.h?

> should I
> have seen some better debug info? I just did a quick boot, so I
> may have missed something...
>=20
> I understand times have been hectic at Namesys, so just keep on
> trying and I'll keep on testing and telling you what's up :)
>=20
> But I understood from IRC that this problem should really be fixed?
> So am I doing something wrong here?
>=20
certainly
> I just noted that I don't have large keys enabled in the kernel.
> Must have missed that one. Anyway, still it fails and says small
> keys are supported, alone.
>=20
> Thanks for the help, though, and I'll get back to you

Please try the following: add something incompilable in reiser4.h right
after=20
#define REISER4_LARGE_KEY (1)

on compiling you should get some files not compilable - as expected
and some files which compile fine. The last ones have wrong #include
section. The mentioned change in reiser4.h and debug.h should fix that
though




