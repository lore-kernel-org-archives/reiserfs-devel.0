From: Hans Reiser <reiser@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Wed, 21 Sep 2005 15:07:19 -0700
Message-ID: <4331D997.70603@namesys.com>
References: <200509201542.j8KFgh2q011730@laptop11.inf.utfsm.cl>	<43304AF2.8080404@namesys.com>	<17200.21620.684685.966054@gargle.gargle.HOWL>	<4331CDC2.1080300@namesys.com> <17201.53892.148162.340378@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26222-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17201.53892.148162.340378@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <nikita@clusterfs.com>
Cc: Nick Piggin <nickpiggin@yahoo.com.au>, Alan Cox <alan@lxorguk.ukuu.org.uk>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Nate Diller <ndiller@namesys.com>

Nikita Danilov wrote:

>Hans Reiser writes:
>
>[...]
>
> > >
> > Yes, and one can compensate for them  fairly cleanly.  I can't say more
> > without the customer releasing the code first.
>
>That's the point: text-book algorithms are usually useless as is. They
>need adjustments and changes to work in real life.
>
>Nikita.
>
>
>  
>
Yes, but you want to understand the textbook algorithms first before you
tweak. If you don't understand why least block number first is inferior
to real elevator.....

There is value to reading the classics of literature, even though they
are always simplistic compared to real life.

Hans
