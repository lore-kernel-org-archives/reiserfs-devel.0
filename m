From: Ookhoi <ookhoi@humilis.net>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 14:06:27 +0100
Message-ID: <20030228140627.I24291@humilis>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281448.20572.liviu.voicu@huji.ac.il> <20030228135605.F24291@humilis> <200302281500.37328.liviu.voicu@huji.ac.il>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13000-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200302281500.37328.liviu.voicu@huji.ac.il>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Voicu Liviu <liviu.voicu@huji.ac.il>
Cc: ookhoi@humilis.net, reiserfs-list@namesys.com

Voicu Liviu wrote (ao):
> > In your case, there is no reason to renice the compile to -10, as
> > there are no other processes which take cpu, and therefore there is
> > nothing to gain.
> 
> This is CORRECT, but think, could I use XFree while some preccese has
> nice value -10? I don't think so

You should be able to. But is your X also -10 ?
You said you had problem with that too, but that is really weird as X
would not want 100% cpu.

In an other mail you write that your compiles are very fast. If a new
kernel doesn't solve your problem, and compiles are very fast anyway, I
would say: don't do that then (the renice to -10), or renice to -5 or
some value which does not bother you.

I'm quite sure this is not reiserfs related in any way. Just convert
your p300 to reiserfs and see what happens.
