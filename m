From: Oleg Drokin <green@namesys.com>
Subject: Re: ReiserFS is not suitable for a root FS.
Date: Sat, 17 May 2003 16:10:38 +0400
Message-ID: <20030517121038.GA929@namesys.com>
References: <200305172030.58775.russell@coker.com.au> <3EC61987.5000402@gmx.net> <200305172125.59713.russell@coker.com.au> <3EC6247C.4030605@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14143-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EC6247C.4030605@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Cc: Russell Coker <russell@coker.com.au>, ReiserFS <reiserfs-list@namesys.com>

Hello!

On Sat, May 17, 2003 at 02:01:00PM +0200, Carl-Daniel Hailfinger wrote:
> >>>With a ReiserFS file system you can't FSCK a file system that is mounted
> >>>read-only.  This means that when a root file system needs to be FSCK'd
> >>>you need to boot from installation media (or convert the swap space into
> >>>a temporary root file system).
> >>I take this as a feature request. Right? It would certainly be nice to
> >>have.
> > Yes.
> Oleg? Given a statically linked reiserfsck binary completely loaded into
> memory and an initrd below the reiserfs root filesystem, it should be
> possible to completely unmount the root fs because the initrd is still
> there and can serve as root fs.
> In this situation, reiserfsck sould have no problems anymore because the
> partition is not mounted at all.
> 

Initrd is not always present, you know. And sticking 300k (dynamic) or 600k (static)
reiserfsck in there is not all that fun probably.
Our current idea is to check if fsck is going to repair the
mounted partition and if this partition happens to contain the reiserfsck itself,
then mlockall() is done to page in all the pages of executable
(otherwise if we need to page something in in the middle of updating tree root pointer,
we won't be able to find anythig and die) and then proceed as normal.
This is still somewhat risky, though.
And if fsck will die in the middle of repairing rootfs (which still can happen) (And say it was
doing --rebuild-tree run), you won't be able to mount this fs anymore.

BTW, were there any news on "reiserfs corruptions on crypto loop mounted devices" tests with 2.4.21-rc2?

Thank you.

Bye,
    Oleg
