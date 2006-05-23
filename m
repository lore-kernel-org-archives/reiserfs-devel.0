From: "Gregory Maxwell" <gmaxwell@gmail.com>
Subject: Re: reiser4: first impression (vs xfs and jfs)
Date: Tue, 23 May 2006 15:08:07 -0400
Message-ID: <e692861c0605231208r2c9314e6sa8eed8204d1f08bf@mail.gmail.com>
References: <20060523155102.GB25889@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28668-reiserfs=m.gmane.org@namesys.com>
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

On 5/23/06, Tom Vier <tmv@comcast.net> wrote:
[snip]
> What i'm doing is rsyncing from a slower drive (on 1394) to the raid1 dev=
.
> When using r4 (xfs behaves similarly), after several seconds, reading fro=
m
> the source and writing to the destination stops for 3 or 4 seconds, then
> brief burst of writes to the r4 fs (the dest), a 1 second pause, and then
> reading and periodic writes resume, until it happens again.
>
> It seems that both r4 and xfs allow a large number of pages to be dirtied=
,
> before queuing them for writeback, and this has a negative effect on
> throughput. In my test (rsync'ing ~50gigs of flacs), r4 and xfs are almos=
t
> 10 minutes slower than jfs.
[snip]

Have you tested a pure write load? It may be that rsync's combined
reading writing is triggering a corner case for FSes with delayed
allocation. It may not be issuing it's checksumming reads far enough
ahead of time and end up disk latency bound.

It's interesting that you saw the same issues with XFS... I use XFS on
my audio workstation computer because  it (combined with a low latency
patched kernel) had by far the lowest worst case latencies of all the
FSes I tested at the time.
