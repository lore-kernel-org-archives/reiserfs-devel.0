From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck mode halfway between --fix-fixable and --rebuild-tree ?
Date: Wed, 2 Oct 2002 15:04:16 +0400
Message-ID: <200210021504.16105.vitaly@namesys.com>
References: <20020930101824.A3895@namesys.com> <3D99ECDE.7050904@namesys.com> <20021002101343.M20612@noris.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11601-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021002101343.M20612@noris.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matthias Urlichs <smurf@noris.de>
Cc: reiserfs-list@namesys.com

On Wednesday 02 October 2002 12:13, Matthias Urlichs wrote:
> Hi,
>
> One other idea I've had yesterday to speed up --rebuild-tree on a big
> full disk...
>
> Reiserfsck starts with a bitmap of blocks which might hold B-tree nodes.
> The idea is to walk through the existing tree and clear those bits in the
> bitmap which actually belong to some file -- those cannot hold metadata.

You forget that pointers can be broken and an unformatted pointer from 
a leaf can point to another leaf or internal node. It is also possible 
to have a block pointed many times by either unformatted or internal 
pointers.

> For extra safety, only consider fiels which haven't been modified for
> <insert_date_here>. Abort if you find a tree block which points to
> a block whose bit is not set -- either because it never was set in the
> first place (then you probably should use -S), or because it points into

And after abort you should probably set all bits back in bitmap, right? 
Actually if the problem is in bad pointers or in bitmap only you can fix 
everything with --fix-fixable. If there is a more complicated problem, 
like broken set of items or similar, you are going to abort, right? So you 
just can run --check and figure out if it is possible to solve a problem 
with fix-fixable.

> a file (then you should set the date back, or use the original mode).
> Thoughts? Price?  ;-)

Actually, I am going to implement a bit different algorithm in reiser4fsck,
which will probably satisfy your wishes. Before rebuilding the tree I am 
going to walk the whole tree and cut the corrupted subtrees out, and then 
rebuild only "used" part of the partition which is not in the tree yet.
So if some part of the tree looks correct, I am not going to rebuild it at 
all, if some part of the tree does not, I do not consider its pointers as 
reliable to change a bitmap.

-- 

Thanks,
Vitaly Fertman

