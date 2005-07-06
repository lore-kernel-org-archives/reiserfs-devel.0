From: "Al Boldi" <a1426z@gawab.com>
Subject: RE: XFS corruption during power-blackout
Date: Wed, 6 Jul 2005 07:24:03 +0300
Message-ID: <200507060424.HAA27591@raad.intranet>
References: <20050705181057.GA16422@kevlar.burdell.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20050705181057.GA16422@kevlar.burdell.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Sonny Rao' <sonny@burdell.org>
Cc: 'Jens Axboe' <axboe@suse.de>, 'David Masover' <ninja@slaphack.com>, 'Chris Wedgwood' <cw@f00f.org>, 'Nathan Scott' <nathans@sgi.com>, linux-xfs@oss.sgi.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

Sonny Rao wrote: {
> > > >On Wed, Jun 29, 2005 at 07:53:09AM +0300, Al Boldi wrote:
> > > >>What I found were 4 things in the dest dir:
> > > >>1. Missing Dirs,Files. That's OK.
> > > >>2. Files of size 0. That's acceptable.
> > > >>3. Corrupted Files. That's unacceptable.
> > > >>4. Corrupted Files with original fingerprint. That's ABSOLUTELY 
> > > >>unacceptable.
> > > >
> > 2. Moral of the story is: What's ext3 doing the others aren't?
> 
> Ext3 has stronger guaranties than basic filesystem consistency.
> I.e. in ordered mode, file data is always written before metadata, so 
> the worst that could happen is a growing file's new data is written 
> but the metadata isn't updated before a power failure... so the new 
> writes wouldn't be seen afterwards.
> 
I believe in newer 2.6 kernels that Reiser has ordered mode (IIRC, courtesy
of Chris Mason), but XFS and JFS do not support it.
}

Was ordered mode disabled/removed when XFS was add to the vanilla-kernel?


