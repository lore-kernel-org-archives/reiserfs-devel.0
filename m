From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: fsck.reiser4 can't fix 1 fixable corruption
Date: Wed, 21 Apr 2004 12:11:07 +0300
Message-ID: <200404211211.07424.rmeijer@internet.gr>
References: <200404201733.51809.rmeijer@internet.gr> <200404211255.41388.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18105-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404211255.41388.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wed 21 April 2004 11:55, Vitaly Fertman wrote:

Hi Vitaly,

Thanks for your reply!

> would you try this patch, it should fix the problem,
> email me about the result please.

I got several rejects:

patching file librepair/repair.c
Reversed (or previously applied) patch detected!  Assume -R? [n]
Apply anyway? [n]
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file librepair/repair.c.rej
patching file plugin/key/key_large/key_large.c
Hunk #2 FAILED at 295.
1 out of 2 hunks FAILED -- saving rejects to file 
plugin/key/key_large/key_large.c.rej
patching file plugin/key/key_short/key_short.c
Reversed (or previously applied) patch detected!  Assume -R? [n]
Apply anyway? [n]
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file 
plugin/key/key_short/key_short.c.rej
patching file plugin/object/dir40/dir40.c
Hunk #1 succeeded at 488 (offset 12 lines).
Hunk #2 succeeded at 579 (offset 12 lines).
patching file plugin/object/dir40/dir40_repair.c
patching file plugin/object/obj40/obj40.c
patching file plugin/object/obj40/obj40.h
patching file plugin/object/obj40/obj40_repair.c
patching file plugin/object/reg40/reg40.c
patching file plugin/object/reg40/reg40_repair.c
patching file plugin/object/spl40/spl40.c
patching file plugin/object/spl40/spl40_repair.c
patching file plugin/object/sym40/sym40.c
patching file plugin/object/sym40/sym40_repair.c

> > P.S. How about all these spelling errors in fsck's output? ;)

> all spelling fixes are appreciated :)

I'll let you know :)


Cheers,

Ray
