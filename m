From: Fuzzy <fuzzy77@free.fr>
Subject: Re: Snapshot against 2.6.1 released [someone has a patch against
 -mm4 ?]
Date: Mon, 19 Jan 2004 17:11:17 +0100
Message-ID: <400C01A5.5060209@free.fr>
References: <16395.60465.989777.981597@laputa.namesys.com> <400BF982.2050407@free.fr> <20040119155649.GK1748@srv-lnx2600.matchmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16567-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040119155649.GK1748@srv-lnx2600.matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: reiserfs-list@namesys.com


> On Mon, Jan 19, 2004 at 04:36:34PM +0100, Fuzzy wrote:
> 
>>Is there any chance that namesys will also provide a patch against the 
>>-mm tree ? Or even better: is there already a timeline for integration 
>>of reiser4 in -mm ?

Mike Fedyk wrote:

> Well, if I were them, I wouldn't.
> 
> Right now the -mm tree has some stuff that's just waiting for 2.7, or is in
> initial testing/merging into stock 2.6.
> 
> You really should be testing against stock 2.6 with the reiser4 filesystem
> so that you don't get hit by one of the (600 in 2.6.1-mm4) patches in the
> -mm series.
> 
> That way, you can help spot bugs better, and reiser4 will be merged into -mm
> sooner so you'll be happy. :)

I would agree with you but:

  1) the people who would run an experimental filesystem like reiser4 
are very likely to also run with the -mm kernel tree (as is my case at 
least...)
  2) from what I've read, reiser4 should be integrated in -mm before it 
can ever think about going in mainline... so why not play with it in -mm 
now ?

Vince
