From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: Reiserfs broken in 2.5.50 (possibly nanosecond stat timefields?)
Date: Sun, 1 Dec 2002 21:45:48 -0500
Message-ID: <200212012145.48864.tomlins@cam.org>
References: <20021130.114825.78703224.hoho@tacomeat.net> <20021130200614.A7766@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12082-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021130200614.A7766@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>, Colin Slater <hoho@tacomeat.net>
Cc: reiserfs-list@namesys.com

On November 30, 2002 12:06 pm, Oleg Drokin wrote:
> Hello!
>
> On Sat, Nov 30, 2002 at 11:48:25AM -0500, Colin Slater wrote:
> > ld.so? My systems is completely reiserfs (3.6), and nothing has
> > changed in my config file between 2.5.47 and 2.5.50. Upon looking
> > through the source tree, it seems like lines 1134-7 in
> > fs/reiserfs/namei.c seem to be throwing this panic. Only changesets to
> > touch namei.c in the past 4 months are "nanosecond stat timefields" and
> > "*_mknod prototype". I really can't see why these would cause this
> > problem, so maybe someone else does. Hand-copied output from the
> > BUG() follows, so this is only what I thought was important and might
> > contain errors. If you need any other information I will gladly supply
> > it.
>
> Just to make sure, does this patch helps?

This also cleared up boot problems I was having with 2.5.50.

Thanks
Ed Tomlinson
