From: Oleg Drokin <green@namesys.com>
Subject: Re: no further nfsd-fh: found a name that I didn't expect
Date: Sat, 24 May 2003 11:05:00 +0400
Message-ID: <20030524070500.GA10706@namesys.com>
References: <200305231703.47899.bernd-schubert@web.de> <20030523151835.GB9289@namesys.com> <200305232020.36324.bernd-schubert@web.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14240-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200305232020.36324.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Schubert <bernd-schubert@web.de>
Cc: 'reiserfs' <reiserfs-list@namesys.com>

Hello!

On Fri, May 23, 2003 at 08:20:36PM +0200, Bernd Schubert wrote:
> > > ever again. Well, we once rebooted and used by accident the wrong
> > > kernel-image and of course had problems again until the next reboot.
> > > Btw, is the iget4()-fix in 2.4.21-rc3 the same patch ?
> > No, this is not iget5_locked (we plan to push it in 2.4.22pre time),
> > this is minimal fix instead.
> Great, so we won't see this problem even without patching.

It seems so.

Bye,
    Oleg
