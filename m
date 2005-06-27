From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: reiser4 plugins
Date: Mon, 27 Jun 2005 08:42:55 -0400
Message-ID: <20050627124255.GB6280@thunk.org>
References: <42BB7B32.4010100@slaphack.com> <200506240334.j5O3YowB008100@laptop11.inf.utfsm.cl> <20050627092138.GD11013@nysv.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24695-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20050627092138.GD11013@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus T?rnqvist <mjt@nysv.org>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, David Masover <ninja@slaphack.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Hans Reiser <reiser@namesys.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Mon, Jun 27, 2005 at 12:21:38PM +0300, Markus   T?rnqvist wrote:
> On Thu, Jun 23, 2005 at 11:34:50PM -0400, Horst von Brand wrote:
> >David Masover <ninja@slaphack.com> wrote:
> 
> >> I think Hans (or someone) decided that when hardware stops working, it's
> >> not the job of the FS to compensate, it's the job of lower layers, or
> >> better, the job of the admin to replace the disk and restore from
> >> backups.
> >Handling other people's data this way is just reckless irresponsibility.
> >Sure, you can get high performance if you just forego some of your basic
> >responsibilities.
> 
> Your honest-to-bog opinion is that the FS vendor is responsible for
> the admin not taking backups or the hardware vendor shipping crap?
> 
> *still trying to understand how that can be*

Most Linux users are using PC-class hardware.  And Ted's First Law of
PC-Class Hardware is: "Most of it is crap".  And then there's Ted's
Second Law, "Too many system administrators don't do backups".  This
is because most system admins are users who've never been trained to
be a sysadmin, or who haven't (yet) had weeks or months of works
disappear after a hardware failure.  

So it's a matter of matching the filesystem to the needs of the user.
If you have a filesystem which is blazingly fast, but which at the
slightest sign of trouble, trashes your data, versus one which is fast
but perhaps not-so-fast as the other filesystem, but which is much
more reliable, which would you choose?  

XFS has similar issues where it assumes that hardware has powerfail
interrupts, and that the OS can use said powerfail interrupt to stop
DMA's in its tracks on an power failure, so that you don't have
garbage written to key filesystem data structures when the memory
starts suffering from the dropping voltage on the power bus faster
than the DMA engine or the disk drives.  So XFS is a great filesystem
--- but you'd better be running it on a UPS, or on a system which has
power fail interrupts and an OS that knows what to do.  Ext3, because
it does physical block journalling, does not suffer from this problem.
(Yes, Resierfs uses logical journalling as well, so it suffers from
the same problem.)

So perhaps it's not the job of the FS vendor to be responsible for
crap hardware or lazy sysadmins that don't do backups.  But a system
administrator who knows that he doesn't do backups frequently enough,
or is running on cheap, crap hardware, would be wise to consider
carefully which filesystem he/she wants to use given the systems
configuration and his backup habits.  

Me, I'll go for the robust filesystem, just on general principles.  As
a friend from the large-scale enterprise storage world once put it,
"Performance is Job 2.  Robustness is Job #1."  (Of course, if you
want to put your fragile filesystem on a multi-million dollar
enterprise storage system such as an IBM Shark or an EMC Symmetrix
box, I'm sure IBM or EMC will be happy to sell you one.  :-)

							- Ted
