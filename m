From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Reiser4/2.6.11 dbench hang
Date: Fri, 01 Apr 2005 21:30:15 +0200
Message-ID: <424DA147.2020903@gmx.net>
References: <4249D57F.8020809@gmx.net>	 <1112188350.4761.671.camel@tribesman.namesys.com>	 <424B0A4F.8010809@gmx.net>	 <1112219882.4650.759.camel@tribesman.namesys.com>	 <424B299E.5020805@gmx.net> <1112290038.22814.10.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23752-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1112290038.22814.10.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

Vladimir Saveliev schrieb:
> 
> This problem is fixed, but running your test during several hours caused
> reiser4 crash. It just happened, so, tomorrow I will take a look at it.
> 

I was able to deadlock kernel 2.6.11 + reiser4-for-2.6.11-3.patch.gz
+ elevator=cfq.
This time it happend during the first dbench-3.02 run with 90 clients in 
the cleanup phase of the benchmark.
Maybe the reproduction of the deadlock is easier when using the cfq
io scheduler.

No fs corruption reported by fsck.reiser4 after a cold reboot :-)

-- 
lg, Chris
