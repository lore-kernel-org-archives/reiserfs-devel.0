From: The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Wed, 31 Mar 2004 21:46:14 -0800 (PST)
Message-ID: <200404010546.i315kEvY019805@sirius.cs.pdx.edu>
References: <no.id>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17639-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <no.id> from "Narcoleptic Electron" at Mar 31, 2004 10:58:59 AM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
> Hubert Chan wrote:
> > That effectively kills all filenames that contain @,
> 
> > much worse than
> > just a "metas" conflict IMHO.
> 
> I strongly agree:
> 
> - A restricted character in all names is far more
> likely to impact users than a single restricted name. 

This is why a couple candidates need to be brought up. Some seem good at
first glance, but are really bad choice after a bit of thought. So you're
right a badly chosen single character will be really bad. A good choice
needs to have minimal impact by being pretty much unused in filenames. A
corollary is that a badly chosen directory name will have a horrific
impact on users just as much as a badly chosen special character.

> I think that the meta directory needs to be thought of
> not as a special directory, but as a normal directory
> that has a name that is interpreted in a special way
> by the system.

In other words it is special, but it isn't special?

You can't have it both ways. "metas" is a perfectly valid filename on
all other filesystems. It is a valid word or partial word in several
languages, bad choice. Files/directories begining with . are at least
already handled specially by all tools. Names that are valid words are
precious, like gold you shouldn't steal them.

There is also the problem that things like Apache deliberately filter out
access to some files (like "..") because they're magic. By adding another
magic filename you've made those harder, at least begining it with . will
keep those tools' job easier (and you don't introduce a huge security
hole by adding a filesystem).

Also I feel it should be on the file itself. ie for the file /tmp/fooblah
you should be able to access the file's metadata by open()ing/using
readdir() on /tmp/fooblah/metas or (/tmp/fooblah/..metas or whatever).


> No one in this thread has commented on "+" as the
> default meta directory name (one of the final
> contenders in our previous thread on the subject). 
> Again, the reasons:
> - Short (one character)
> - Makes sense in all languages (meaning "additional
> information")
> - Available on all int'l keyboards

Bad choice. Note the "lost+found" directory found on *all* Unix
filesystems. If we need one more option | might be viable.

> Also, a question: are all meta files necessarily
> pseudo files?  Should users be able to put regular
> files in there to be interpreted as pseudo files? 
> This will help to clarify some things for me.

My impression is, that the metadata appears as normal files and is
accessible as normal files. Just gets interpreted in an interesting way.
I doubt metadata would have an owner or permissions separate from the
file/directory though. I imagine this is similar to Apple MacOS 10,
where all files have a mime-type that is accessible as
<filename>/mime-type.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \   (    |         EHeM@cs.pdx.edu      PGP 8881EF59         |    )   /
  \_  \   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
    \___\_|_/82 04 A1 3C C7 B1 37 2A*E3 6E 84 DA 97 4C 40 E6\_|_/___/


