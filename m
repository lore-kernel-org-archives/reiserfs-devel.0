From: Sander <sander@humilis.net>
Subject: Re: reiser4progs 1.0.4
Date: Tue, 22 Feb 2005 21:08:09 +0100
Message-ID: <20050222200809.GA15179@favonius>
References: <200502201344.41656.vitaly@namesys.com> <20050221131024.GA43266@xs4all.nl> <200502211659.53972.vitaly@namesys.com>
Reply-To: sander@humilis.net
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200502211659.53972.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Ookhoi <ookhoi@xs4all.nl>, reiserfs-list@namesys.com

Vitaly Fertman wrote (ao):
> On Monday 21 February 2005 16:59, Vitaly Fertman wrote:
> > On Monday 21 February 2005 16:10, Ookhoi wrote:
> > > On Sun, Feb 20, 2005 at 01:44:41PM +0300, Vitaly Fertman wrote:
> > > > The new reiser4progs package is available on our ftp
> > > > site (ftp://ftp.namesys.com/pub/reiser4progs/).
> > >
> > > Thank you for this release. It doesn't crash anymore :-)
> > >
> > > But it does tell me:
> > > "NO REISER4 METADATA WERE FOUND. FS RECOVERY IS NOT POSSIBLE."

> > no master super block, no format-specific super block, no backup
> > blocks, no status block, all bitmap blocks are not valid, no one
> > reiser4 formatted node has been found ... what you are fscking does
> > not look like a reiser4 filesystem at all.

As said before I was very much asleep when I ran the fsck command. It
should have been hda2, not hda1.

Btw, hda1 contained an ext2 filesystem which was not mountable and not
recoverable after running all the fsck.reiser4 commands on it. Can't
blame it I guess :-)  Luckily it was only /boot and thus easy to
recover.

I managed  to reboot the machine and mount the fs. Some files where
corrupted, but on the whole the fs seems fine now. So a big thumbs up
for this release of fsck.reiser4 :-)

Btw, I blame the corruption on the combination kernel and a forced
hard-reboot during shutdown (it hung).

Again, thumbs up. This all made me much more confident wrt Reiser4.

With kind regards, Sander
