From: Tom Vier <tmv@comcast.net>
Subject: Re: need attrs patch for 2.5.44-ac3
Date: Mon, 28 Oct 2002 19:09:23 -0500
Message-ID: <20021029000923.GA527@yzero>
References: <20021026230215.GA3258@yzero> <20021028193322.C1171@namesys.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-11818-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <20021028193322.C1171@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Mon, Oct 28, 2002 at 07:33:22PM +0300, Oleg Drokin wrote:
> On Sat, Oct 26, 2002 at 07:02:15PM -0400, Tom Vier wrote:
> > is there a 2.5 attrs patch? i can't even list them in 2.5 on a reiserfs. i
> > get "inappropriate ioctl for device".
> 
> See attached, I do not claim it will apply cleanly, though.
> My tree have bunch of other reiserfs pending stuff that was not yet accepted
> by Linus.

i fixed it for 2.4.44-ac5 (minor change). lsattr and chattr now work
properly, but +A has no effect. atime is still updated.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0xE6CB97DA
