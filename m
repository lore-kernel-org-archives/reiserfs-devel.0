From: Alexander Lyamin <flx@msu.ru>
Subject: Re:  Reiserfs, highquality meds source, low rates
Date: Wed, 21 Apr 2004 00:51:06 +0400
Message-ID: <20040420205106.GB27730@alias.nmd.msu.ru>
References: <000001c425b0$1750e0b8$4fa9aa0e@fluridden.com> <20040419115902.GD15007@alias.nmd.msu.ru> <20040419115902.GD15007@alias.nmd.msu.ru> <4083C0B0.6090607@mweb.co.za> <c61q1o$6bk$1@satsuki.furryterror.org> <4084AD3D.30808@mweb.co.za>
Reply-To: flx@msu.ru
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18091-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4084AD3D.30808@mweb.co.za>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cami <camis@mweb.co.za>
Cc: reiserfs-list@namesys.com

Tue, Apr 20, 2004 at 06:55:25AM +0200, Cami wrote:
> >>>i am just not sure how to kill THIS messages which look so....
> >>>they dont look like spam, even to me upon first look.
> >>
> >>If you were using SpamAssasin, you wouldn't get these..
> >
> >
> >I _am_ using SpamAssassin, and I got this.  
> 
> 
> #!/bin/sh
> 

thanks, ill check those, and if they are sane, we will adopt them.

> cd /etc/mail/spamassassin
> wget -nd -N http://www.rulesemporium.com/rules/99_sare_adult.cf
> wget -nd -N 
> http://www.rulesemporium.com/rules/99_sare_biz_market_learn_post25x.cf
> wget -nd -N http://www.rulesemporium.com/rules/99_sare_fraud_post25x.cf
> wget -nd -N http://www.rulesemporium.com/rules/99_sare_random.cf
> wget -nd -N http://www.rulesemporium.com/rules/99_FVGT_Tripwire.cf
> wget -nd -N http://www.rulesemporium.com/rules/99_OBFU_drugs.cf
> wget -nd -N http://www.rulesemporium.com/rules/99_sare_spoof.cf
> wget -nd -N http://www.rulesemporium.com/rules/antidrug.cf
> wget -nd -N http://www.rulesemporium.com/rules/backhair.cf
> wget -nd -N http://www.rulesemporium.com/rules/bigevil.cf
> wget -nd -N http://www.rulesemporium.com/rules/bogus-virus-warnings.cf
> wget -nd -N http://www.rulesemporium.com/rules/chickenpox.cf
> wget -nd -N http://www.rulesemporium.com/rules/evilnumbers.cf
> wget -nd -N http://www.rulesemporium.com/rules/header_abuse.cf
> wget -nd -N http://www.rulesemporium.com/rules/mr_wiggly.cf
> wget -nd -N http://www.rulesemporium.com/rules/ratware.cf
> wget -nd -N http://www.rulesemporium.com/rules/weeds.cf
> 
> I update all the rulesets once a day.. These  are running
> without any false positives on a rather large  production
> environment so they will do well for the reiserfs mailing
> list..
> 
> Cheers,
> Cami

-- 
"the liberation loophole will make it clear.."
lex lyamin
