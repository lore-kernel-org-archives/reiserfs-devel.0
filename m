From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Recursive modfied-timestamp?
Date: Fri, 31 Dec 2004 19:51:45 -0500 EST
Message-ID: <16405639493-BeMail@cr593174-a>
References: <200412311047.14634.namesys.Sch@ttgen.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23013-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200412311047.14634.namesys.Sch@ttgen.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Fred Schaettgen <namesys.Sch@ttgen.net>
Cc: reiserfs-list@namesys.com

Fred Schaettgen wrote on Fri, 31 Dec 2004 10:47:14 +0100:
> The purpose btw. is to find all modified files in a tree as fast as possible. 
> There are quite a lot of application which would benefit from it: desktop 
> search engines, locate, build systems, tools which visualize contents of a 
> file system (like fsview in KDE), backup tools etc.

Does it have to be recursive?  BeOS has an index for the last modified date
of all files so it's easy to find all files modified in a given range of
dates.  I expect that modern file systems could have something similar.

However, the BeOS index system is global to a disk volume, so finding
recently changed files in a tree means finding recent files then throwing
out the ones outside the tree.  That awkwardness has grated against the
nerves of many a BeOS user.  But nobody has sat down to figure out a
better solution to the underlying problem (indices stored per directory?).

- Alex
