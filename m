From: Soeren Sonnenburg <sonne@first.gmd.de>
Subject: Re: nfsd-fh: found a name that I didn't expect
Date: Mon, 31 Mar 2003 12:37:12 +0200 (MET DST)
Message-ID: <Pine.GSO.4.21.0303311235060.4102-100000@pille>
References: <20030331142406.Q25533@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13475-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030331142406.Q25533@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Bernd Schubert <bernd-schubert@web.de>, reiserfs@nn7.de, reiserfs-list@namesys.com



On Mon, 31 Mar 2003, Oleg Drokin wrote:

> Hello!
> 
> On Sun, Mar 30, 2003 at 04:08:11PM +0100, Bernd Schubert wrote:
> 
> > Anyway I also tested the kernel-patch, but it causes problems with mounts from 
> > another nfs-server. Well, mounting works fine, but e.g. running 'ls 
> 
> Ah, stupid me.
> I have another patch that we created before iget5_locked backport.
> It's a bit of hack to beat the race, but it works (fixes the race).
> It does not touch any code outside of reiserfs.
> So if you apply that to 2.4.20 and see if you still can see the NFS problem
> over time...
> Patch is below.
> 

Err, sorry but I have to ask again:

This problem needs a patch on the server only - yes ?

Then I will at least patch+compile the kernel.

Soeren.

