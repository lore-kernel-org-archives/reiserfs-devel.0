From: The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu>
Subject: Re: Can compression at filesystem level improve overall performance?
Date: Tue, 23 Mar 2004 16:08:53 -0800 (PST)
Message-ID: <200403240008.i2O08r56008073@sirius.cs.pdx.edu>
References: <no.id>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17415-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <no.id> from "Hans Reiser" at Mar 23, 2004 01:59:39 PM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiser@namesys.com
Cc: Scott Young <youngs1@sunyit.edu>, reiserfs-list@namesys.com

> From: Hans Reiser <reiser@namesys.com>
> 
> Scott Young wrote:
> 
> >On Mon, 2004-03-22 at 15:04, Hans Reiser wrote:
> >
> >>Scott Young wrote:

> >>>The idea
> >>>can be applied to Reiser4 by compressing the overwrite set while the
> >>>journal data is being written, and then compressing the tail of the
> >>>relocate set moving backwards until the write stream catches up to the
> >>>compression.  It could also take into account the estimated
> >>>decompression time when reading the data back, and use it for deciding
> >>>whether the compression ratio is good enough to write the compressed
> >>>data instead of the uncompressed data.
> >>>
> >>I didn't understand the above.
> >
> >What I'm saying is that you can start writing uncompressed data to the
> >drive while the yet-to-be-written data is being compressed.  The goal is
> >to have some segments of data compressed, and have them compressed
> >before they come up next for writing to the drive.  Virtually no time is
> >lost if the data cannot be compressed because the data will be sent to
> >the disk at full speed anyway, whether or not the system had time to
> >compress it.  The repacker could compress the data that was written to
> >the drive before it could be compressed if the repacker thinks that
> >compression would speed up reading of that data (or significantly reduce
> >space usage, which will generally happen at the same time as data moving
> >faster because of compression).
> >
> Too much complexity.  LZW is fast and effective.

...and stupidly encumbered by patents (RSA at least was non-trivial and
non-obvious) in some countries (the USA patent has expired). LZ77
varients (libz) are quite effective too.


> >As another example, gcc could create a "live" derived file a.out that
> >that means "a.out is the live derivative of files src1.c, src2.c,
> >src3.c, src4.c when applied using the command gcc -o a.out src1.c src2.c
> >src3.c src4.c".  Of course it would be encoded in the syntax that the
> >derived-file plugin would understand.  When the source files change, the
> >developer wouldn't have to rerun gcc to run the executable.  The file
> >would automagically be compiled from the sources.
> >
> >The more I think about it, it seems that derived-files could be
> >implemented as plugin(s) with only one extra feature added to the core
> >filesystem: copy-on-write.  (Copy-on-write could be extended to only
> >write changes, and have the new version be constructed as a derived file
> >from the original, thereby compactly maintaining multiple versions of a
> >file and improving write performance, but I digress)
> >  
> Consider our use of compression atoms, it may reduce the incentive for 
> what you describe.

Where is this idea mentioned?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \   (    |         EHeM@cs.pdx.edu      PGP 8881EF59         |    )   /
  \_  \   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
    \___\_|_/82 04 A1 3C C7 B1 37 2A*E3 6E 84 DA 97 4C 40 E6\_|_/___/


