From: Stephen Smalley <sds@epoch.ncsc.mil>
Subject: Re: xattr
Date: 19 Jun 2003 13:25:15 -0400
Message-ID: <1056043514.1071.199.camel@moss-huskers.epoch.ncsc.mil>
References: <200306162226.39701.russell@coker.com.au>
	 <1056030719.6758.97.camel@tiny.suse.com>
	 <200306200046.52292.russell@coker.com.au>
	 <1056035446.1071.143.camel@moss-huskers.epoch.ncsc.mil>
	 <1056036084.6758.114.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14631-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1056036084.6758.114.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: Russell Coker <russell@coker.com.au>, reiserfs-list@namesys.com

On Thu, 2003-06-19 at 11:21, Chris Mason wrote:
> Ok, so in the new api, the xattr information is available at the time of
> the create.  reiserfs would be able to include it all into the same
> transaction but doesn't do it right now.

This was true of the old API as well; the only difference is whether the
attribute is specified as a parameter to an extended open/mkdir/etc call
or whether it is set separately as a process attribute that is applied
to subsequent ordinary open/mkdir/etc calls.  Including the setxattr in
the same transaction as the create is not strictly necessary, although
it would be nice.  The SELinux API change didn't change the create+set
atomicity, which is still provided by performing the set before the
parent directory semaphore is released.

> First we need to get the data logging code in (which Hans has agreed
> to), getting the xattr code in depends on Hans, Jeff Mahoney will be
> maintaining as an external patch otherwise.

My impression (possibly wrong) is that Hans prefers a EA-as-file model,
which I understand is also the Solaris model.  The key question then
becomes whether mainline reiser{3,4} will ever support the xattr inode
operations (e.g. implementing them as reads/writes of the EA files
associated with the inode).  If not, then neither the SELinux "module"
nor the SELinux userland will be able to access file security attributes
on reiser{3,4} in the same manner as on ext[23], xfs, or jfs.

-- 
Stephen Smalley <sds@epoch.ncsc.mil>
National Security Agency

