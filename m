From: The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu>
Subject: Re: "Metas"
Date: Fri, 16 Apr 2004 19:55:54 -0700 (PDT)
Message-ID: <200404170255.i3H2ts1S011836@sirius.cs.pdx.edu>
References: <no.id>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18018-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <no.id> from "Grant Miner" at Apr 16, 2004 03:44:40 PM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> From: Grant Miner <mine0057@mrs.umn.edu>
> > I don't think I've heard a single person, except Hans,
> > voice any support for "metas".
> 
> I like "metas".

Chalk me up as neutral about the name itself. That is I'm neutral about
".metas" or "..metas", I'm firmly against using "metas" (or any other
name) without at least a leading period. I suspect Linus et al might very
well reject such a FS because this would be a fatal flaw. I'm concerned
about using such a short and therefore precious name for filesystem
functions, but OTOH it might well be accessed often by a user and
therefore appropriate.

> > It seems that the most widely supported name thus far
> > is "...".

> Maybe "props" would be a good name?  It is short for properties, which 
> is synonymous with metadata and attributes (oops, I used a heretical 
> word! :)

Might ".properties", ".metadata" or ".attributes" work? Programs
shouldn't have a problem with a 12 character string occuring once in
their code. From a shell you'll be able to use filename completion, or
11 characters isn't that many to type. (and the leading dot avoids
breaking zillions of programs with security implications)


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \   (    |         EHeM@cs.pdx.edu      PGP 8881EF59         |    )   /
  \_  \   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
    \___\_|_/82 04 A1 3C C7 B1 37 2A*E3 6E 84 DA 97 4C 40 E6\_|_/___/


