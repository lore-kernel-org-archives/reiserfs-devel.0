From: Ookhoi <ookhoi@humilis.net>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 14:13:16 +0100
Message-ID: <20030228141316.J24291@humilis>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281500.37328.liviu.voicu@huji.ac.il> <20030228140627.I24291@humilis> <200302281511.56997.liviu.voicu@huji.ac.il>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13003-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200302281511.56997.liviu.voicu@huji.ac.il>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Voicu Liviu <liviu.voicu@huji.ac.il>
Cc: ookhoi@humilis.net, reiserfs-list@namesys.com

Voicu Liviu wrote (ao):
> > kernel doesn't solve your problem, and compiles are very fast
> > anyway, I would say: don't do that then (the renice to -10), or
> > renice to -5 or some value which does not bother you.
> 
> I don't want to renice compilation threads, only X to get more
> responsives from it...but this locks me out :-)

So you say, if your box is idle, and you renice your X to -10, you can't
use X? And your input on the prompt is still very slow?

That would be very weird.

I asked you to take the latest 2.4 without patches, but please try the
latest 2.4 with the latest -pre patch. I'm curious to what that one will
bring.
