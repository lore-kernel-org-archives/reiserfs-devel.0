From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: SOLVED! (was Re: Problem with 2004.04.21-internal.testing)
Date: Wed, 21 Apr 2004 19:01:51 +0400
Message-ID: <200404211850.46855.vitaly@namesys.com>
References: <20040421121611.GA27992@brouette.noos.fr> <200404211642.48301.rmeijer@internet.gr> <200404211653.03400.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18121-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404211653.03400.rmeijer@internet.gr>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Raymond A. Meijer" <rmeijer@internet.gr>, reiserfs-list@namesys.com
Cc: Nikita Danilov <Nikita@Namesys.COM>

On Wednesday 21 April 2004 17:53, Raymond A. Meijer wrote:
> On Wed 21 April 2004 16:42, Raymond A. Meijer wrote:
> > Okay, this compiled and installed cleanly.
> >
> > Running 'fsck.reiser4 /dev/sys/backup' now...
>
> Wooohoooooo! No more (spelling ;) errors:
>
> No corruption found.
>
> Thanks a million!!

The bug was in the lost+found creation, its StatData was created 
without Unix StatData extention by default, just with LightWeight 
extention. However, the result directory was not corrupted (you just 
got a light weight object), that is why the current fsck does not fix 
anything there. Some operations are not allowed for light wieght 
objects, in particular, it seems the current reiser4 code does not 
allow to remove them. Nikita can probably tell more upon this.

-- 
Thanks,
Vitaly Fertman

