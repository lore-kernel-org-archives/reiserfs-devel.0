From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: development
Date: Tue, 6 Jan 2004 19:44:13 -0700
Message-ID: <20040107024413.GF1042@schnapps.adilger.int>
References: <3FFB16CD.8020805@mrs.umn.edu> <3FFB19AE.8080007@namesys.com> <20040107022330.GA2930@zero>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16436-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040107022330.GA2930@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com

On Jan 06, 2004  21:23 -0500, Tom Vier wrote:
> On Tue, Jan 06, 2004 at 11:25:18PM +0300, Hans Reiser wrote:
> > We use UML for everything it can be used for.
> 
> what about putting the core code in a lib and using a file for storage? once
> it stabilizes, remove the userland stuff and hook it up to the vfs.
> actually, you could write it all for the vfs and the blk layer. just
> emulated them in userspace. the app could load the lib and call the vfs
> entry points. the core could use routines in a blkemu.c module that would
> translate them to regular read/write calls.

Except UML already "emulates" the VM, threads, locking, etc perfectly in
user space.  There is basically no point in trying to create an emulator
better than UML, since for filesystem and other "non-hardware" kernel
development it is a perfect kernel emulator.  The only thing you don't
(currently) get is SMP support, so no spinlocks, etc.

Also, with just a simple library you can't really run applications against
it unless you also compile the applications where the library replaces
the stdio and normal Unix IO calls.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

