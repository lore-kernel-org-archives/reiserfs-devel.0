From: "Szabolcs Szasz" <sz@szasz.hu>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 13:23:12 +0100
Message-ID: <009a01c2df24$29cd91f0$6400a8c0@twister>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <3E5F50F3.2040907@namesys.com> <200302281411.38967.liviu.voicu@huji.ac.il> <200302281313.09102.m.c.p@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12986-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Well, as man nice says:

    "Range goes from -20 (highest priority) to 19 (lowest)."

So why is that such a surprise that CPU goes up
to the sky? Why else -20 is there for? (Or am I
missing something?)

Cheers,
Sab


----- Original Message -----
From: "Marc-Christian Petersen" <m.c.p@gmx.net>
To: "Voicu Liviu" <liviu.voicu@huji.ac.il>; "Hans Reiser" <reiser@namesys.c=
om>; "Oleg Drokin" <green@namesys.com>
Cc: <reiserfs-list@namesys.com>
Sent: 2003. febru=E1r 28. 13:13
Subject: Re: ReiserFS causes CPU high usage?!


On Friday 28 February 2003 13:11, Voicu Liviu wrote:

Hi Voicu,

> Already using this :-)
> Any way, the system works great but if I change the "nice" value of some
> process then the CPU almost becomes slave of this process.........
out of sheer curiosity: Why you are nicing emerge to -20?!

You are using the O(1) scheduler so I see absolute no need to do so.

ciao, Marc

