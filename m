From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Fri, 2 Apr 2004 11:04:47 -0500 (EST)
Message-ID: <20040402160447.60682.qmail@web25006.mail.ukl.yahoo.com>
References: <20040401163120.98834.qmail@web25006.mail.ukl.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17667-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040401163120.98834.qmail@web25006.mail.ukl.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I've attempted to incorporate all the new proposals. 
Please let me know if I've missed any.

Narcoleptic Electron wrote: 
> 
> PROPOSALS:
> 
> 1. Leave the "metas" directory as it is, for storing
> the meta data hierarchy.
> 
> 2. Rename "metas" to:
> a) ..metas
> b) @
> c) +

d) ..meta
e) ...

> 3. Revise the architecture so that instead of
> putting
> meta data into a directory, make it accessible via a
> different path delimiter.  Proposals for a delimiter
> include:
> a) \
> b) @
> c) .
> 
> 4. Return to the original approach of putting meta
> data files into the parent directory, and prefixing
> the name with:
> a) ..metas.

5. Create a "meta" directory in "/proc" whose contents
mirror the root file system, and contains all meta
data.
 
> PROBLEMS:
> 
> 1. Name clashes with user files; "metas" does not
> have
> meaning in all non-English languages; too long.
> 
> 2. Name clashes with user files.
> a) "..metas" does not have meaning in all
> non-English
> languages; too long.
> b) Conflict with an important mail application's
> directory naming scheme.

And the djbdns utils (eg, dnscache), whic use files
starting with @ for cache files.

> c) No additional problems.

d) More readable than "metas" in English, but suffers
the same problems.
e) This is reserved by Windows, making a Windows port
of ReiserFS impossible (I think this was the reason;
it was an objection raised by someone else during the
previous thread on this subject).  (The "..." approach
was my original suggestion on the original thread...)

> 3. All file names containing the delimiter character
> will cause problems; introduces a whole new
> [arguably
> redundant] fundamental concept.  
> 
> 4. A step backwards; dramatically increases chance
> of
> name conflicts (since meta data is no longer in one
> discrete location, but interspersed with user
> files).

5. We would need a way to differentiate regular
subdirectories in "/proc/meta/" with meta data
entries.
For example, consider "/proc/meta/foo/bar/baz": is
"baz" a metadata entry for "/foo/bar", or is "bar/baz"
metadata for "/foo"? 

N. Electron


______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca
