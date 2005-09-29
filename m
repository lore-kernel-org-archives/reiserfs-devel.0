From: David Masover <ninja@slaphack.com>
Subject: Re: iosched (was Re: Full of surprises - A reiser4 story from userland)
Date: Wed, 28 Sep 2005 19:55:39 -0500
Message-ID: <433B3B8B.5090007@slaphack.com>
References: <1127914812.12894.96.camel@laptop>	 <200509281825.49873.vitaly@namesys.com>	 <1127921286.12894.106.camel@laptop> <433ABD7B.1010903@slaphack.com>	 <1127932340.12894.149.camel@laptop>	 <5d8b7b90509281213c95e30c@mail.gmail.com>	 <200509281952.j8SJq9Uo007371@turing-police.cc.vt.edu>	 <433AFDF6.3070404@namesys.com> <5d8b7b9050928133842241311@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26327-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5d8b7b9050928133842241311@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Islam Amer <pharon@gmail.com>
Cc: Hans Reiser <reiser@namesys.com>, Valdis.Kletnieks@vt.edu, Fionn Behrens <fionn@spamfilter.de>, reiserfs-list@namesys.com

Islam Amer wrote:

> Problem is lots of experimental patches in -mm series hurt throughput
> and performance and reiser4 users have to suffer. Otherwise we have to
> go through the slightly non-trivial procedure of patching the vanilla
> kernel.

Non-trivial?  How's this:

for i in `egrep '^reiser4' ../broken-out/series`; do
	patch -p1 < ../broken-out/$1;
done

That won't always work, but it's certainly trivial.

Places it won't work:  patch names with spaces (won't happen), commented
patches (just generates weird errors), and a couple of kernels also need
the attached patch.  I don't remember which ones, but you get a compiler
error unless you've got it right.

It'll also fail (obviously) if anything's changed since I last checked.
