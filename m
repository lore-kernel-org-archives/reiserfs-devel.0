From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: fsck.reiser4 can't fix 1 fixable corruption
Date: Wed, 21 Apr 2004 11:09:41 +0300
Message-ID: <200404211109.41412.rmeijer@internet.gr>
References: <200404201733.51809.rmeijer@internet.gr> <408571DD.5030700@xs4all.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18101-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <408571DD.5030700@xs4all.nl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tue 20 April 2004 21:54, Sander Sweers wrote:

> >Error: Node (1444613), item (2): StatData of the file [2a:0:ffff] has the 
> >wrong bytes (0), Should be (188). Plugin (stat40).
> >        Time interval: Tue Apr 20 17:03:20 2004 - Tue Apr 20 17:07:02 2004
> >***** fsck.reiser4 finished at Tue Apr 20 17:07:02 2004
> >Closing fs...done

> ------------------------------------------------------------------------
> Error: Node (3978247), item (1): StatData of the file [2a:0:ffff] has
> the wrong bytes (0), Should be (185). Plugin (stat40).
>         Time interval: Tue Apr 20 20:46:31 2004 - Tue Apr 20 20:46:31 2004
> ***** fsck.reiser4 finished at Tue Apr 20 20:46:31 2004
> Closing fs...done
> ------------------------------------------------------------------------

> Same problem here, same kernel and reiser4progs but this is not on lvm
> but a 25G partition.

> The way the 2 errors look the same is scary.

It is indeed...

Is there any way we can come up with more debug information to pinpoint the 
cause of this problem?


Ray
