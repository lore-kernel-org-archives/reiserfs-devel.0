From: Oleg Drokin <green@namesys.com>
Subject: Re: Simple preformance test
Date: Thu, 11 Apr 2002 18:27:35 +0400
Message-ID: <20020411182735.A2081@namesys.com>
References: <Pine.LNX.4.44.0204111506300.2077-100000@magic.vamo.orbitel.bg> <20020411165627.A992@namesys.com> <3CB598A3.483349D2@vamo.orbitel.bg> <3CB59D53.2060503@priocom.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10036-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3CB59D53.2060503@priocom.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yura Umanets <umanets@priocom.com>
Cc: Ivan Ivanov <ivandi@vamo.orbitel.bg>, reiserfs-list@namesys.com

Hello!

On Thu, Apr 11, 2002 at 05:27:31PM +0300, Yura Umanets wrote:

> Besides, I think you didn't use "smart" block alocation technics in your 
> tests and the all ppl know, that performance degradates because of 
> bitmap when used space grows up.
> Oleg, is this correct?
No, For this kind of test this is not true in fact.
What is done is we continuosly allocate blocks until we can
Then we free blocks.
There is no situation where we free some blocks, then allocate again and so on.
So no fragmentation, free space is not fragmented either.
So no slowdown on nearly full disk.
But there is no speedups either. Adn what we see in published numers is simply
script/benchmark error that should be ignored at least.

Bye,
    Oleg
