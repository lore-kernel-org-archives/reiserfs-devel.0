From: Oleg Drokin <green@namesys.com>
Subject: Re: ReiserFS is not suitable for a root FS.
Date: Sat, 17 May 2003 15:24:46 +0400
Message-ID: <20030517112446.GA20672@namesys.com>
References: <200305172030.58775.russell@coker.com.au> <20030517105633.GA20463@namesys.com> <200305172109.53538.russell@coker.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14138-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200305172109.53538.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell Coker <russell@coker.com.au>
Cc: ReiserFS <reiserfs-list@namesys.com>

Hello!

On Sat, May 17, 2003 at 09:09:53PM +1000, Russell Coker wrote:
> > Well, if you cannot mount root fs and kernel crashes during that process,
> > you must boot off some other media because your fsck is still located on
> > this root filesytem.
> > This is true for any filesystem.
> The difference is that with other file systems the kernel code seems to be 
> considerably less likely to crash.

Well, we try to handle all the cases in a good way.

> If the kernel can mount a file system but some directory entries, inodes, or 
> other meta-data are corrupt then there is no excuse for crashing.  The files 

We are accepting metadata snapshots in such cases and trying to make necessary fixes.
Where can we grab snapshots from your cases?

> or directories should simply be inaccessable.  Ideally the kernel will log a 
> message and either re-mount the file-system read-only or panic (in an orderly 
> fashion) at the administrator's choice.

Yes, that would be nice, of course. We started some work in this direction some time ago,
but we are not yet finished.

> Having the kernel just trash system memory because of bad data on disk is a 
> bug.

You cannot check all the on disk values, this is too bik performance impact.
Nobody does that in Linux, I think.

Bye,
    Oleg
