From: Zhihui Zhang <bf20761@binghamton.edu>
Subject: Re: tail policy question
Date: Thu, 13 Nov 2003 13:34:07 -0500 (EST)
Message-ID: <Pine.GSO.4.58.0311131322500.27178@bingsun2.cc.binghamton.edu>
References: <Pine.GSO.4.58.0311121737100.9552@bingsun2.cc.binghamton.edu>
 <3FB22E06.9070500@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16078-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FB22E06.9070500@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, vs@namesys.com


Thanks for your and Alex's reply.  I poke around a little bit more and
find out that the mkfs.c does use ITEM_TAIL40_ID, which happens to have
the same value as TAIL_ID (0x6) in the kernel file. However, I am confused
when I see the following in plugin.h:

PLUGIN_BY_ID(item_plugin, REISER4_ITEM_PLUGIN_TYPE, item);
PLUGIN_BY_ID(tail_plugin, REISER4_TAIL_PLUGIN_TYPE, tail);

The item plugin has TAIL_ID if the item is of tail type. So what is the
use of a separate tail_plugin?  Plus, the tail_plugin has three IDs
defined: NEVER, ALWAYS, and DEFAULT, none of which has a value of 0x6. My
guess is that the item plugin for tails are used to manage tails (merge,
split, read, write?), while the tail_plugin is used to decide if a
conversion between tail format and extent format is needed.  If so, the
reiser4.h file should have:

#define REISER4_TAIL_PLUGIN       (DEFAULT_TAIL_ID)

instead of

#define REISER4_TAIL_PLUGIN       (ALWAYS_TAIL_ID)

Does this make sense? Please clarify this for me.  Thanks.

-Zhihui

On Wed, 12 Nov 2003, Hans Reiser wrote:

> Zhihui Zhang wrote:
>
> >Hi,
> >
> >I spent a little time on Reiser4 tail code and was surprised to find out
> >that the default policy given in reiser4.h is ALWAYS_TAIL_ID not
> >DEFAULT_TAIL_ID.
> >
> >/* default tail policy plugin */
> >#define REISER4_TAIL_PLUGIN       (ALWAYS_TAIL_ID)
> >
> >Does this mean Reiser4 always use tails no matter how large a file is by
> >default?  I must be wrong somewhere.
> >
> >
> Umh,  we are often capable of incredible stupidity as a result of
> someone testing some setting and then checking it in by accident.  You
> want the default not the always.
>
> >Anyway, when tails are in use, will they incur more or less performance
> >penalty on files using them when compared to ReiserFS V3 (remember that
> >-notail mount option is sometimes preferred)?
> >
> It is not nearly that bad, but you want the default.
>
> I'll let Saveliev comment further.   Thanks for finding this.
>
>
>

-- 
