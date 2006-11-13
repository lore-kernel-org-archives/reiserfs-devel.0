From: "Danny Milosavljevic" <danny_milo@yahoo.com>
Subject: Re: Which version will be merged into mainline kernel?
Date: Mon, 13 Nov 2006 21:17:38 +0000 (UTC)
Message-ID: <ejandi$dgm$1@sea.gmane.org>
References: <194f62550610160250u265ef120lee3cf9a17266939f@mail.gmail.com>
	<454A596F.8070909@namesys.com>
	<194f62550611072321j1cd34205u55f3c121dcac7aac@mail.gmail.com>
	<200611081015.14320.biscani@pd.astro.it>
	<20061108102136.GS6012@schatzie.adilger.int> <ej4pca$tft$1@sea.gmane.org>
	<4557E254.5060404@netvigator.com> <45582353.3070709@slaphack.com>
	<45583C43.5070904@netvigator.com>
Reply-To: danny.milo@scratchpost.org
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30150-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

On Mon, 13 Nov 2006 17:34:59 +0800, Christopher Chan wrote:

> David Masover wrote:
>> Christopher Chan wrote:
> [...smartdrv...]

Yeah, smartdrv was nice :)

[...]
> Try arguing why you lost thousands of mails when the box crashed and 
> justifying it.

Oh. Good point.

So the bad case is:
1. mails are tiny
2. RAM cache is big
3. cache doesn't get flushed to disk for 1000s of mails
4. crash happens seldomly, but severely :)
-> 1000s of mail lost by the crash

Now I see :)

cheers,
  Danny

