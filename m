From: Stephen Smalley <sds@epoch.ncsc.mil>
Subject: Re: xattr
Date: 19 Jun 2003 11:10:47 -0400
Message-ID: <1056035446.1071.143.camel@moss-huskers.epoch.ncsc.mil>
References: <200306162226.39701.russell@coker.com.au>
	 <1056030719.6758.97.camel@tiny.suse.com>
	 <200306200046.52292.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14626-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306200046.52292.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <russell@coker.com.au>
Cc: Chris Mason <mason@suse.com>, reiserfs-list@namesys.com

On Thu, 2003-06-19 at 10:46, Russell Coker wrote:
> On the topic of atomic xattr operations on ReiserFS as needed for the new 
> LSM/SE Linux operations.
> 
> On Thu, 19 Jun 2003 23:52, Chris Mason wrote:
> > How big are the xattrs you have in mind?  We can get atomic writes of 4k
> > in length but beyond that things get more difficult.

4k should be fine.

> > As for the xattr and the create in the same transaction, that's a little
> > harder.  We'd probably need a new syscall, or to change the semantics of
> > the xattr call such that creating an xattr on a file that doesn't exist
> > also creates the file.
> 
> Creating a file by creating the xattr sounds like a bad idea as you can't 
> control the Unix permissions of the file.  This isn't much of a big deal with 
> SE Linux as the security type determines who can access the file.  But for 
> other uses it may be a serious problem.
> 
> I agree that we need a new syscall and other people had the same idea before 
> either of us.
> 
> Maybe ReiserFS could be used as the first implementation of this proposed new 
> syscall...

No, this doesn't have to be done in the same transaction, even under the
old SELinux API.  The setting of the file security label is performed by
the security_inode_post_create/mkdir/... hook call in fs/namei.c, which
is done while the parent directory semaphore is still held.  In the old
API, the desired file security label was specified via
open_secure/mkdir_secure/etc system calls and saved in the per-task
security field for use by the security_inode_post_create/mkdir/...
hook.  In the new API, the desired file security label is specified by
writing it to /proc/pid/attr/fscreate and then performing an ordinary
open()/mkdir()/etc call.  It is an attribute of the task that is applied
to subsequent file creations, similar to the umask.

I seem to be missing a little context; last I looked, reiser in mainline
kernels still didn't provide xattr support.  Will this be changing soon?

-- 
Stephen Smalley <sds@epoch.ncsc.mil>
National Security Agency

