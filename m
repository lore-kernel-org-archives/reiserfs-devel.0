From: Vince <fuzzy77@free.fr>
Subject: Re: status of grub reiser4 support ?
Date: Mon, 15 Mar 2004 21:43:47 +0100
Message-ID: <40561583.8050705@free.fr>
References: <405597B6.1000906@free.fr> <200403151715.50569.vitaly@namesys.com> <4055DF50.4030105@free.fr> <40560FF4.6050600@free.fr> <40561487.5070503@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17230-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40561487.5070503@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

BTW, I've checked and the problem here is:

(gdb) print place->plug
$1 = (reiser4_plug_t *) 0x0


Vince wrote:
> Debugging symbols in libreiser4 (0.5.1) gave me:
> 
> Program received signal SIGSEGV, Segmentation fault.
> 0x0806204a in reiser4_item_units (place=0x400801ac) at item.c:14
> 14              if (place->plug->o.item_ops->balance->units) {
> 
