From: Redeeman <redeeman@metanurb.dk>
Subject: Re: hmm, dependencies
Date: Fri, 17 Dec 2004 16:22:50 +0100
Message-ID: <1103296970.12405.0.camel@localhost>
References: <1103226970.704.1.camel@localhost>
	 <1103291711.3589.32.camel@tribesman.namesys.com>
Reply-To: redeeman@metanurb.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22813-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1103291711.3589.32.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

On Fri, 2004-12-17 at 16:55 +0300, Vladimir Saveliev wrote:
> Hello
> 
> On Thu, 2004-12-16 at 22:56, Redeeman wrote:
> > hello.. reiser4 is now in mm, but i realize that nearly all of the stuff
> > that was mm specific when the move to mm was made, are probably merged
> > into upstream by now, i wonder, can anyone tell me exactly what from mm
> > it depends on?
> > 
> > thanks
> > 
> 
> reiser4 got included into mm not because it needed something of it, but
> rather because it is supposed that being in mm for certain amount of
> time reiser4 will get a lot of testing and will prove that it is worth
> to get included into stock kernel. 
im aware, however, the reiser4 patches in mm are against mm, which means
it depends on something from it, and i'd like to find out what :D so
that i can take it out and apply to vanilla along with reiser4
> 
> 
-- 
Redeeman <redeeman@metanurb.dk>

