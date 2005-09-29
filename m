From: Islam Amer <pharon@gmail.com>
Subject: Re: iosched (was Re: Full of surprises - A reiser4 story from userland)
Date: Thu, 29 Sep 2005 12:34:54 +0300
Message-ID: <5d8b7b905092902343f3c2ce8@mail.gmail.com>
References: <1127914812.12894.96.camel@laptop>
	 <1127921286.12894.106.camel@laptop> <433ABD7B.1010903@slaphack.com>
	 <1127932340.12894.149.camel@laptop>
	 <5d8b7b90509281213c95e30c@mail.gmail.com>
	 <200509281952.j8SJq9Uo007371@turing-police.cc.vt.edu>
	 <433AFDF6.3070404@namesys.com>
	 <5d8b7b9050928133842241311@mail.gmail.com>
	 <433B3B8B.5090007@slaphack.com>
	 <b14e81f0050928182211a75f1f@mail.gmail.com>
Reply-To: Islam Amer <pharon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26333-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f0050928182211a75f1f@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael chang <thenewme91@gmail.com>
Cc: David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Fionn Behrens <fionn@spamfilter.de>, reiserfs-list@namesys.com

>
> IIRC, don't vanilla and -mm have some somewhat substancial internal
> differences that could require manual changes?  I could be wrong
> though, I've never even looked at the diffs/patches for vanilla vs
> -mm.
>
That's what I am pointing to. The patches might apply cleanly or have
a few FAILED hunks that can be fixed easily by hand. But what do I
know about the changes made to the vfs layer etc..
I could break something without knowing it.
