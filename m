From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Re: "Metas"
Date: Sat, 17 Apr 2004 23:31:50 -0400 (EDT)
Message-ID: <20040418033150.13937.qmail@web25003.mail.ukl.yahoo.com>
References: <40805B2D.6080300@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18026-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40805B2D.6080300@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

David Masover wrote: 

> As far as '...', since I haven't had an opinion yet
> -- I believe that a
> '...' would be nice, but the usage of '.' and '..'
> is so generic
> (current/parent dir) that we want to make sure '...'
> is just as generic
> and universally useful.  Otherwise, we may end up
> with things like
> '...................' in a few years.

Metadata is *more* fundamental than "." and "..",
because these latter concepts can be expressed as
metadata themselves (eg. one could implement "." and
".." as  ".../self" and ".../parent", respectively,
and maybe even ".../parents" for multiple parents).

> Also, I can't see ... as being any easier than
> ..metas (or, of course,
> .metas).  At the shell, it's typing "<dot> <dot>
> <dot>" instead of
> "<dot> m <tab>" or even "<dot> <dot> m <tab>". 

In order to save people from continuing to repeat
flawed arguments against "...", I would like to
attempt to summarize arguments for "..." that I have
seen thus far:

- ACCURATE LINGUISTIC MEANING.  In most, if not all,
written languages, an ellipsis ("...") means
"additional information"; in this case, additional
information about the directory.  Note that as an
ellipsis, dots do not represent "special characters";
the ellipsis is a linguistic construct, and natural
for non-technical users.

- ACCURATE UI MEANING.  Ellipsis is used universally
in GUIs to indicate the concept of "additional
information" (1), which applies here.

- ACCURATE *NIX MEANING.  Implies ".." (really hidden
system file) + "." (current directory): thus, taken
together,  "really hidden system stuff pertaining to
the current directory".  Taken together with the first
two points, this is _unbelievably_ elegant to me.

- VERY EASY TO TYPE (and easier than "metas", ".metas"
and "..metas").  Studies have conclusively shown (eg.
Fitts law) that the ease of an action increases
dramatically the less one's hand or fingers must be
moved to complete the action.  This means that
pressing the same key three times is easier than
pressing two different keys.  "metas" requires "m" and
"<tab>" at best (which are at opposite ends of the
keypad), and several character and/or tab key presses
at worst, depending on directory contents.  Since the
metadata directory will be fundamental and widely used
(hackers are users too!), this is an important
consideration.

- LESS LIKELY TO BE REJECTED BY LINUS.  The ellipsis
name uses the *nix convention of specifying a "really
hidden" system file with two dots.  This will prevent
name clashes with user files, and will be far more
likely to be accepted by the technical community --
most notably, Linus.

- NAME CLASHES WOULD BE A USABILITY DISASTER. 
Compounded by the fact that "metas" uses the *nix
naming convention for a user file (i.e. no leading
dots), it has been noted that "metas" means "goals" in
some languages.  Users that unpack an archive
containing a "metas" directory will not know where to
look for their data, even if there is a clever escape
plan (eg. "/nometas", "metas/escape", whatever).  They
may not even know what the problem is; just that "MY
FILES HAVE BEEN LOST!".  I can guarantee at least one
desperate email to this list on the subject, assuming
that the user is even able to determine that ReiserFS
is the culprit.  This is a disaster waiting to happen,
and this cannot be stressed enough.

- DEFAULTS MATTER!  In addition to the functionality
problems caused by a poor name choice (see previous
point), users will complain about it in review
articles, etc., before realizing (if ever) that it can
be changed.  This will be a black mark on Reiser4.

I beg for the patience of those that find this thread
tedious.  We all have different priorities; my top
priority on any project is usability.  I have seen too
many brilliant OSS projects hampered by heinous, and
easily avoided, usability mistakes.

Thanks,
N. Electron

(1) See the following pages for details:

"http://developer.apple.com/documentation/UserExperience/Conceptual/OSXHIGuidelines/XHIGText/chapter_12_section_3.html#TPXREF126"

"http://wiki.kdenews.org/tiki-index.php?page=KDE+Pseudo-HIG#id450424"

"http://developer.gnome.org/projects/gup/hig/1.0/menus.html#menu-item-types"

"http://www.palmos.com/dev/support/docs/uiguidelines.pdf"
(search for "ellipsis")


______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca
