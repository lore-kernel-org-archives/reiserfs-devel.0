From: "Alexey Polyakov" <alexey.polyakov@gmail.com>
Subject: Re: reiser4: first impression (vs xfs and jfs)
Date: Tue, 23 May 2006 23:13:05 +0400
Message-ID: <b5d90b2a0605231213q3857eb6apb0c8525ad3728070@mail.gmail.com>
References: <20060523155102.GB25889@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28672-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060523155102.GB25889@zero>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com

Hi Tom,

what kind of raid do you use? Is it software md, or a hw raid solution?
Also, what's the size of your r4 partition?

On 5/23/06, Tom Vier <tmv@comcast.net> wrote:
> I finally decided to try a few different fs'es on my 250gig raid1. (I use
> reiserfs3 most of the time.) Here's some things i noticed, between r4, xfs,
> and jfs.
>
> Both r4 and xfs suffer from io pauses. This is on a dual 2.6ghz opteron,
> btw. I don't see high cpu usage, but clock throttling could be screwing up
> top's % calcs (tho i think all usage is measured by time, so it shouldn't).
>
> What i'm doing is rsyncing from a slower drive (on 1394) to the raid1 dev.
> When using r4 (xfs behaves similarly), after several seconds, reading from
> the source and writing to the destination stops for 3 or 4 seconds, then
> brief burst of writes to the r4 fs (the dest), a 1 second pause, and then
> reading and periodic writes resume, until it happens again.
>
> It seems that both r4 and xfs allow a large number of pages to be dirtied,
> before queuing them for writeback, and this has a negative effect on
> throughput. In my test (rsync'ing ~50gigs of flacs), r4 and xfs are almost
> 10 minutes slower than jfs.
>
> One thing that surprised me was, once r4 does write out, it is very fast.
> Fast enough that i wasn't sure it was actually writing whole files! However,
> i did a umount; mount and ran cksum, and sure enough, the files were good.
> 8)
>
> --
> Tom Vier <tmv@comcast.net>
> DSA Key ID 0x15741ECE
>


-- 
Alexey Polyakov
