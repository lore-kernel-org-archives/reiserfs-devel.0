From: Tom Vier <tmv@comcast.net>
Subject: Re: Need Warm Fuzzies, ReiserFS (3)
Date: Mon, 20 Dec 2004 14:23:25 -0500
Message-ID: <20041220192325.GB12169@zero>
References: <41C66615.5010206@simutronics.com> <200412201331.25180.christian.mayrhuber@gmx.net> <20041220153840.GA11409@zero> <200412201725.03216.christian.mayrhuber@gmx.net>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22857-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200412201725.03216.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

On Mon, Dec 20, 2004 at 05:25:03PM +0100, Christian Mayrhuber wrote:
> Disk barriers are only in since 2.6.9, so maybe these get turned on per 
> default after some more testing. That did happen to the data=ordered journal 
> mode.

I was under the impression that they were on by default. I wish this was
documented somewhere; it's very important and i bet a LOT of sysadmins don't
even consider the problems of having write-back caching enabled. At least
most scsi drives come with it disabled by default. There's only wb support
for ata and sata, fwih, too.

A quick grep didn't help me find if there's any other barrier mode other
than flush. It looked like reiserfs had support specifically for flush mode.
I would have thought it'd be done just as a call to something like blkwb().



What about software raid? Are the barriers pushed through the raid layer?



There's been some interesting discussion about this subject on the netbsd
tech-kern list, btw.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
