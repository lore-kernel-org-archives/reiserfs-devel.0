From: Hans Reiser <reiser@namesys.com>
Subject: Re: using of XATTRs instead of pseudo files for accessing reiser4
 file attributes.
Date: Mon, 05 Apr 2004 08:55:56 -0700
Message-ID: <4071818C.4050609@namesys.com>
References: <20040405115439.GA1924@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17728-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040405115439.GA1924@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

We are not going to use xattrs, get that through your head.

Hans

Alex Zarochentsev wrote:

>Hello,
>
>Does anybody think that using linux extended attributes API would be good for
>accessing specific reiser4 file attributes?
>  
>

>Currently all that stuff is exported through pseudo files under "metas"
>subdirectory.  It might be good for scripting but it leads to security problems
>in legacy unix applications and it requires having +x permission on regular
>files or modifying linux VFS.  
>
>It is not a problem to have two API for accessing file attributes, XATTR 
>and pseudo files.  At least XATTR will be usefull in places where security
>matters.
>
>Regards,
>Alex.
>
>
>  
>


-- 
Hans


