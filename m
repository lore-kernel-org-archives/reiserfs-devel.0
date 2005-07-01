From: "Al Boldi" <a1426z@gawab.com>
Subject: RE: XFS corruption during power-blackout
Date: Fri, 1 Jul 2005 17:05:11 +0300
Message-ID: <200507011405.RAA27425@raad.intranet>
References: <20050701092412.GD2243@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20050701092412.GD2243@suse.de>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jens Axboe' <axboe@suse.de>, 'David Masover' <ninja@slaphack.com>
Cc: 'Chris Wedgwood' <cw@f00f.org>, 'Nathan Scott' <nathans@sgi.com>, linux-xfs@oss.sgi.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

Jens Axboe wrote: {
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

And the same (and others) disks will not honor a flush anyways. 
Moral of that story - avoid bad hardware.
}

1. Sync is not the issue. The issue is whether a journaled FS can detect
corrupted files and flag them after a power-blackout!
2. Moral of the story is: What's ext3 doing the others aren't?

