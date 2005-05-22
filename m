From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 O_DIRECT
Date: Sun, 22 May 2005 10:31:19 -0700
Message-ID: <4290C1E7.9050505@namesys.com>
References: <1116525192.29446.5.camel@zion> <1116578526.3532.463.camel@tribesman.namesys.com> <1695540869.20050521234900@wp.pl> <42903838.4070500@namesys.com> <20050522171207.GB11013@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24107-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050522171207.GB11013@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Pysiak Satriani <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

Markus T=F6rnqvist wrote:

>On Sun, May 22, 2005 at 12:43:52AM -0700, Hans Reiser wrote:
> =20
>
>>What Vladimir failed to say was that it is our recent changes to
>>accomodate the kernel maintainers that are unstable, we had previously
>>reached the point where none of our internal tests could make it crash.=20
>>I hope that he did not put these unstable changes on our website for
>>users to see them without special notes....
>>   =20
>>
>
>This is probably still true for performance as well, yes?
>
>I haven't been testing Reiser4 for too long, I just set up a 32-bit
>chroot and chose Reiser4 for it so I may be able to resume my
>freelance-toying with it. If I can arrange more spare time.
>
>Any suggestions for performance/latency benchmark suites, preferrably
>automated, are welcome, of course ;)
>
> =20
>
Something is currently making our performance erratic for multiple
streams of IO.
