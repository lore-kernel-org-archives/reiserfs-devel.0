From: "Mark Stier" <kalium@gmx.de>
Subject: Re: Master file/metadata table? dualistic trees?
Date: Tue, 21 Jun 2005 17:40:54 +0200 (MEST)
Message-ID: <5008.1119368454@www33.gmx.net>
References: <42B6F19B.8040300@namesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24430-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

> You can just change the key assignment algorithm for stat data, and
> achieve the desired effect.  Just assign keys such that all stat data
> and directory entries have keys that are less than all file bodies.

Ok, I have done that by adding a Plan-R(SYNC) to key.h's keycmp routine: it
changes the field ordering to type->locality->... .

But how do I make mkfs.reiser4 respect that change in the kernel source
code?

Best regards,
Mark

-- 
Geschenkt: 3 Monate GMX ProMail gratis + 3 Ausgaben stern gratis
++ Jetzt anmelden & testen ++ http://www.gmx.net/de/go/promail ++
