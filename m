From: Jeffrey Rice <jeffrice@finity.org>
Subject: Re: hans! i found a bug in reiser4 :((((
Date: Tue, 20 Apr 2004 15:14:59 -0400
Message-ID: <6.1.0.6.2.20040420151137.02ae2008@popfile>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18088-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


I would also like to confirm the bug with glibc and reiser4.  If I try to 
compile with my /usr as Reiser4, I get an "#include nested too deeply" 
error in syscalls.h.  If /usr is any other fs type, no problems.  It's hard 
to believe the fs should be the cause but it really appears to be the case.


*       *       *       *       *       *       *
Jeffrey Rice    ||     jeffrice@finity.org      ||  www.finity.org




