From: The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu>
Subject: Re: [OT] Re: ReiserFS problems
Date: Fri, 8 Aug 2003 17:45:43 -0700 (PDT)
Message-ID: <200308090045.h790jh4A011655@sirius.cs.pdx.edu>
References: <200308082259.05512.russell@coker.com.au>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15256-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200308082259.05512.russell@coker.com.au> from "Russell Coker" at Aug 08, 2003 10:59:05 PM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: russell@coker.com.au
Cc: Christian Kujau <evil@g-house.de>, reiserfs-list@namesys.com

> From: Russell Coker <russell@coker.com.au>
> On Fri, 8 Aug 2003 21:29, Christian Kujau wrote:
> > Russell Coker wrote:
> > > system for storing a file-system image.  If you use an XOR encryption
> > > method it won't even hurt performance either.  :-#
> >
> > sorry to hop in here, but i don't understand why an algorithm like "XOR"
> > is named "encryption" at all. isn't it that another XOR operation just
> > delivers the cleartext again?
> 
> It is encryption just as is the "Caesar cipher" (of which ROT-13 is a 
> sub-set).  It is not very good encryption, but it's enough to stop reiserfsck 
> from doing the wrong thing as it will defeat magic number detection.

It depends what is being mentioned. If you've got a short key, say less
than 1MB, then it is horrible encryption; take a couple minutes to find a
cracker and your data will be out in the open pretty quickly.

If the key is large, then it is a very different matter. If you've got a
keystream that is at least as large as the data being sent, and it is
*never* reused, then this is the "one time pad". The "one time pad" is
not merely the best cryptosystem out there, but it is the only
cryptosystem that is *provably* secure. The problem is that keystream it
can *never* be reused, and must be absolutly secure (this really needs an
incredible amount of emphasis). If you're sending a little bit of super
sensitive data around, then it is worth trying to deal with the key
distribution problem; otherwise, use a conventional cryptosystem.

> Of course a magic number can be hit by chance given a sufficiently large 
> amount of input data.  I imagine that a gzip file could have the ReiserFS 
> magic data if given the right/wrong input and thus could be munged through a 
> fsck.

Which as already noted is what really matters here.  :-)  Just a little
bit of obfustication, so fsck will fail to identify the data as part of
the filesystem, just as mere data and leave it alone.

Shouldn't fsck be able to deal with this anyway? Just end up with the
file being merged into the larger filesystem? Could this be used by a
cracker to attack a system? The use a random per-FS cookie approach seems
like a good idea.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \   (    |         EHeM@cs.pdx.edu      PGP 8881EF59         |    )   /
  \_  \   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
    \___\_|_/82 04 A1 3C C7 B1 37 2A*E3 6E 84 DA 97 4C 40 E6\_|_/___/


