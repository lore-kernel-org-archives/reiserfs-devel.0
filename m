From: Hans Reiser <reiser@namesys.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Sun, 23 Jul 2006 15:15:26 -0600
Message-ID: <44C3E6EE.8080607@namesys.com>
References: <44C12F0A.1010008@namesys.com> <20060722130219.GB7321@thunk.org> <44C26F65.4000103@namesys.com> <44C28A8F.1050408@garzik.org> <44C32348.8020704@namesys.com> <44C3E041.1020909@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29163-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44C3E041.1020909@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Jeff Garzik <jeff@garzik.org>, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Jeff Mahoney wrote:

>
>
> That particular bug isn't in the bitmap scanning code, it's a side
> effect of the write batching higher up.

Did you write the code that looks for a window of 32
blocks?  If not, and if this code has been around for a long time, I
apologize.   I thought you did write it and added it in recent months.

>
>
> It's a pathological case when the file system is seriously fragmented.

Most bugs are pathological cases.;-)

> A
> quick fix would be to set a flag indicating that future writes shouldn't
> bother trying to find a window that large,

There are lots of quick fixes.  1) The quickest is to not scan for the
window at all.  2) The second quickest is to limit the number of bitmaps
that will be scanned to some number like 3.  3) The not at all quickest
is to track free extents like XFS does, which is not a hack, but it
belongs in a development branch.  I am not sure it is worth the
complexity, but my mind is not closed.

On monday we will do 1) or 2), probably 1).   After the repacker is
done, we should review all our block allocation algorithms.  I have an
idea for how to do things more optimally for streaming media that will
avoid fragmentation over time, and when combined with the repacker may
make 3 not worthwhile.

I am grateful that you and Chris do bug fixes, but when you guys are too
busy, (and that can and will happen to any of us), the baton needs to
get passed.  V3 needs to be a zero defect product, and once we know it
is a bug I don't want bugs in V3 to remain unfixed for more than a day
plus the time it takes to fix it.    If you do add code, I want any bugs
that show up in the aftermath of mainstream merging to get jumped on.

Hans
