From: Christophe Saout <christophe@saout.de>
Subject: Re: Quota-patches for 2.4.20 conflict with evms (?)
Date: 12 Jun 2003 16:05:15 +0200
Message-ID: <1055426715.2486.0.camel@chtephan.cs.pocnet.net>
References: <1055425043.2059.6.camel@chtephan.cs.pocnet.net>
	 <9457.1055426074@www65.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14514-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <9457.1055426074@www65.gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lars Grobe <grobe@gmx.net>
Cc: reiserfs-list@namesys.com

Am Don, 2003-06-12 um 15.54 schrieb Lars Grobe:

> Clean 2.4.20
> +Patches:
> everything from
> ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing/quota-2.4.20
> diskmapper: 2.4.20-dm-10
> evms-2.0.1
> bonding-patches for 2.4
> 
> > If the only problem is in fs/buffer.c: [...]
> > change the DQUOT_SYNC to DQUOT_SYNC_DEV in this file.
> 
> Thank you, the kernel compiled with that! (I will know soon if it works,
> too...)

Ok, this should do it.

-- 
Christophe Saout <christophe@saout.de>

