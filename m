From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: performance improvements
Date: Mon, 23 Dec 2002 22:20:44 +0100
Message-ID: <200212232220.44981.Dieter.Nuetzel@hamburg.de>
References: <200212231632.26686.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12233-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200212231632.26686.russell@coker.com.au>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Russell Coker <russell@coker.com.au>, ReiserFS <reiserfs-list@namesys.com>

Am Montag, 23. Dezember 2002 16:32 schrieb Russell Coker:
> One thing that could really improve system performance would be something
> like "nice" but for disk IO.
>
> If you have a server that's using 90% of it's disk bandwidth with a large
> number of clients (EG a big mail server) then a simple "find /" is usually
> enough to give it a load average of 50+ and a delay of 1 second for every
> disk request (which makes operations such as POP mail checks excessively
> slow).

What you are really looking for is the deadline IO scheduler coming with=20
2.5/2.6.

Merry Christmas!

=2DDieter

=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)

