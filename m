From: "Matthias Urlichs" <smurf@noris.de>
Subject: Re: fsck mode halfway between --fix-fixable and --rebuild-tree ?
Date: Tue, 1 Oct 2002 09:32:34 +0200
Message-ID: <20021001093234.H32363@noris.de>
References: <H356C4$4F46E50E852BF25DA1E850A48426FCDF@voila.fr> <20020929172335.L32363@noris.de> <20020930101824.A3895@namesys.com> <3D98318B.8000905@namesys.com> <20020930131744.X32363@noris.de> <20020930152204.A26742@namesys.com> <20020930150854.Z32363@noris.de> <3D984F92.4010509@namesys.com> <15769.17050.863426.305725@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11586-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <15769.17050.863426.305725@laputa.namesys.com>; from Nikita@Namesys.COM on Tue, Oct 01, 2002 at 10:37:14AM +0400
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Hans Reiser <reiser@namesys.com>, Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

Hi,

Nikita Danilov:
> Actually, B-link trees (B-trees with sibling pointers) don't require any
> additional io for sibling pointers maintenance. Just draw a picture of
> what is going on during insertion of new node or node deletion and you
> will see. B-link disadvantages are extra space required in a node to
> store the sibling pointer and unfriendliness to the "wandered logging".
> 
Would a wandering log really store the updated blocks themselves, or just
_log_ them?  In the latter case I don't see the difference between a
wandering log and the static log we have now; the former case looks like
it'd have to write at least three times as much log data (not only the
leaf block, but going all the way back to the root) even without taking
sibling blocks into account.

-- 
Matthias Urlichs     |     noris network AG     |     http://smurf.noris.de/
