From: The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Fri, 2 Apr 2004 22:10:36 -0800 (PST)
Message-ID: <200404030610.i336AaDB000455@sirius.cs.pdx.edu>
References: <no.id>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17677-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <no.id> from "Narcoleptic Electron" at Apr 02, 2004 11:04:47 AM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
> 
> I've attempted to incorporate all the new proposals. 
> Please let me know if I've missed any.
> 
> Narcoleptic Electron wrote: 
>  
> > PROBLEMS:
> > 
> > 1. Name clashes with user files; "metas" does not
> > have
> > meaning in all non-English languages; too long.

The latter two are pretty trivial, how meaningful is "lost+found" in
other languages, five characters is that long?

I feel the first item on that list is fatal though. I be *very* worried
about the ReiserFS v4 patch being rejected from the kernel due to this.
Real filenames in any language should be considered precious, and not
stolen without a *very* good reason. This is a decent reason, but utterly
short of being good enough.

> > b) Conflict with an important mail application's
> > directory naming scheme.
> 
> And the djbdns utils (eg, dnscache), whic use files
> starting with @ for cache files.

In other words, problems with multiple applications; fatal flaw. Though
not a common one, short and therefore precious.

> > c) No additional problems.

Still short and therefore precious. There could be multiple unknown
applications that use it. Already commonly used in filenames (though not
by itself).

> e) This is reserved by Windows, making a Windows port
> of ReiserFS impossible (I think this was the reason;
> it was an objection raised by someone else during the
> previous thread on this subject).  (The "..." approach
> was my original suggestion on the original thread...)

On which systems you could use / as the metadata separator.

> > 3. All file names containing the delimiter character
> > will cause problems; introduces a whole new
> > [arguably
> > redundant] fundamental concept.  

Not without president though, notably MacOS 10 metadata appears when
accessing a file as a directory. Only MacOS 10 doesn't include a new
separator.

> 5. We would need a way to differentiate regular
> subdirectories in "/proc/meta/" with meta data
> entries.
> For example, consider "/proc/meta/foo/bar/baz": is
> "baz" a metadata entry for "/foo/bar", or is "bar/baz"
> metadata for "/foo"? 

The problems are *much* bigger than this. For one thing, there is the
already mentioned problem, this completely breaks across network
filesystems. The *very* much larger problem is the overhead. If I want
to access the metadata for an arbitrary file you have to use getwd()
which may in turn stat() every file in several directories. If you're
interacting with a user, the overhead isn't bad, but if you're doing a
couple hundred of these overhead is a severe problem.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \   (    |         EHeM@cs.pdx.edu      PGP 8881EF59         |    )   /
  \_  \   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
    \___\_|_/82 04 A1 3C C7 B1 37 2A*E3 6E 84 DA 97 4C 40 E6\_|_/___/


