From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 errors
Date: Wed, 25 Feb 2004 17:42:12 +0300
Message-ID: <200402251742.12597.vitaly@namesys.com>
References: <20040224234137.GA21990@pillars.net> <200402251531.58759.vitaly@namesys.com> <403CA493.3010508@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16932-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <403CA493.3010508@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Bob Vincent <bobvin@pillars.net>, reiserfs-list@namesys.com

On Wednesday 25 February 2004 16:35, Hans Reiser wrote:
> Vitaly Fertman wrote:
> >Hello,
> >
> >On Wednesday 25 February 2004 02:41, Bob Vincent wrote:
> >>I've been playing around with reiser4 on a non-critical machine at work,
> >>and managed to corrupt a 20-gig reiser4 partition.
> >>
> >>I've run fsck.reiser4 several times to no avail; finally downloaded
> >>and compiled the 2.6.3-internal-testing-going-on version of the utils.
> >>
> >>(much later...)
> >>
> >>Well, unlike the other versions; this one completed the fsck okay.
> >>
> >>Just wondering what the following message means?
> >>
> >>  Warning: Can't find stat data extension plugin by its id 0x4.
> >>
> >>I see it quite often.
> >
> >If an object is created with some non standard plugins, their ids
> >are stored in the special extention of the object stat data. But this
> >extention plugin is not ready in the progs yet.
>
> Why is fsck finding non-standard plugins on his computer?

fsck found 4th bit set in the extension mask for this file, not non-standard 
plugins. 

As I know Bob could call ioctl(UNPACK) on this file, probably smth else?
Another reason is a corruption.

-- 
Thanks,
Vitaly Fertman
