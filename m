From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: resize_reiserfs probs
Date: Mon, 23 Jun 2003 08:32:41 +0200
Message-ID: <3EF69F09.90404@gmx.net>
References: <200306230132.08812.harryrat@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14657-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306230132.08812.harryrat@gmx.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Harald Radke <harryrat@gmx.de>
Cc: reiserfs-list@namesys.com

Harald Radke wrote:

> now I wanted to resize the root partition (booted with discs, so it wasn't 
> mounted) from approx 9.5 to 9.2 GB.
> 
> however, resize_reiserfs stops with:
> 
> "resize_reiserfs: can't shrink fs; too many blocks already allocated"
> 
> strange, as partition has only approx. 1.6 GB data on it
> 
> Any hints?

I know this one very well. Please tell us the exact (including spaces)
command line you were using to resize it. I suspect user error here - at
least it was one when I got this error.

HTH,
Carl-Daniel
-- 
http://www.hailfinger.org/

