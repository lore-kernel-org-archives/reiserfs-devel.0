From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: Re: no further nfsd-fh: found a name that I didn't expect
Date: 24 May 2003 09:18:32 +0200
Message-ID: <1053760712.1213.18.camel@localhost>
References: <200305231703.47899.bernd-schubert@web.de>
	 <20030523151835.GB9289@namesys.com>
	 <200305232020.36324.bernd-schubert@web.de>
	 <20030524070500.GA10706@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14241-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030524070500.GA10706@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Bernd Schubert <bernd-schubert@web.de>, 'reiserfs' <reiserfs-list@namesys.com>

On Sat, 2003-05-24 at 09:05, Oleg Drokin wrote:
> Hello!
> 
> On Fri, May 23, 2003 at 08:20:36PM +0200, Bernd Schubert wrote:
> > > > ever again. Well, we once rebooted and used by accident the wrong
> > > > kernel-image and of course had problems again until the next reboot.
> > > > Btw, is the iget4()-fix in 2.4.21-rc3 the same patch ?
> > > No, this is not iget5_locked (we plan to push it in 2.4.22pre time),
> > > this is minimal fix instead.
> > Great, so we won't see this problem even without patching.
> 
> It seems so.

well it strongly seems so... as we also had this problem and it did also
not occur for the last 52 days since we applied that patch...

S.

