From: The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu>
Subject: Re: secure delete?
Date: Sat, 20 Mar 2004 15:45:08 -0800 (PST)
Message-ID: <200403202345.i2KNj8VK024070@sirius.cs.pdx.edu>
References: <1079697068.5812.13.camel@pear.st-and.ac.uk>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17349-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1079697068.5812.13.camel@pear.st-and.ac.uk> from "Peter Foldiak" at Mar 19, 2004 11:51:08 AM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Cc: reiserfs-list@namesys.com

> From: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
> On Fri, 2004-03-19 at 11:29, Hans Reiser wrote:
> > Encrypt everything is what will work best.
> 
> I guess you would have to use an encrypted swap area as well, right?
> Would the performance be ok for that? Peter

How many orders of magnitude are disks slower than processors/memory?
Encryption algorithms are designed to be fast to compute. Even the
slowest processors of today will be able to encrypt/descrypt data much
faster than the maximum throughput of hard disks. With swap you're going
to be drowned by seeks anyway.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \   (    |         EHeM@cs.pdx.edu      PGP 8881EF59         |    )   /
  \_  \   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
    \___\_|_/82 04 A1 3C C7 B1 37 2A*E3 6E 84 DA 97 4C 40 E6\_|_/___/


