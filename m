From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: using of XATTRs instead of pseudo files for accessing reiser4 file attributes.
Date: Mon, 5 Apr 2004 22:19:55 +0400
Message-ID: <20040405181955.GB11092@backtop.namesys.com>
References: <20040405115439.GA1924@backtop.namesys.com> <4071818C.4050609@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17731-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4071818C.4050609@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

On Mon, Apr 05, 2004 at 08:55:56AM -0700, Hans Reiser wrote:
> We are not going to use xattrs, get that through your head.

If people found xattr support useful in reiser4, someone would implement it,
not necessary one from reiser4 team.

> Hans
> 
> Alex Zarochentsev wrote:
> 
> >Hello,
> >
> >Does anybody think that using linux extended attributes API would be good 
> >for
> >accessing specific reiser4 file attributes?
> > 
> >
> 
> >Currently all that stuff is exported through pseudo files under "metas"
> >subdirectory.  It might be good for scripting but it leads to security 
> >problems
> >in legacy unix applications and it requires having +x permission on regular
> >files or modifying linux VFS.  
> >
> >It is not a problem to have two API for accessing file attributes, XATTR 
> >and pseudo files.  At least XATTR will be usefull in places where security
> >matters.
> >
> >Regards,
> >Alex.
> >
> >
> > 
> >
> 
> 
> -- 
> Hans
> 
> 

-- 
Alex.
