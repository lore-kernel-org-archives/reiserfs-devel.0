From: The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Tue, 30 Mar 2004 22:20:07 -0800 (PST)
Message-ID: <200403310620.i2V6K7D9018881@sirius.cs.pdx.edu>
References: <87y8phtxk6.fsf@uhoreg.ca>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17612-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87y8phtxk6.fsf@uhoreg.ca> from "Hubert Chan" at Mar 31, 2004 12:06:33 AM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> From: Hubert Chan <hubert@uhoreg.ca>
> 
> >>>>> "The" == The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu> writes:
> 
> Elliott> One possibility would be to use a character shells tend to grab
> Elliott> and are therefore extremely uncommon in filenames. The ones
> Elliott> that come to mind are ! & and \, perhaps it is a matter of
> Elliott> tweaking the EvilOS folks, but \ seems like a viable
> Elliott> option. Failing that, I suspect & is also a reasonable option
> Elliott> as well.
> 
> But if the shell grabs it, that makes it even more painful to access.
> We might as well just use ..metas, which is very unlikely to conflict.
> Also, those uncommon characters you mention (except probably \) won't
> be that uncommon, especially with GUIs becoming a more common
> file-management method, and Linux being more accessible to
> non-techies.  Heck, even *I've* named some files with *spaces* in the
> name!  And I've been capitalizing some filenames!

But how often do you need to access meta information directly from a
shell? Most of the time it would be a GUI tool accessing the extra data,
do you normally need to use `file` before doing anything? Most of the
time you know that a file called "Pokemon" is something you're not going
to access with `vi`, so would you need the filetype meta data before
dealing with it?

Though you do have a point that the GUI tools filenames with '&' or '!'
becomes more common. '\' does have the advantage of simply needing to by
typed twice (rather than one key followed by shift-number combo). Useful
if you need to tell the tell the GUI what the file actually is.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \   (    |         EHeM@cs.pdx.edu      PGP 8881EF59         |    )   /
  \_  \   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
    \___\_|_/82 04 A1 3C C7 B1 37 2A*E3 6E 84 DA 97 4C 40 E6\_|_/___/


