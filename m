From: Joe Cooper <joe@swelltech.com>
Subject: Re: Re: New to reiserfs
Date: Mon, 13 May 2002 15:02:40 -0500
Message-ID: <3CE01BE0.2000003@swelltech.com>
References: <200205132153.59075.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10302-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Hans Reiser <reiser@namesys.com>, Chris Mason <mason@suse.com>, Oleg Drokin <green@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>, JPASTORM@esade.edu

Dieter N=FCtzel wrote:
> On Monday 13 May 2002 10:07, Hans Reiser wrote:

>>squid will benefit from your putting all files in one directory.

Hi Hans and all,

Out of curiosity...When did this become true?  I haven't tested in some=20
time, but way back in 2.4.0pre days it was very far from reality=20
(all-in-one-dir was about 20-30% slower than the standard default of=20
x/256/256).

I'll be happy to run some Polygraph runs of this...I wasn't aware=20
anything had changed, however.  Perhaps someone has a pointer for the=20
relevant changelog entries?
--=20
Joe Cooper <joe@swelltech.com>
http://www.swelltech.com
Web Caching Appliances and Support

