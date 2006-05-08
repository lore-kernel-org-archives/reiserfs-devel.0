From: "Nate Diller" <nate.diller@gmail.com>
Subject: Re: Comparing LFS and reiserfs4
Date: Mon, 8 May 2006 13:08:15 -0700
Message-ID: <5c49b0ed0605081308q493b54bcsec148ed96528a7d@mail.gmail.com>
References: <200605071456.12974.kris@koehntopp.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28590-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200605071456.12974.kris@koehntopp.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kristian Koehntopp <kris@koehntopp.de>
Cc: reiserfs-list@namesys.com

On 5/7/06, Kristian Koehntopp <kris@koehntopp.de> wrote:
>
> I am looking for a paper that contrasts the write strategies and organisa=
tion
> of reiser4 vs. the old Sprite and BSD Log Based File System (LFS).
>
> Does such a thing exist?

no, but it should, it would be very interesting.  there are a couple
out-of-tree LFS implementions for linux floating around, too, that
could be compared in a set of benchmarks.

Reiser4's write strategy could be said to be a combination of LFS and
WAFL, since the original LFS used inodes and indirect blocks, where
WAFL and Reiser4 use tree structures.  Reiser4 also does some in-place
"overwrite" updates, where the data is written to journal blocks for
atomicity, but is then copied over the old data to optimize read
performance.  So although Reiser4 always flushes data to a continuous
stream like LFS, it sometimes does extra work also.

The comments at the top of the Reiser4 source files are probably the
most detailed and up-to-date descriptions of the flush strategy.  it's
not much, i admit, but it's better than most other linux code...

NATE
