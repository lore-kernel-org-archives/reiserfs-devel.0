From: Alex Zarochentsev <zam@namesys.com>
Subject: using of XATTRs instead of pseudo files for accessing reiser4 file attributes.
Date: Mon, 5 Apr 2004 15:54:39 +0400
Message-ID: <20040405115439.GA1924@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17712-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello,

Does anybody think that using linux extended attributes API would be good for
accessing specific reiser4 file attributes?

Currently all that stuff is exported through pseudo files under "metas"
subdirectory.  It might be good for scripting but it leads to security problems
in legacy unix applications and it requires having +x permission on regular
files or modifying linux VFS.  

It is not a problem to have two API for accessing file attributes, XATTR 
and pseudo files.  At least XATTR will be usefull in places where security
matters.

Regards,
Alex.
