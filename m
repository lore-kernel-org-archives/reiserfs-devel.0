From: "Matthias Urlichs" <smurf@noris.de>
Subject: fsck mode halfway between --fix-fixable and --rebuild-tree ?
Date: Sun, 29 Sep 2002 17:23:35 +0200
Message-ID: <20020929172335.L32363@noris.de>
References: <H356C4$4F46E50E852BF25DA1E850A48426FCDF@voila.fr>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11557-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <H356C4$4F46E50E852BF25DA1E850A48426FCDF@voila.fr>; from arthur.chereau@voila.fr on Sat, Sep 28, 2002 at 11:28:52AM +0200
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

yesterday I had a small problem with reiserfsck --fix-fixable --
apparently two of the tree nodes were wrongly linked.

The only way to fix this, at the moment, seems to be --rebuild-tree, which
is overkill since it scans _everything_, and thus reconnected the stuff I
deleted last week back into /lost+found.  It also takes too long.  :-/

A good way to avoid this problem would be a scan mode which behaves like
--rebuild-tree, but which scans only those nodes reachable through the
existing tree instead of "everything".

Comments?

-- 
Matthias Urlichs     |     noris network AG     |     http://smurf.noris.de/
