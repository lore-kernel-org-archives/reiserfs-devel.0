From: The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Sun, 4 Apr 2004 21:01:33 -0700 (PDT)
Message-ID: <200404050401.i3541XVk004592@sirius.cs.pdx.edu>
References: <no.id>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17704-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <no.id> from "cami" at Apr 03, 2004 09:34:08 PM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> From: Hans Reiser <reiser@namesys.com>
> these problems will not exist significantly in reality.  Look at netapps 
> and snapshots and clearcase and other filesystems, I remember wondering 
> if .snapshot could be a problem when netapps were new and it was never a 
> problem.

Notice though that that filename begins with ".", not a letter. This
causes all programs to treat it specially. Also note that that filename
is nine characters long, and therefore making a purely random collision
less likely by more than four orders of magnitude.

> People who find it is a problem can #define it to something else.  If 5 
> people bother to do so, I will be surprised.
> 
> Many languages have reserved keywords.....

I REJECT THIS!

I believe Ada is almost the only programming language without reserved
words. The thing is a filesystem is NOT a programming language! It is
designed to handle files with arbitrary names, no matter how odd. Only
programmers deal with C, end users must deal with filesystem limitations.

> From: cami <camis@mweb.co.za>
> Not sure if anyone  has bothered to check if this would
> impose the  limitation  that  people are worried about.
> 
>  From a  quick glance,  none  of  the linux distro's have
> ever  had  a  file / directory  called  "metas"  before.
> `metas`  isn't even a real a word anyway  (at  least not
> an english word) so the chances of  it being a big issue
> are very very  small..  freshmeat.net's search shows not
> even one hit  for  the word  metas and  that pretty much
> the majority of linux/coding related projects..

Good point, search engines as evidence. The problem is you're only
looking at distributions, which are going to be highly similar and you're
completely missing end users. So let us take this to a full search engine
and see what turns up...  Hmm, roughly a million hits, let us look at a
few samples:

http://www.metas.ch/
http://vancouver-webpages.com/META/mk-metas.html
http://www.metas.com.br/
http://metas.enfermeria21.com/
http://www.metas.com.mx/

Okay, out of one million hits, we randomly look at ten, and half feature
"metas" in the URL somewhere. Going the other direction, Google indexes
roughly 4 billion pages. If we guess the above search was representative,
roughly 500,000 pages will include "metas" somewhere in the URL, possibly
only as a hostname, but somewhere. So we've managed to collect 1 out of
every 10,000 pages that Google indexes. Though we don't have a direct
proof, I hope I've come close enough to scare you.

Hans, what will it take for you to change your mind?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \   (    |         EHeM@cs.pdx.edu      PGP 8881EF59         |    )   /
  \_  \   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
    \___\_|_/82 04 A1 3C C7 B1 37 2A*E3 6E 84 DA 97 4C 40 E6\_|_/___/


