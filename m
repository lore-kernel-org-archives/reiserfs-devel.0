From: The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu>
Subject: Re: Can compression at filesystem level improve overall
Date: Sun, 21 Mar 2004 15:17:53 -0800 (PST)
Message-ID: <200403212317.i2LNHrJo010166@sirius.cs.pdx.edu>
References: <1079879342.7375.2.camel@poo.home.local>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17362-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1079879342.7375.2.camel@poo.home.local> from "Sean Johnson" at Mar 21, 2004 09:29:02 AM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sean@gutenpress.org
Cc: reiserfs-list@namesys.com

> From: Sean Johnson <sean@gutenpress.org>
> On Fri, 2004-03-19 at 11:53, Nikita Danilov wrote:
> > That's common misconception. :)
> > 
> > The goal of compression is to conserve disk bandwidth rather than space.
> > 
> > By compressing it is possible to transfer data (== uncompressed data
> > user works with), at a rate higher than raw device bandwidth.
> 
> I am far from any kind of authority on filesystems, but doesn't compression
> make data corruption a significantly nastier bugaboo?

Potentially. Depending upon the encoding losing one block of encoded data
maps to losing many blocks of decoded data. Also losing the first block
of data might make it impossible to recover later blocks.

But these aren't issues since you do error correction near the physical
layer, and backups just you make sure. You do, don't you?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \   (    |         EHeM@cs.pdx.edu      PGP 8881EF59         |    )   /
  \_  \   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
    \___\_|_/82 04 A1 3C C7 B1 37 2A*E3 6E 84 DA 97 4C 40 E6\_|_/___/


