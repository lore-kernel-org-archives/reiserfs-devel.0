From: Stephen Smalley <sds@epoch.ncsc.mil>
Subject: Re: xattr
Date: 19 Jun 2003 14:52:42 -0400
Message-ID: <1056048762.1071.263.camel@moss-huskers.epoch.ncsc.mil>
References: <200306162226.39701.russell@coker.com.au>
	 <1056030719.6758.97.camel@tiny.suse.com>
	 <200306200046.52292.russell@coker.com.au>
	 <1056035446.1071.143.camel@moss-huskers.epoch.ncsc.mil>
	 <1056036084.6758.114.camel@tiny.suse.com>
	 <1056043514.1071.199.camel@moss-huskers.epoch.ncsc.mil>
	 <1056045995.6758.139.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14633-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1056045995.6758.139.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: Russell Coker <russell@coker.com.au>, reiserfs-list@namesys.com

On Thu, 2003-06-19 at 14:06, Chris Mason wrote:
> Ok, I get it.  You would need a special reiserfs xattr add on patch to
> get the atomicity right.

I don't think so.  If you crash between the create and the setxattr,
you'll just have an empty file that has no xattr, which will effectively
just cause it to be mapped to a default security label until an xattr is
set administratively.  No real harm.

> The reiserfsv3 xattr patches maintained by SuSE implement the xattr api
> (acl.bestbits.at).  The xattrs happen to be implemented as individual
> files on disk because reiserfs is so well suited for it, and because it
> allowed Jeff to code them without changing the v3 disk format.
> 
> But, these files are only available through the xattr api right now, and
> they are not visible via tools like ls etc.

Which is what we would want.  SELinux userland will only access them via
xattr API (actually via a SELinux API wrapped around the xattr calls to
encapsulate the use of xattr and the specific xattr name).

-- 
Stephen Smalley <sds@epoch.ncsc.mil>
National Security Agency

