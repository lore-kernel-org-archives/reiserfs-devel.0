From: Oleg Drokin <green@namesys.com>
Subject: Re: fsck mode halfway between --fix-fixable and --rebuild-tree ?
Date: Mon, 30 Sep 2002 15:22:04 +0400
Message-ID: <20020930152204.A26742@namesys.com>
References: <H356C4$4F46E50E852BF25DA1E850A48426FCDF@voila.fr> <20020929172335.L32363@noris.de> <20020930101824.A3895@namesys.com> <3D98318B.8000905@namesys.com> <20020930131744.X32363@noris.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11571-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020930131744.X32363@noris.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Urlichs <smurf@noris.de>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Sep 30, 2002 at 01:17:44PM +0200, Matthias Urlichs wrote:

> When I tried this, reiserfsck with -S scanned the whole disk, as expected.
> Reiserfsck without -S said it would scan roughly half of my disk. That led

Yes. It scans all the blocks that are marked as "used" in bitmap.

> me to conclude that whatever it does, it doesn't just use the blocks which
> are actually used for the tree at the moment.

How can it know? It must find all the lost blocks too.

> How does reiserfsck determine which blocks contain leaf nodes, anyway?

If it finds tree node header in some block, it thinks this is a tree node
and adds it into the tree.

Bye,
    Oleg
