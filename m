From: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>
Subject: Re: ReiserFS problems
Date: Thu, 7 Aug 2003 15:46:27 +0200
Message-ID: <20030807154627.C7165@bitwizard.nl>
References: <20030806182055.A28562@bitwizard.nl> <20030806164852.GA14719@namesys.com> <20030806192227.B31496@bitwizard.nl> <200308062201.15385.vitaly@namesys.com> <20030806201405.A1357@bitwizard.nl> <20030806202252.A1940@bitwizard.nl> <3F325597.30209@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15231-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F325597.30209@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Vitaly Fertman <vitaly@namesys.com>, Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

On Thu, Aug 07, 2003 at 05:35:19PM +0400, Hans Reiser wrote:
> Rogier Wolff wrote:
> >Only list the file/directory that's being worked upon when explicitly
> >requested. When not explicitly requested, set an alarm handler to
> >print it every second (or so). Lots of time is now spent in writing to
> >the screen. (It's consumed over an hour of CPU time by now...)

> good point.  Vitaly, do this unless you have a reason not to.

FYI: A "reason not to" would be if you "frequently" get crashes in the
program that get the location misreported because the last line it
printed ends up being quite wrong.

			Roger.

-- 
+-- Rogier Wolff -- www.harddisk-recovery.nl -- 0800 220 20 20 --
| Files foetsie, bestanden kwijt, alle data weg?!
| Blijf kalm en neem contact op met Harddisk-recovery.nl!
