From: Christopher Chan <chrisfz@netvigator.com>
Subject: Re: Which version will be merged into mainline kernel?
Date: Tue, 14 Nov 2006 13:54:03 +0800
Message-ID: <455959FB.6010707@netvigator.com>
References: <194f62550610160250u265ef120lee3cf9a17266939f@mail.gmail.com>	<454A596F.8070909@namesys.com>	<194f62550611072321j1cd34205u55f3c121dcac7aac@mail.gmail.com>	<200611081015.14320.biscani@pd.astro.it>	<20061108102136.GS6012@schatzie.adilger.int> <ej4pca$tft$1@sea.gmane.org>	<4557E254.5060404@netvigator.com> <45582353.3070709@slaphack.com>	<45583C43.5070904@netvigator.com> <ejandi$dgm$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30157-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ejandi$dgm$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: danny.milo@scratchpost.org, reiserfs-list@namesys.com


> So the bad case is:
> 1. mails are tiny
> 2. RAM cache is big
> 3. cache doesn't get flushed to disk for 1000s of mails
> 4. crash happens seldomly, but severely :)
> -> 1000s of mail lost by the crash
> 
> Now I see :)

:). So fsync/fsyncdata takes care of those rare crashes which is why 
mail servers should rarely lose mail. I say should because the journal 
mode available/used affects fsync/fsyncdata too.
