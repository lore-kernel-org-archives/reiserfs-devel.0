From: Sonny Rao <sonny@burdell.org>
Subject: Re: XFS corruption during power-blackout
Date: Tue, 5 Jul 2005 11:49:19 -0400
Message-ID: <20050705154919.GA13262@kevlar.burdell.org>
References: <20050701092412.GD2243@suse.de> <200507011405.RAA27425@raad.intranet>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200507011405.RAA27425@raad.intranet>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Boldi <a1426z@gawab.com>
Cc: 'Jens Axboe' <axboe@suse.de>, 'David Masover' <ninja@slaphack.com>, 'Chris Wedgwood' <cw@f00f.org>, 'Nathan Scott' <nathans@sgi.com>, linux-xfs@oss.sgi.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

On Fri, Jul 01, 2005 at 05:05:11PM +0300, Al Boldi wrote:
> Jens Axboe wrote: {
> On Fri, Jul 01 2005, David Masover wrote:
> > Chris Wedgwood wrote:
> > >On Wed, Jun 29, 2005 at 07:53:09AM +0300, Al Boldi wrote:
> > >
> > >
> > >>What I found were 4 things in the dest dir:
> > >>1. Missing Dirs,Files. That's OK.
> > >>2. Files of size 0. That's acceptable.
> > >>3. Corrupted Files. That's unacceptable.
> > >>4. Corrupted Files with original fingerprint. That's ABSOLUTELY 
> > >>unacceptable.
> > >
> > >
> > >disk usually default to caching these days and can lose data as a 
> > >result, disable that
> > 
> > Not always possible.  Some disks lie and leave caching on anyway.
> 
> And the same (and others) disks will not honor a flush anyways. 
> Moral of that story - avoid bad hardware.
> }
> 
> 1. Sync is not the issue. The issue is whether a journaled FS can detect
> corrupted files and flag them after a power-blackout!

Journaling implies filesystem consistency, not data integrity, AFAIK.

> 2. Moral of the story is: What's ext3 doing the others aren't?

Ext3 has stronger guaranties than basic filesystem consistency.

I.e. in ordered mode, file data is always written before metadata, so
the worst that could happen is a growing file's new data is written
but the metadata isn't updated before a power failure... so the new
writes wouldn't be seen afterwards.  You should try the same test w/
ext3 in "writeback" mode and see if it fares better or worse in terms
of file corruption.

Sonny
