From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Need Warm Fuzzies, ReiserFS (3)
Date: Mon, 20 Dec 2004 17:25:03 +0100
Message-ID: <200412201725.03216.christian.mayrhuber@gmx.net>
References: <41C66615.5010206@simutronics.com> <200412201331.25180.christian.mayrhuber@gmx.net> <20041220153840.GA11409@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22852-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041220153840.GA11409@zero>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Monday 20 December 2004 16:38, Tom Vier wrote:
> On Mon, Dec 20, 2004 at 01:31:25PM +0100, Christian Mayrhuber wrote:
> > The barrier mount option should provide protection against a corrupted
> > journal during power failure for drives with write caching enabled.
> > (Mostly IDE)
> 
> There's a mount option for write barriers? It should be enabled by default.
> Otherwise, that's asking for tons of users with corruption. 
http://www.kernel.org/pub/linux/kernel/v2.6/ChangeLog-2.6.9

Before disk barriers you had to disable harddisk write caching to prevent
journal corruption. This is what nearly no one did and blamed the
filesystems instead.

Disk barriers are only in since 2.6.9, so maybe these get turned on per 
default after some more testing. That did happen to the data=ordered journal 
mode.

-- 
lg, Chris
