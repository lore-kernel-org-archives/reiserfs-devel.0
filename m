From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: what do you do that stresses your filesystem?
Date: Mon, 23 Dec 2002 14:03:57 +0200
Message-ID: <20021223120357.GC13460@hvs.envisage.co.za>
References: <3E06F360.7000708@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12203-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E06F360.7000708@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

On Mon, Dec 23, 2002 at 02:28:32PM +0300, Hans Reiser wrote:
> We were discussing how to optimize reiser4 best, and came to realize 
> that us developers did not have a good enough intuition for what users 
> do that stresses their filesystem enough that they care about its 
> performance.


> Starting up complex and big applications like xemacs and mozilla would 
> be another.  Yes?

kernel/mozilla/KDE3 recompiles :)

Seriously though, those are massive packages that causes lots of I/Os.
The Lunar/Sorcerer/SourceMage solution was a tmpfs to extract the
sources to, and compile in the tmpfs. Thus, it would be interesting to 
compare the two scenarios with each other.

Another slowness (especially with reiserfs3 without the notails option) 
is "dd if=/dev/zero of=/swapfile bs=1k count=1024k"

Hendrik



