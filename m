From: Oleg Drokin <green@namesys.com>
Subject: Re: nfsd-fh: found a name that I didn't expect
Date: Mon, 31 Mar 2003 14:41:13 +0400
Message-ID: <20030331144113.A1430@namesys.com>
References: <20030331142406.Q25533@namesys.com> <Pine.GSO.4.21.0303311235060.4102-100000@pille>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13476-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.21.0303311235060.4102-100000@pille>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Soeren Sonnenburg <sonne@first.gmd.de>
Cc: Bernd Schubert <bernd-schubert@web.de>, reiserfs@nn7.de, reiserfs-list@namesys.com

Hello!

On Mon, Mar 31, 2003 at 12:37:12PM +0200, Soeren Sonnenburg wrote:
> > I have another patch that we created before iget5_locked backport.
> > It's a bit of hack to beat the race, but it works (fixes the race).
> > It does not touch any code outside of reiserfs.
> > So if you apply that to 2.4.20 and see if you still can see the NFS problem
> > over time...
> > Patch is below.
> Err, sorry but I have to ask again:
> This problem needs a patch on the server only - yes ?

Yes. Well, may be this race is not the cause of the problem you are observing,
but prerequisites are similar, so we'd better make sure this is different problem.

> Then I will at least patch+compile the kernel.

Thank you.

Bye,
    Oleg
