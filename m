From: Newsmail <newsmail@satimex.tvnet.hu>
Subject: Re: big problem with loop-aes and reiserfs partitions
Date: Mon, 23 Dec 2002 13:47:36 +0100
Message-ID: <5.2.0.9.2.20021223133707.00b8f9c0@pop.tvnet.hu>
References: <5.2.0.9.2.20021222221057.01cfeb90@pop.tvnet.hu>
 <5.2.0.9.2.20021222221057.01cfeb90@pop.tvnet.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12210-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021223101843.A21249@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Yep, sorry I should have reported it back at that time :~
Well the huge amount isnt really 'huge' compared to the partition size. I=20
copied 1 gig of data, composed of + - big files(10-60megs each) on/to a=20
partition of size like 300gigs.
regards,
greg
At 08:18 2002. 12. 23.ist=E1', you wrote:
>Hello!
>
>On Sun, Dec 22, 2002 at 10:21:37PM +0100, Newsmail wrote:
> > when I was using 2.4.19 I had no problem at all. when Oleg introduced=
 the
> > new block allocation algorithm in 2.4.20-preX I tried it out and I got=
 the
> > same problems that I'm having now with 2.4.20 final. In the 2.4.20-preX
>
>Too bad you have not reported it back then.
>
> > the same results. so the problem is: when I'm copying huge amount of=
 data
> > on the encrypted filesystem first ssh seems to hang, I reconnect and the
>
>How much is this "huge"? Can it be compared in size with total fs capacity?
>Is it one file of that size or is it lots of files of smaller size?
>
> > of this clear reboot is impossible, I have to make a cold reboot. I'm=
 sure
> > that drives doesnt have a problem at all, hardware is in good=20
> condition. In
> > the past I was able to reproduce those problems on more than one=
 machines,
> > I'm sure I could do this this time, or that you will be able too :) or I
> > hope so.
>
>I am going to try and reproduce it now. If I won;t be able to, I will
>ask more questions.
>
>Bye,
>     Oleg


