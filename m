From: Chris Mason <mason@suse.com>
Subject: Re: xattr
Date: 19 Jun 2003 11:21:24 -0400
Message-ID: <1056036084.6758.114.camel@tiny.suse.com>
References: <200306162226.39701.russell@coker.com.au>
	 <1056030719.6758.97.camel@tiny.suse.com>
	 <200306200046.52292.russell@coker.com.au>
	 <1056035446.1071.143.camel@moss-huskers.epoch.ncsc.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14628-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1056035446.1071.143.camel@moss-huskers.epoch.ncsc.mil>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephen Smalley <sds@epoch.ncsc.mil>
Cc: Russell Coker <russell@coker.com.au>, reiserfs-list@namesys.com

On Thu, 2003-06-19 at 11:10, Stephen Smalley wrote:

> > Creating a file by creating the xattr sounds like a bad idea as you can't 
> > control the Unix permissions of the file.  This isn't much of a big deal with 
> > SE Linux as the security type determines who can access the file.  But for 
> > other uses it may be a serious problem.
> > 
> > I agree that we need a new syscall and other people had the same idea before 
> > either of us.
> > 
> > Maybe ReiserFS could be used as the first implementation of this proposed new 
> > syscall...
> 
> No, this doesn't have to be done in the same transaction, even under the
> old SELinux API.  The setting of the file security label is performed by
> the security_inode_post_create/mkdir/... hook call in fs/namei.c, which
> is done while the parent directory semaphore is still held.  In the old
> API, the desired file security label was specified via
> open_secure/mkdir_secure/etc system calls and saved in the per-task
> security field for use by the security_inode_post_create/mkdir/...
> hook.  In the new API, the desired file security label is specified by
> writing it to /proc/pid/attr/fscreate and then performing an ordinary
> open()/mkdir()/etc call.  It is an attribute of the task that is applied
> to subsequent file creations, similar to the umask.
> 

Ok, so in the new api, the xattr information is available at the time of
the create.  reiserfs would be able to include it all into the same
transaction but doesn't do it right now.

> I seem to be missing a little context; last I looked, reiser in mainline
> kernels still didn't provide xattr support.  Will this be changing soon?

First we need to get the data logging code in (which Hans has agreed
to), getting the xattr code in depends on Hans, Jeff Mahoney will be
maintaining as an external patch otherwise.

-chris


