From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: Wtr.: Re: 2.6.15.1+reiser4 Kernel Panic
Date: Mon, 30 Jan 2006 23:37:15 -0700
Message-ID: <43DF059B.5030502@esoft.com>
References: <E1F3k6m-0007gB-2D@www7.emo.freenet-rz.de> <43DEC1BC.2030800@namesys.com> <43DED6E1.3060509@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27947-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43DED6E1.3060509@gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Clay Barnes <clay.barnes@gmail.com>
Cc: Hans Reiser <reiser@namesys.com>, rudekjan@freenet.de, reiserfs-list@namesys.com

Clay Barnes wrote:
> To amplify what Hans (accurately) wrote, once you see bad sectors,
> that means that you already have many more than you see, and that your
> hard drive is all out of spare sectors to silently swap out for when
> it finds one.
>
> Basically, there's so much wrong with the surface that your hard drive
> can't hide any more flaws, and has given up trying.
>
> Hans is right:  If you see a single bad sector, the drive is
> considered unsafe and trash for even the tightest owner.
I don't believe that's quite true.  It's my understanding that a drive
may have a correctable read error.  The data may be too damaged to read
from that sector, but rewriting the sector can repair it or remap it to
a new undamaged area.  The drive cannot make up the lost data though, so
it must report the error.

The damage can come from a partial write during power down or from data
that was marginal to start with and hadn't been read in a long time
(Drives will remap sectors even on successful reads, when they have to
use too much error correction to get the data, but don't generally do
full surface sweeps to check.  SMART can be told to do full surface
checks, however.)

Don't take the existence of a single bad sector as proof that the drive
is trash.  Instead, check the SMART status and look at the remap rates
and error rates.  SMART should have a nice summary for you too, either
OK, FAILING or FAILED (or similar phrases).
