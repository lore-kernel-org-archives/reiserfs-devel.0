From: Hans Reiser <reiser@namesys.com>
Subject: Re: Again, some bad Reiser4 (ReiserFS) 'reviews'
Date: Mon, 19 Jul 2004 10:49:34 -0700
Message-ID: <40FC09AE.3040907@namesys.com>
References: <200407150025.30908.Dieter.Nuetzel@hamburg.de>	 <40F6C548.7030805@namesys.com> <1090237920.11153.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19685-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1090237920.11153.0.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: redeeman@metanurb.dk
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

Redeeman wrote:

>On Thu, 2004-07-15 at 10:56 -0700, Hans Reiser wrote:
> =20
>
>>Dieter N=FCtzel wrote:
>>
>>   =20
>>
>>>http://rufus.hackish.org/wiki/2.6FileSystemBenchmarks
>>>
>>>Greetings,
>>>	Dieter
>>>
>>>
>>>=20
>>>
>>>     =20
>>>
>>I think he has an fsync intensive workload, which reiser4 is not good at =

>>because we haven't bothered with it yet, and we care more about maturing =

>>the atomic functionality.  I have no idea what ccache does with the fs.  =

>>Does it use fsync?
>>
>>How he got tar to be slow is hard to understand, I don't remember seeing =

>>a slow tar using reiser4, does anyone else?  I am guessing he created=20
>>the tarball using ext2, and didn't know that readdir order matters and=20
>>affects the tarball, and that he should create it on the filesystem=20
>>being benchmarked.  Maybe the tarball ordering also affects subsequent=20
>>compiles, I don't know.
>>   =20
>>
>wow, i didnt know i had to create on the filesystem i benchmark, i
>always just created on what i had, and that werent reiser4, but still
>reiser4 proved to be the fastest (alot faster than the other)
> =20
>
;-)

Maybe somebody should try to reproduce his benchmark.  Maybe he either=20
made more errors than I guessed at, or, quite likely, he found a=20
weakness that we should look into.

fsync we suck at though.  Maybe in 6 months we can look at optimizing it=20
(I know that fsync matters in the real world, I just don't have spare=20
resources at the moment).

> =20
>
>>zam, would you confirm that the fibration plugin is our current default=20
>>plugin?
>>
>>Hans
>>
>>   =20
>>

