From: Ookhoi <ookhoi@humilis.net>
Subject: Re: kernel go-slow
Date: Mon, 3 Feb 2003 05:53:01 +0100
Message-ID: <20030203055301.X2964@humilis>
References: <200302030027.40936.russell@coker.com.au>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12610-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200302030027.40936.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell Coker <russell@coker.com.au>
Cc: ReiserFS <reiserfs-list@namesys.com>

Russell Coker wrote (ao):
> I'm running a number of machines with 2.4.20 and the ReiserFS journal
> patches.
>
> One problem that has started occuring is that periodically some of the
> machines will go really slow for a while. It's as if the CPU speed has
> just dropped to 1% of it's regular speed. Then after 10 minutes or so
> it will continue as normal.
>
> Has anyone heard of such things before?

It seems there is a 'bug' in 2.4.20 which causes the stall. (don't know
the details, but you're not the only one).

Maybe a -pre fixes it, though in your case I would wait for .21 I think.
