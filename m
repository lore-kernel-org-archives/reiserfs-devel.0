From: "Tom Evans" <tom@23palmer.net>
Subject: RE: Bitmap alignment issues....
Date: Thu, 10 Feb 2005 10:29:36 -0500
Message-ID: <3p803d$37lqf@smtp05.mrf.mail.rcn.net>
References: <20050210084002.GP7482@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050210084002.GP7482@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Alex Zarochentsev' <zam@namesys.com>
Cc: reiserfs-list@namesys.com



I am using what was the current 2.6.11 development line with the 
-mm patch series (that's what includes reiser4).
 
I am not certain if any of those patches were "required" - I just
needed it for reiser4 support.

I also may have spoke too soon about the patch - I tried doing a full
kernel build and at some time during the process, it crashed and
then that kernel directory started behaving oddly.

I received a kernel oops - don't have it with me, and then accesses to
that directory would "hang".


I realize my setup may be complicated, I am using a beta kernel, on a
non-x86,
with reiser4 on a LVM partition, so anything in that chain can be
responsible.

I had been running that kernel for several days without issues (except for
the alignment faults).

Is there a recommended kernel to use with reiser4?

Thanks again,

...tom

-----Original Message-----
From: Alex Zarochentsev [mailto:zam@namesys.com] 
Sent: Thursday, February 10, 2005 3:40 AM
To: Thomas Evans
Cc: reiserfs-list@namesys.com
Subject: Re: Bitmap alignment issues....

On Thu, Feb 10, 2005 at 12:10:14AM -0500, Thomas Evans wrote:
> 
> Thanks for the patch the helped with the vast majority of the fixups.
> 
> Now there are just a trickle occurring in various places - would it be 
> helpful for me to track them down, or are there folks who are already
pursuing this?

which kernel are you using for alpha axp ?   did it require additional
patches to vanilla kernel?

> ...tom
> 
--
Alex.
