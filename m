From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Bug report with its cancellation?
Date: Mon, 5 Jul 2004 12:02:32 +0300
Message-ID: <20040705090232.GW4990@nysv.org>
References: <20040704172135.GR4990@nysv.org> <200407050010.22574.henning-04@die.informatik.uni-siegen.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19509-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200407050010.22574.henning-04@die.informatik.uni-siegen.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Cc: reiserfs-list@namesys.com

On Mon, Jul 05, 2004 at 12:10:22AM +0200, Henning Westerholt wrote:
>access to a reiser4 partition produce a kernel oops, something about an 
>assertion error.

This seems highly irratic, as I seem to recall I only had a null
pointer dereference and paging oops...

>My kernel source has also the mentioned static variable. I'll try tomorow to 
>remove the static definition. Perhaps it makes a difference..

With any luck it will be automagicated in the next auto-snapshot :)

I ran some benchmarks with bonnie++ and slow.c on the 2004.07.02 after
I had it working and it was blazingly fast.

Things look good on this front again, keep up the good work :)

-- 
mjt

