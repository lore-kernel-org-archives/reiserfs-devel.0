From: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>
Subject: Re: ReiserFS problems
Date: Wed, 6 Aug 2003 20:22:52 +0200
Message-ID: <20030806202252.A1940@bitwizard.nl>
References: <20030806182055.A28562@bitwizard.nl> <20030806164852.GA14719@namesys.com> <20030806192227.B31496@bitwizard.nl> <200308062201.15385.vitaly@namesys.com> <20030806201405.A1357@bitwizard.nl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15192-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030806201405.A1357@bitwizard.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: Vitaly Fertman <vitaly@namesys.com>, Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

On Wed, Aug 06, 2003 at 08:14:05PM +0200, Rogier Wolff wrote:
> You can verify on 
> 
> 	http://www.bitwizard.nl/io_throughput.gif
> 
> that (almost) no data was written throughout the first pass.

It seems to have dropped into a different pass again: throughput has
dropped to just over 300k per second.

Should I feel comfortable if it's finding formatting errors all over
the place?:

  entry [x y] "ZZZ" in directory [a b] is not formatted properly -- fixed. 

(usually x == 2, a,b == 1,2 .)

Tip: 

Only list the file/directory that's being worked upon when explicitly
requested. When not explicitly requested, set an alarm handler to
print it every second (or so). Lots of time is now spent in writing to
the screen. (It's consumed over an hour of CPU time by now...)

		Roger. 


-- 
+-- Rogier Wolff -- www.harddisk-recovery.nl -- 0800 220 20 20 --
| Files foetsie, bestanden kwijt, alle data weg?!
| Blijf kalm en neem contact op met Harddisk-recovery.nl!
