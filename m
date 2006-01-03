From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4, crashing
Date: Tue, 03 Jan 2006 10:24:05 -0800
Message-ID: <43BAC145.1050705@namesys.com>
References: <43B81244.6080503@ursynow.2a.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27585-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43B81244.6080503@ursynow.2a.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Cc: reiserfs-list@namesys.com

Artur Mak=F3wka wrote:

> Hello, i've been experiencing crashes for more than 2 months, and i'm
> trying to figure out what is causing it. I sent to this list few
> description of my problem, but you said it is not fault of reiser4.
>
> I still have to hard proofs, but my apt-get is still very slow, and
> vim is also not very fast (even when my reiser4 partition is mounted
> with noatime and nodiratime)
>
> last thing im noticing just before crash is this process:
>
> 965 root      10  -5     0    0    0 D  0.8  0.0   0:02.35 ent:hda2!
>
> when everything works fine, its also in memory but like this:
>
> root       965  0.0  0.0      0     0 ?        S<   17:41   0:00
> [ent:hda2.]
>
> maybe its normal, but after i tried to get help on many forums, and
> from many people, nobody really knows whats going on on my server.
>
> its kernel 2.6.14.3 with latest reiser4 patch for this kernel, and i
> have these problems for more than 2 months, i've been stracing/gdbimg
> all process on my server, especially apache as it is taking the most
> resources, but i cant figure out anything strange.
>
> besides IOWait is huge, like 30% on procinfo.
>
> i heard in some situations it is possible for reiser4 developer to log
> in on server and see everything. Since i've been trying to debug it
> for so long, is it possible to do it in this situation?
>
> There is nothing in any logs, so i can't do anything, i could turn on
> reiser4.debug but my machine is busy and i dont know how this will
> affect the performance
>
>
>
>
Please try the latest patch I sent to reiserfs-list.  The guys are on
Russian christmas vacation, so we won't really be able to be much help
before the 12th, sorry.
