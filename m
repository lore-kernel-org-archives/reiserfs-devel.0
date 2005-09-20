From: Nick Piggin <nickpiggin@yahoo.com.au>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 17:16:30 +1000
Message-ID: <1127200590.9436.15.camel@npiggin-nld.site>
References: <432AFB44.9060707@namesys.com>
	 <200509171415.50454.vda@ilport.com.ua>
	 <200509180934.50789.chriswhite@gentoo.org>
	 <200509181321.23211.vda@ilport.com.ua>
	 <20050918102658.GB22210@infradead.org>
	 <b14e81f0050918102254146224@mail.gmail.com>
	 <1127079524.8932.21.camel@localhost.localdomain>
	 <432E4786.7010001@namesys.com> <432F8D1E.7060300@yahoo.com.au>
	 <432FABFA.9010406@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932753AbVITHQ7@vger.kernel.org>
In-Reply-To: <432FABFA.9010406@namesys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, lkml <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Nate Diller <ndiller@namesys.com>

On Mon, 2005-09-19 at 23:28 -0700, Hans Reiser wrote:
> Nick Piggin wrote:

> > What's wrong with the elevator code?
> >
> The name for one.  There is no elevator algorithm anywhere in it.  There
> is a least block number first algorithm that was called an elevator, but

Well the terminology changed to "io scheduler" now, however the
residual "elevator" name found in places doesn't cause anyone
any problems and there isn't much reason to change it other than
the desire to break things.

> it does not have the properties described by Ousterhout and sundry CS
> textbooks describing elevator algorithms.  The textbook algorithms are
> better than least block number first, and it is interesting how nobody
> fixed the mislabeling of the algorithm once Linux had gotten to the
> point that it was striving for more than making gcc be able to run on it. 
> 

There is no least block number first io scheduler now. And the
deadline scheduler is basically an elevator algorithm with
deadlines.

> cfq is good code though for many usage patterns. 
> 

But that is not a true elevator algorithm either... so what are
you trying to say?

> I would say more, but I need to talk a customer into ok'ing releasing
> some code first, so I can only say what I knew before doing the work for
> that customer at this time.
> 
> If you would like many more details of coding/commenting inelegance, ask
> Nate Diller after the customer oks his talking about it, which will
> happen more easily if we say nothing that we did not know before the
> work for them until we first get their ok.....
> 

I happen to think that the "elevator code" is quite nice, the
block layer side, the interface itself, and the io schedulers
too. So I wouldn't fix up anything unless someone came to me
with an issue :)

Anyway, let's kill this subthread. I just don't think you proved
much of a point by picking a random kernel subsystem to point to,
whether such criticism was justified or not.

But if you really need to , I instead suggest badmouthing devfs.
That is sure to get you on the good side of the VFS guys! :)

Nick

-- 
SUSE Labs, Novell Inc.



Send instant messages to your online friends http://au.messenger.yahoo.com 
