From: Mirar <mirar-yg@mirar.org>
Subject: Re: power loss -> corruption
Date: 08 May 2003 21:20:21 +0200
Sender: mirar@orchid.mirar.org
Message-ID: <m14r45xn2i.fsf@orchid.mirar.org>
References: <m1k7d11yaz.fsf@orchid.mirar.org>
	<200305081348.42359.Dieter.Nuetzel@hamburg.de>
	<m1fznp1w3a.fsf@orchid.mirar.org>
	<200305081502.47455.Dieter.Nuetzel@hamburg.de>
	<m17k911sq4.fsf@orchid.mirar.org> <3EBAA8DB.3080202@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14027-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EBAA8DB.3080202@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: =?iso-8859-1?q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>, reiserfs-list@namesys.com

Hans Reiser <reiser@namesys.com> writes:

> You have run into the disadvantage of meta-data journaling, which is
> that files that you are writing to may be corrupted if you crash.

Hmm, I guess the main problem here is the atomicity? 
I haven't studied traditional journaling very much. I somehow find it
odd that the wrong block can get in the wrong files... shouldn't at
least that be in the metadata?

(The only thing I know with journaling is an experiment of a low-level
database that I wrote, with atomic transactions and safe-tolerance.)

> This disadvantage exists for performance reasons: using traditional
> journaling approaches such as V3 uses, if you journal the data you
> must write it twice.  V3 also offers you the option of performing
> ordered writes, in which, if I remember right, metadata is only
> updated after the data reaches disk.

Any performance loss or data risk with using ordered?

> V4 uses a completely different technology we call wandering logs, in
> which every filesystem operation is performed as a fully atomic
> transaction, and because of its new design, there is very little
> performance cost (in fact, reiser4 is higher performance than V3).  We
> hope V4 will be ready for prime time sometime this summer.

I think V4 sounds excellent, and I hope it will be incorporated in
Linux 2.6/3.0. I assume there isn't any kernal patch for 2.4.20 around
so I can play with it? I'm sorry if it has been mentioned on the list,
I'm not up to date.

/Mirar
