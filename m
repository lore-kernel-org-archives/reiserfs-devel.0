From: Hans Reiser <reiser@namesys.com>
Subject: Re: Again, some bad Reiser4 (ReiserFS) 'reviews'
Date: Thu, 15 Jul 2004 10:56:24 -0700
Message-ID: <40F6C548.7030805@namesys.com>
References: <200407150025.30908.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19638-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407150025.30908.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: reiserfs-list@namesys.com, rufus@hackish.org

Dieter N=FCtzel wrote:

>http://rufus.hackish.org/wiki/2.6FileSystemBenchmarks
>
>Greetings,
>	Dieter
>
>
> =20
>
I think he has an fsync intensive workload, which reiser4 is not good at=20
because we haven't bothered with it yet, and we care more about maturing=20
the atomic functionality.  I have no idea what ccache does with the fs. =20
Does it use fsync?

How he got tar to be slow is hard to understand, I don't remember seeing=20
a slow tar using reiser4, does anyone else?  I am guessing he created=20
the tarball using ext2, and didn't know that readdir order matters and=20
affects the tarball, and that he should create it on the filesystem=20
being benchmarked.  Maybe the tarball ordering also affects subsequent=20
compiles, I don't know.

zam, would you confirm that the fibration plugin is our current default=20
plugin?

Hans
