From: Chris Mason <mason@suse.com>
Subject: Re: using of XATTRs instead of pseudo files for accessing reiser4
	file attributes.
Date: Mon, 05 Apr 2004 08:46:26 -0400
Message-ID: <1081169185.3548.373.camel@watt.suse.com>
References: <20040405115439.GA1924@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17715-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040405115439.GA1924@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

On Mon, 2004-04-05 at 07:54, Alex Zarochentsev wrote:
> Hello,
> 
> Does anybody think that using linux extended attributes API would be good for
> accessing specific reiser4 file attributes?
> 
> Currently all that stuff is exported through pseudo files under "metas"
> subdirectory.  It might be good for scripting but it leads to security problems
> in legacy unix applications and it requires having +x permission on regular
> files or modifying linux VFS.  
> 
> It is not a problem to have two API for accessing file attributes, XATTR 
> and pseudo files.  At least XATTR will be usefull in places where security
> matters.

We've discussed this in private before, but I'll add my thoughts to the
public discussion.  

xattrs are the current linux api, you'll make it much easier for people
to use reiser4 by supporting it (in addition to whatever new and cool
API you develop).

-chris


