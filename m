From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck --rebuild-tree fails
Date: Mon, 8 Jul 2002 19:06:48 +0400
Message-ID: <20020708190648.A910@namesys.com>
References: <20020708153140.A2245@namesys.com> <Pine.LNX.4.44.0207081754530.854-100000@dino.oblik.dp.ua>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10927-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0207081754530.854-100000@dino.oblik.dp.ua>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Yurick A. Zaitsev" <yurick@oblik.dp.ua>
Cc: reiserfs-list@namesys.com, vitaly@namesys.com

Hello!

On Mon, Jul 08, 2002 at 06:00:45PM +0300, Yurick A. Zaitsev wrote:

> OD> >    Pass 1 (will try to insert 21881 leaves):
> OD> >    ####### Pass 1 #######
> OD> >    Looking for allocable blocks .. ok
> OD> >    0%.build_the_tree: nothing but leaves are expected. Block 9938 - ??
> OD> >    ...20%....40%....
> OD> >    mark_block_used: (448579) used already
> OD> This one is very clear sign of broken memory or broken data exchange between
> OD> HDD and the box itself.
> OD> Try changing IDE cable/replacing memory/putting the HDD into other box.
>     Thank you, I've tried other box and it helps. I am believe in reiserfs
> again! :)
>     Wouldn't be better to add advice about possible broken hardware to
> reiserfsck when it prints such message?

Yes, this is nice idea. Thanks.

Bye,
    Oleg
