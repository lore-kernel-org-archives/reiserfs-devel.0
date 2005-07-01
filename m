From: Jens Axboe <axboe@suse.de>
Subject: Re: XFS corruption during power-blackout
Date: Fri, 1 Jul 2005 11:24:14 +0200
Message-ID: <20050701092412.GD2243@suse.de>
References: <20050629001847.GB850@frodo> <200506290453.HAA14576@raad.intranet> <556815.441dd7d1ebc32b4a80e049e0ddca5d18e872c6e8a722b2aefa7525e9504533049d801014.ANY@taniwha.stupidest.org> <42C4FC14.7070402@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24885-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <42C4FC14.7070402@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Chris Wedgwood <cw@f00f.org>, Al Boldi <a1426z@gawab.com>, 'Nathan Scott' <nathans@sgi.com>, linux-xfs@oss.sgi.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

On Fri, Jul 01 2005, David Masover wrote:
> Chris Wedgwood wrote:
> >On Wed, Jun 29, 2005 at 07:53:09AM +0300, Al Boldi wrote:
> >
> >
> >>What I found were 4 things in the dest dir:
> >>1. Missing Dirs,Files. That's OK.
> >>2. Files of size 0. That's acceptable.
> >>3. Corrupted Files. That's unacceptable.
> >>4. Corrupted Files with original fingerprint. That's ABSOLUTELY
> >>unacceptable.
> >
> >
> >disk usually default to caching these days and can lose data as a
> >result, disable that
> 
> Not always possible.  Some disks lie and leave caching on anyway.

And the same (and others) disks will not honor a flush anyways. Moral of
that story - avoid bad hardware.

-- 
Jens Axboe

