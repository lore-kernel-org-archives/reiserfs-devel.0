From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Hard disk crash and solution
Date: Wed, 22 Jan 2003 23:01:30 +0100
Message-ID: <200301222301.30116.Dieter.Nuetzel@hamburg.de>
References: <IKENJBHCILNPNAGHKCHFOEDMCCAA.Art@chello.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12455-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <IKENJBHCILNPNAGHKCHFOEDMCCAA.Art@chello.nl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Niek <Art@chello.nl>, reiserfs-list@namesys.com

Am Mittwoch, 22. Januar 2003 22:35 schrieb Niek:
> Title: IBM DTLA 307045 Hard disk crash

[Nice stroy snipped]

> mymachine:/rescued # mount -treiserfs -o loop -r hdd9.img /d9
> mymachine:/rescued #
>
>
> ------- Hee, no errors any more -------- let's check it's contents
>
>
>
> Data is there. I'm very happy!!
> What did we learn. A lot. One of them is that computers are more unreliab=
le
> than humans and they are
> not very reliable. Look e.g. at Suse. Their auto update should have updat=
ed
> the reiserfs programs to the
> newest versions, but they forgot to put that in. I'll mail them.
> One thing that Namesys should do is to make the software more user-friend=
ly
> and put this type of info in their webpages
> Crashed HD's are a pain in the ass to repair. This type of IBM drives have
> a flaw. Ibm confirmed this, but they did not remove them from the market.

You should have learnt to start with the "latest" available tools from the=
=20
InterNet ;-)

3.6.5-pre1 is latest.
ftp://ftp.namesys.com/pub/reiserfsprogs/pre

Greetings,
	Dieter

PS There is documentation.

=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)

