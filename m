From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: hmm, dependencies
Date: Fri, 17 Dec 2004 16:55:12 +0300
Message-ID: <1103291711.3589.32.camel@tribesman.namesys.com>
References: <1103226970.704.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22811-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1103226970.704.1.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: redeeman@metanurb.dk
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

Hello

On Thu, 2004-12-16 at 22:56, Redeeman wrote:
> hello.. reiser4 is now in mm, but i realize that nearly all of the stuff
> that was mm specific when the move to mm was made, are probably merged
> into upstream by now, i wonder, can anyone tell me exactly what from mm
> it depends on?
> 
> thanks
> 

reiser4 got included into mm not because it needed something of it, but
rather because it is supposed that being in mm for certain amount of
time reiser4 will get a lot of testing and will prove that it is worth
to get included into stock kernel. 

