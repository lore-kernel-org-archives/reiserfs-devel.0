From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck --rebuild-tree on a big filesystem
Date: Mon, 23 Dec 2002 10:59:58 +0300
Message-ID: <20021223105958.A29870@namesys.com>
References: <20021125143634.GC9006@mail.cekit.cz> <20021125143634.GC9006@mail.cekit.cz> <20021125174846.A31778@namesys.com> <atsteb$44s$1@genki.hungrycats.org> <3E06C152.8020909@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12194-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E06C152.8020909@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

Hello!

On Mon, Dec 23, 2002 at 10:54:58AM +0300, Hans Reiser wrote:

> >Linux 2.4.18 UP (SMP kernel), SW RAID0 and linear, nearly full 160GB
> >reiserfs of mostly small files, reiserfsprogs 1:3.6.3-1 (Debian).  I had
> >two machines go through a power failure while doing lots of concurrent
> >hard links and deletes.  The linear system survived apparently intact,
> >while the RAID0 system had the usual "stat Permission denied"
> >problem.
> >This has happened a number of times before on a variety of systems
> >(it seems to be reiserfs's most common failure mode).  The events are
> >very similar each time.  AFAICT you just have to set up a reiserfs on
> >some kind of RAID system and let it run through a few power failures to
> >reproduce the problem.
> Oleg, please reproduce this.  It is not acceptable....

I believe this is infamous "write cache enabled" problem.

Bye,
    Oleg
