From: Zhihui Zhang <bf20761@binghamton.edu>
Subject: tail policy question
Date: Wed, 12 Nov 2003 18:23:01 -0500 (EST)
Message-ID: <Pine.GSO.4.58.0311121737100.9552@bingsun2.cc.binghamton.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16065-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

I spent a little time on Reiser4 tail code and was surprised to find out
that the default policy given in reiser4.h is ALWAYS_TAIL_ID not
DEFAULT_TAIL_ID.

/* default tail policy plugin */
#define REISER4_TAIL_PLUGIN       (ALWAYS_TAIL_ID)

Does this mean Reiser4 always use tails no matter how large a file is by
default?  I must be wrong somewhere.

Anyway, when tails are in use, will they incur more or less performance
penalty on files using them when compared to ReiserFS V3 (remember that
-notail mount option is sometimes preferred)?  Also, does the offset part
of a key for a tail item or an extent item refer to the byte offset of the
first byte represented by the tail or extent item?  In V3, I remember it
is actually byte offset plus one for some reason.  Please clarify this for
me.

Thanks

-Zhihui
