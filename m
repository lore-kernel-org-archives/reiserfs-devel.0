From: Alistair John Strachan <s0348365@sms.ed.ac.uk>
Subject: Re: XFS corruption during power-blackout
Date: Fri, 1 Jul 2005 17:35:30 +0100
Message-ID: <200507011735.30229.s0348365@sms.ed.ac.uk>
References: <200507011405.RAA27425@raad.intranet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <200507011405.RAA27425@raad.intranet>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Al Boldi <a1426z@gawab.com>
Cc: 'Jens Axboe' <axboe@suse.de>, 'David Masover' <ninja@slaphack.com>, 'Chris Wedgwood' <cw@f00f.org>, 'Nathan Scott' <nathans@sgi.com>, linux-xfs@oss.sgi.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

On Friday 01 Jul 2005 15:05, Al Boldi wrote:
> Jens Axboe wrote: {
>
> On Fri, Jul 01 2005, David Masover wrote:
> > Chris Wedgwood wrote:
> > >On Wed, Jun 29, 2005 at 07:53:09AM +0300, Al Boldi wrote:
> > >>What I found were 4 things in the dest dir:
> > >>1. Missing Dirs,Files. That's OK.
> > >>2. Files of size 0. That's acceptable.
> > >>3. Corrupted Files. That's unacceptable.
> > >>4. Corrupted Files with original fingerprint. That's ABSOLUTELY
> > >>unacceptable.
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
> 2. Moral of the story is: What's ext3 doing the others aren't?
>

I agree, I've used XFS for about three years on Linux now, and whilst I love 
the performance and self-repair attributes of the filesystem, I do think it 
leaves a lot to be desired when it comes to file corruption.

In my experience, using a standard XFS log/volume setup on the same physical, 
cheap IDE HD, any files open at the time as a power down or hardware lockup 
end up being filled either with zeros, or garbage.

However, I'd far rather lose a few files once in a blue moon than have to sit 
through 10 minute fsck's every time the kernel crashes or I kick out the 
plugs.

-- 
Cheers,
Alistair.

personal:   alistair()devzero!co!uk
university: s0348365()sms!ed!ac!uk
student:    CS/CSim Undergraduate
contact:    1F2 55 South Clerk Street,
            Edinburgh. EH8 9PP.
