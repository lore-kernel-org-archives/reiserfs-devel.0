From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: 2.6.7 reiser4 patch ?
Date: Mon, 5 Jul 2004 15:30:32 +0300
Message-ID: <20040705123032.GY4990@nysv.org>
References: <1089029792.7071.52.camel@localhost>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19513-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1089029792.7071.52.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikael Cluseau <nwrk@nwrk.dyndns.org>
Cc: reiserfs-list@namesys.com

On Mon, Jul 05, 2004 at 02:17:20PM +0200, Mikael Cluseau wrote:
>
>Is there a patch the *vanilla* Linux 2.6.7 kernel ?

Afaik no.

Last time something like this was tried, it resulted in random
freezings, and there I was not the only one affected.
Although it was an old snapshot.

The -mm tree is used because -mm stuff goes into mainline and
that's what the Reiser4 people are trying to accomplish...

There's nothing wrong with sticking to what Namesys gives :)

-- 
mjt

