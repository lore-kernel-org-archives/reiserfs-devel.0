From: "Matthias Urlichs" <smurf@noris.de>
Subject: Re: fsck mode halfway between --fix-fixable and --rebuild-tree ?
Date: Wed, 2 Oct 2002 10:13:43 +0200
Message-ID: <20021002101343.M20612@noris.de>
References: <20020930101824.A3895@namesys.com> <3D98318B.8000905@namesys.com> <20020930131744.X32363@noris.de> <20020930152204.A26742@namesys.com> <20020930150854.Z32363@noris.de> <3D984F92.4010509@namesys.com> <15769.17050.863426.305725@laputa.namesys.com> <3D998037.8030508@namesys.com> <20021001141508.L32363@noris.de> <3D99ECDE.7050904@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11600-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3D99ECDE.7050904@namesys.com>; from reiser@namesys.com on Tue, Oct 01, 2002 at 10:43:42PM +0400
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Nikita Danilov <Nikita@Namesys.COM>, Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

Hi,

One other idea I've had yesterday to speed up --rebuild-tree on a big
full disk...

Reiserfsck starts with a bitmap of blocks which might hold B-tree nodes.
The idea is to walk through the existing tree and clear those bits in the
bitmap which actually belong to some file -- those cannot hold metadata.

For extra safety, only consider fiels which haven't been modified for
<insert_date_here>. Abort if you find a tree block which points to
a block whose bit is not set -- either because it never was set in the
first place (then you probably should use -S), or because it points into
a file (then you should set the date back, or use the original mode).

Thoughts? Price?  ;-) 

-- 
Matthias Urlichs     |     noris network AG     |     http://smurf.noris.de/
