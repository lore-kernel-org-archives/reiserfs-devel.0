From: Newsmail <newsmail@satimex.tvnet.hu>
Subject: Re: ReiserFS is not suitable for a root FS.
Date: Wed, 21 May 2003 23:09:33 +0100
Message-ID: <5.2.0.9.2.20030521230520.034e0eb8@pop.tvnet.hu>
References: <3EC6247C.4030605@gmx.net>
 <200305172030.58775.russell@coker.com.au>
 <3EC61987.5000402@gmx.net>
 <200305172125.59713.russell@coker.com.au>
 <3EC6247C.4030605@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14193-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030517121038.GA929@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

I did not saw any deadlocks or corruptions since 2.4.21-rc1, on 2.4.20 in 
the old times I was not able to reproduce any problems with crypto 
loop/reiserfs in testing environments, but they happened on production long 
up/highly fragmented systems. hopefully they are gone with 2.4.21-rc1
regards,
greg

>BTW, were there any news on "reiserfs corruptions on crypto loop mounted 
>devices" tests with 2.4.21-rc2?
>
>Thank you.
>
>Bye,
>     Oleg


