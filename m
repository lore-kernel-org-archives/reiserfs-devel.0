From: Jens Axboe <axboe@suse.de>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 20:25:24 +0200
Message-ID: <20050920182523.GS10845@suse.de>
References: <200509201542.j8KFgh2q011730@laptop11.inf.utfsm.cl> <43304AF2.8080404@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26145-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <43304AF2.8080404@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Nick Piggin <nickpiggin@yahoo.com.au>, Alan Cox <alan@lxorguk.ukuu.org.uk>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Nate Diller <ndiller@namesys.com>

On Tue, Sep 20 2005, Hans Reiser wrote:
> Horst von Brand wrote:
> 
> >
> >
> >Funny that the "texbook algorithms" aren't used in real life. Wonder why...
> >  
> >
> Try BSD.  If the BSD book can be believed, they use"texbook algorithms".

Even the BSD people are looking for better algorithms. To be honest, I
think any OS using the classic elevator sort is a joke. It's only really
suited for batch processing.

-- 
Jens Axboe

