From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 plugins
Date: Tue, 28 Jun 2005 15:15:14 -0500
Message-ID: <42C1AFD2.3060609@slaphack.com>
References: <42BB7B32.4010100@slaphack.com>	 <200506240334.j5O3YowB008100@laptop11.inf.utfsm.cl>	 <20050627092138.GD11013@nysv.org> <20050627124255.GB6280@thunk.org>	 <42C0578F.7030608@namesys.com> <42C05F16.5000804@xfs.org>	 <20050627202841.GA27805@thunk.org> <42C06873.7020102@xfs.org>	 <42C0868E.4080003@punnoor.de> <42C09C91.6000901@namesys.com> <e692861c050627181060527e21@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24776-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c050627181060527e21@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gregory Maxwell <gmaxwell@gmail.com>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Gregory Maxwell wrote:
> On 6/27/05, Hans Reiser <reiser@namesys.com> wrote:
> 
>>>. But nevertheless it didn't survive, as like V3, with time V4 became
>>>slower and slower. In this case no year was needed, but just one month or
>>>alike. So end of test...but in fact I'll give V4 another go in the near future.
>>
>>Interesting that it got slower with time.  It sounds like our online
>>repacker is much needed.  It will be a priority for after the kernel merge.
> 
> 
> Whered it go, I recall it being activated with:
> echo 1 >/sys/fs/reiser4/*/repacker/start

That proved to be unstable (on my box, the repacker never finished) and
there was also some talk of making it only available commercially --
that is, pay some amount based on how much storage you're using it on,
get the repacker.

I like open source better, but whatever amount was proposed is more than
fair for me, especially considering how fast stuff is even without the
repacker.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQsGv0XgHNmZLgCUhAQKluQ/+Pjg6h5qUpO/6pG7v8ku2OhyUoR6aneTb
FlqjaqNuxqKaT/C3iqZYLZ+YUk+MYdXKUYNthdlY9ZtaPNwnp34/AHUSLtU4Imgw
Z4kIn3csKCkpeLRQMJ1o5nRSBwa+38Ta17ktYhn7L+ln53/ElULbPrmxjoSmA+SK
ocjkVcUI8azJJosD1Y0tb5BSVa9PC+buPOgbkinvFVeme2ouwG+tAeAMECShface
0FbT1+Ai//S/t5rz/oz6BzlV+K7Jl+8OopFs9MnwD8Gqh21zeGiawLQGsDwvZuEt
wJq73Y6b573RVJUy4dHAUqBZen0gar1GPWS2RpB3RwIYgb7/Ui3Rf5t//vTrZMNo
Ej9R3AXcU82M8YHHmwr1QJfhrt7kddXPw5TSpA66RWNJdeFxoaXxja6sFFjQbSTs
G5BHy2P/oHO8+uhbS+NI8T1N8KsrRrhJWr0pcjhHaoDogGdUj7TZtB+fANgLHbdV
GstRVz8QvKGOZ8FrX/mMPzsfUbRx3pq+C/FJzSgqVI/4oTc/XIOS7cb92EC+1WrO
KhYI3vy1zeKximboJXrPlr7QXkakjoOSFNH/MVzmF3sP1pe92hey7SXrpfgrOCOa
8gVo0u1tE98fuatl3MA8t3OGXGM5JXKpHVk/FiQt4358wAMmyDizvOeZ3GL1CA/M
ixjK/caPrP0=
=LFCF
-----END PGP SIGNATURE-----
