From: Cami <camis@mweb.co.za>
Subject: Re: Reiserfs, highquality meds source, low rates
Date: Tue, 20 Apr 2004 06:55:25 +0200
Message-ID: <4084AD3D.30808@mweb.co.za>
References: <000001c425b0$1750e0b8$4fa9aa0e@fluridden.com> <20040419115902.GD15007@alias.nmd.msu.ru> <20040419115902.GD15007@alias.nmd.msu.ru> <4083C0B0.6090607@mweb.co.za> <c61q1o$6bk$1@satsuki.furryterror.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18069-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <c61q1o$6bk$1@satsuki.furryterror.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

>>>i am just not sure how to kill THIS messages which look so....
>>>they dont look like spam, even to me upon first look.
>>
>>If you were using SpamAssasin, you wouldn't get these..
> 
> 
> I _am_ using SpamAssassin, and I got this.  


#!/bin/sh

cd /etc/mail/spamassassin
wget -nd -N http://www.rulesemporium.com/rules/99_sare_adult.cf
wget -nd -N 
http://www.rulesemporium.com/rules/99_sare_biz_market_learn_post25x.cf
wget -nd -N http://www.rulesemporium.com/rules/99_sare_fraud_post25x.cf
wget -nd -N http://www.rulesemporium.com/rules/99_sare_random.cf
wget -nd -N http://www.rulesemporium.com/rules/99_FVGT_Tripwire.cf
wget -nd -N http://www.rulesemporium.com/rules/99_OBFU_drugs.cf
wget -nd -N http://www.rulesemporium.com/rules/99_sare_spoof.cf
wget -nd -N http://www.rulesemporium.com/rules/antidrug.cf
wget -nd -N http://www.rulesemporium.com/rules/backhair.cf
wget -nd -N http://www.rulesemporium.com/rules/bigevil.cf
wget -nd -N http://www.rulesemporium.com/rules/bogus-virus-warnings.cf
wget -nd -N http://www.rulesemporium.com/rules/chickenpox.cf
wget -nd -N http://www.rulesemporium.com/rules/evilnumbers.cf
wget -nd -N http://www.rulesemporium.com/rules/header_abuse.cf
wget -nd -N http://www.rulesemporium.com/rules/mr_wiggly.cf
wget -nd -N http://www.rulesemporium.com/rules/ratware.cf
wget -nd -N http://www.rulesemporium.com/rules/weeds.cf

I update all the rulesets once a day.. These  are running
without any false positives on a rather large  production
environment so they will do well for the reiserfs mailing
list..

Cheers,
Cami

