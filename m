From: Sander <sander@humilis.net>
Subject: Re: Reoccuring corruption problem
Date: Thu, 19 Aug 2004 21:42:22 +0200
Message-ID: <20040819194222.GC29745@favonius>
References: <200408192046.27223.zyrax@home.se>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20412-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200408192046.27223.zyrax@home.se>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Nilsson <zyrax@home.se>
Cc: reiserfs-list@namesys.com

Dan Nilsson wrote (ao):
> Typical corruptions i get:
> 
> "ruby-progressbar" becomes "ruby-pr?gressbar"
> "ruby-zlib"        becomes "ruby-zlyb"

> I have run badblocks and memtest and they have come up with nothing.

Sounds like bad memory nevertheless. Can you try memtest86 for at least
24 hours?
