From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 22:56:07 +0200
Message-ID: <200408272256.07619.christian.mayrhuber@gmx.net>
References: <Pine.LNX.4.44.0408271010300.10272-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20945-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0408271010300.10272-100000@chimarrao.boston.redhat.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

On Friday 27 August 2004 16:12, Rik van Riel wrote:

> Because not everybody uses tar.  Quite a few people use a
> network backup system, while others use duplicity, RPM uses
> cpio internally and big companies tend to use proprietary
> network backup suites.
Big backup systems support scripts that can be run prior to
backup and post restore. You aready have to use star to
do a metadata backup the acl's/ea into some tgz, which
can be unpacked after restore.

> Breaking people's setup is something to worry about.
Yeah, maybe. But as usual on UN*X  like systems most admins
are able to come up with a quick shell/perl script to solve their
particular problem.

-- 
lg, Chris
