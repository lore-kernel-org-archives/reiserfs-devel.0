From: Oleg Drokin <green@namesys.com>
Subject: Re: fsck mode halfway between --fix-fixable and --rebuild-tree ?
Date: Mon, 30 Sep 2002 15:15:12 +0400
Message-ID: <20020930151512.A26655@namesys.com>
References: <H356C4$4F46E50E852BF25DA1E850A48426FCDF@voila.fr> <20020929172335.L32363@noris.de> <20020930101824.A3895@namesys.com> <3D98318B.8000905@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11568-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3D98318B.8000905@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Matthias Urlichs <smurf@noris.de>, reiserfs-list@namesys.com

Hello!

On Mon, Sep 30, 2002 at 03:12:11PM +0400, Hans Reiser wrote:

> Let's be more clear.  You must use the -S option to get it to behave in 
> the way you do not want.  Don't use -S, and it does what you want it to do.

In fact I want to stress that -S switch is not recommended to use by any
means on real filesystems. If you are really sure you need -S switch,
do a snapshot of the partition and run reiserfsck on that snapshot just to
prevent possible data loss/data corruption.

Bye,
    Oleg
