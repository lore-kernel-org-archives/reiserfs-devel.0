From: Marc-Christian Petersen <m.c.p@gmx.net>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 13:13:09 +0100
Message-ID: <200302281313.09102.m.c.p@gmx.net>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <3E5F50F3.2040907@namesys.com> <200302281411.38967.liviu.voicu@huji.ac.il>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12974-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302281411.38967.liviu.voicu@huji.ac.il>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Voicu Liviu <liviu.voicu@huji.ac.il>, Hans Reiser <reiser@namesys.com>, Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Friday 28 February 2003 13:11, Voicu Liviu wrote:

Hi Voicu,

> Already using this :-)
> Any way, the system works great but if I change the "nice" value of som=
e
> process then the CPU almost becomes slave of this process.........
out of sheer curiosity: Why you are nicing emerge to -20?!

You are using the O(1) scheduler so I see absolute no need to do so.

ciao, Marc
