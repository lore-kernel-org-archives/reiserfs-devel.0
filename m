From: "Matthias Urlichs" <smurf@noris.de>
Subject: Re: fsck mode halfway between --fix-fixable and --rebuild-tree ?
Date: Mon, 30 Sep 2002 19:36:41 +0200
Message-ID: <20020930193641.B32363@noris.de>
References: <H356C4$4F46E50E852BF25DA1E850A48426FCDF@voila.fr> <20020929172335.L32363@noris.de> <20020930101824.A3895@namesys.com> <3D98318B.8000905@namesys.com> <20020930131744.X32363@noris.de> <20020930152204.A26742@namesys.com> <20020930150854.Z32363@noris.de> <3D984F92.4010509@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11579-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3D984F92.4010509@namesys.com>; from reiser@namesys.com on Mon, Sep 30, 2002 at 05:20:18PM +0400
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

Hi,

Hans Reiser:

> Is this the way they do it on disk?  We just have a link from parent to 
> child.  Maintaining on disk links to siblings would hurt performance as 
> the links would require updating.
> 
OK -- if you don't have side pointers, that makes my idea somewhat ;-)
less reliable. It might still be a good idea though.

-- 
Matthias Urlichs     |     noris network AG     |     http://smurf.noris.de/
