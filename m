From: Andrew Morton <akpm@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 16:32:25 -0700
Message-ID: <20040825163225.4441cfdd.akpm@osdl.org>
References: <20040824202521.GA26705@lst.de>
	<412CEE38.1080707@namesys.com>
	<20040825152805.45a1ce64.akpm@osdl.org>
	<112698263.20040826005146@tnonline.net>
	<Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org>
	<1453698131.20040826011935@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20540-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1453698131.20040826011935@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Spam <spam@tnonline.net>
Cc: torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Spam <spam@tnonline.net> wrote:
>
> > In other words, if reiserfs does something special, we should make 
> > standard interfaces for doing that special thing, so that everybody can
> > do it without stepping on other peoples toes.
> 
>   Agreed  that would be the best. But how much time and effort will it
>   be

Zero.

We can add these new features tomorrow, as reiser4-only features, with a
plan in hand to generalise them later.

-->>__if__<<-- we think these are features which Linux should offer.

