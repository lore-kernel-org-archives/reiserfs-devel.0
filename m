From: The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu>
Subject: Re: How to build a big file server
Date: Thu, 5 Jun 2003 16:49:01 -0700 (PDT)
Message-ID: <200306052349.h55Nn1Ap005904@sirius.cs.pdx.edu>
References: <no.id>
Reply-To: ehem@cs.pdx.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14463-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <no.id> from "Carl-Daniel Hailfinger" at Jun 05, 2003 06:47:32 PM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Cc: Heinz-Josef Claes <hjclaes@web.de>, Russell Coker <russell@coker.com.au>, reiserfs-list@namesys.com

> From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
> Heinz-Josef Claes wrote:
> >From the debian web page:
> >
> > http://packages.debian.org/testing/utils/storebackup.html
> >
> > File comparisons are done with MD5 checksums, so no changes go
> > unnoticed.
> 
> If you believe the last sentence, I have a bridge to sell.

Where, how large, what price, what is the expected income?

> To be more exact: MD5 is a 128=2^7 bit hash. Assuming a file length of 4kB
> = 2^8*4096=2^20 bits, approximately 2^(2^(20-7))= 2^8192= 10^2457
> different files have the same hash.
> 
> That's right: for a given MD5 hash, there are more different files with
> 4kB size sharing the same hash than the count of atoms in the whole
> universe. If the files are larger, it gets worse.

Yes, if you have every possible 4KB file in existance, then 4080 of those
bytes are redundant (4096 minus 16 bytes for the hash), so 2^(4080*8) of
all possible 4KB files would have the same MD5 hash. Very much larger
than the number of atoms in the universe (2^265, without dark matter),
and larger than the volume of the universe in cubic centimeters (2^280).

Think of how many unique 4KB files could exist though, 2^32768. That is
a large number. If we consider a super-huge installation, you might have
a petabyte of storage (2^50, considerably larger than any installation
I've ever heard of). Now if we figure an average file size of 1KB
(extraordinarily small), then this installation will have 2^40 separate
files. There is also the problem of the birthday paradox so once you've
covered half the bits there is a fifty percent chance of a collision, so
MD5 suddenly comes down to 64 bits of use before collision becomes a
significant danger. So we are short of endangering MD5 by 24 bits, your
chances of winning a lottery game are very much better than a 50% chance
of a single collision.

Now, the size of MD5 is small enough that there is a significant
danger of /governments/ being able to find a couple pairs of files with
identical MD5 hashes. A much larger danger is that some attacks have
gotten though weakened versions of MD5. The danger of identical files
being found by accident is utterly insignificant.

This is also assuming MD5 is used for detecting identical files, more
likely it is used to detect changes. Also do you seriously worry about
users attempting to /prevent/ their files from being backed up?

> md5sum(1) is not diff(1). Most of the time, it will suffice as el cheapo
> replacement, but for backups it's definitely horrible. You don't store
> your backup tapes in the microwave, do you?

I'd worry more about the fireproof box your tapes are in failing in a
fire than about finding a single pair of colliding files though.

You do not know enough to disparage MD5.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \   (    |         EHeM@cs.pdx.edu      PGP 8881EF59         |    )   /
  \_  \   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
    \___\_|_/82 04 A1 3C C7 B1 37 2A*E3 6E 84 DA 97 4C 40 E6\_|_/___/


