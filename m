From: The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Tue, 30 Mar 2004 19:07:39 -0800 (PST)
Message-ID: <200403310307.i2V37dxe008182@sirius.cs.pdx.edu>
References: <87hdw5vifk.fsf@uhoreg.ca>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17609-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87hdw5vifk.fsf@uhoreg.ca> from "Hubert Chan" at Mar 30, 2004 09:50:23 PM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> From: Hubert Chan <hubert@uhoreg.ca>
> 
> >>>>> "Christian" == Christian Mayrhuber <christian.mayrhuber@gmx.net> writes:
> 
> Christian> What about introducing an separator for meta information,
> Christian> like it is / for directories.  This separator could be turned
> Christian> into a mount option to avoid breakage of some apps.
> 
> Christian> My suggestion is "@" to become the default separator, because
> Christian> XPath uses it for attributes and it is THE accepted standard
> Christian> so far.  Filesystems are just a new domain. ...
> 
> That effectively kills all filenames that contain @, much worse than
> just a "metas" conflict IMHO.

Which draws the question of which is worse to lose/more important to
preserve?

One possibility would be to use a character shells tend to grab and are
therefore extremely uncommon in filenames. The ones that come to mind
are ! & and \, perhaps it is a matter of tweaking the EvilOS folks, but
\ seems like a viable option. Failing that, I suspect & is also a
reasonable option as well.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \   (    |         EHeM@cs.pdx.edu      PGP 8881EF59         |    )   /
  \_  \   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
    \___\_|_/82 04 A1 3C C7 B1 37 2A*E3 6E 84 DA 97 4C 40 E6\_|_/___/


