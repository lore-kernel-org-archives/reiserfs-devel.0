From: Pierre Abbat <phma@webjockey.net>
Subject: Re: help recover filesystem corrupted by failing ide controller
Date: Fri, 14 Mar 2003 21:43:58 -0500
Message-ID: <200303142143.58096.phma@webjockey.net>
References: <200303141942.00679.phma@webjockey.net> <3E728FFB.90905@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13268-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E728FFB.90905@mb.tu-ilmenau.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list <reiserfs-list@namesys.com>

On Friday 14 March 2003 21:29, Manuel Krause wrote:
> If you already did a --rebuild-tree with that _old_ (~2years!!!)
> reiserfsck I pray you have a backup somewhere.

If I couldn't cat a single file without the cat hanging, how could I make a 
backup?

> Try the latest -pre-release
> ftp://ftp.namesys.com/pub/reiserfsprogs/pre/reiserfsprogs-3.6.5-pre2.tar.gz
>
> that is said to have some bug fixes against the latest reiserfsprogs
> release
> ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.4.tar.gz
>
> and a plus of performance and this release link is only given in case
> you believe in release numbering itself.

I have 3.6.4 on this laptop. I can modify the spell and recast it. Is it OK to 
copy the binary to the other box (they're both AMD processors) and run it? 
(The laptop is running Source Mage, the box with the trashed filesystem is 
running Mandrake.)

