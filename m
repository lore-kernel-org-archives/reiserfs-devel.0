From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: ".meta." as a Name Prefix
Date: Sun, 18 Apr 2004 19:16:53 -0400 EDT
Message-ID: <2407572152-BeMail@cr593174-a>
References: <200404170255.i3H2ts1S011836@sirius.cs.pdx.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18037-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404170255.i3H2ts1S011836@sirius.cs.pdx.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Elliott Mitchell wrote on Fri, 16 Apr 2004 19:55:54 -0700 (PDT):
> > From: Grant Miner <mine0057@mrs.umn.edu>
> > I like "metas".
> 
> Chalk me up as neutral about the name itself. That is I'm neutral about
> ".metas" or "..metas", I'm firmly against using "metas" (or any other
> name) without at least a leading period. I suspect Linus et al might very
> well reject such a FS because this would be a fatal flaw. I'm concerned
> about using such a short and therefore precious name for filesystem
> functions, but OTOH it might well be accessed often by a user and
> therefore appropriate.

I agree, it needs to start with a period.  I'd also drop the idea
of having a separate directory for metadata and just use a common
name prefix.  ".meta.mime" for example, rather than ".meta/mime".

I'm probably repeating myself, but the trouble is that the .meta
directory isn't a full directory - you can't add attributes to it.
In BeOS, that's useful - the directory's GUI window coordinates
are stored as attributes on the directory.  I'd like to use the
standard GUI file explorer to also check on attributes!  With a
.meta directory, it seems good in a psychological organizational
way but it breaks the object model.  That breakage will cause more
programming annoyances than using a prefix instead, in my humble
opinion.

- Alex
