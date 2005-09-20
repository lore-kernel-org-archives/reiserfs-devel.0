From: Nick Piggin <nickpiggin@yahoo.com.au>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 14:16:30 +1000
Message-ID: <432F8D1E.7060300@yahoo.com.au>
References: <432AFB44.9060707@namesys.com>	 <200509171415.50454.vda@ilport.com.ua>	 <200509180934.50789.chriswhite@gentoo.org>	 <200509181321.23211.vda@ilport.com.ua>	 <20050918102658.GB22210@infradead.org>	 <b14e81f0050918102254146224@mail.gmail.com> <1127079524.8932.21.camel@localhost.localdomain> <432E4786.7010001@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26109-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <432E4786.7010001@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser wrote:

>So why is the code in the kernel so hard to read then?
>
>Linux kernel code is getting better, and Andrew Morton's code is
>especially good, but for the most part it's unnecessarily hard to read. 
>Look at the elevator code for instance.  Ugh.
>
>

What's wrong with the elevator code?

The elevator code was one of the first things I got involved with
as a complete kernel newbie, and I was able to follow the current
code well enough to make a new IO scheduler, and extend the
elevator API sufficiently to provide the fairly unique
capabilities I needed.

If it is the elevator *API* you are worried about, that is fairly
trivial and well documented by Jens and myself in
Documentation/block/biodoc.txt, along with an overview of some key
ideas useful for iosched implementors.

as-iosched.c itself is IMO reasonably well commented (at least
the non-trivial, non-boilerplate functions). That is not to say it
is trivial to understand because it is a fairly complex state
machine and heuristics, but at less than 2000 lines of very well
contained code it is not an impossible task to understand it.

If that is too much for you, noop-iosched.c implements a fully
working io scheduler in exactly 94 lines, including whitespace and
comments.

What are your specific concerns? I would be interested in helping
to fix any valid ones you have.

Thanks,
Nick


Send instant messages to your online friends http://au.messenger.yahoo.com 

