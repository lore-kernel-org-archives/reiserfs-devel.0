From: Jeff Mahoney <jeffm@suse.com>
Subject: Why larger extent counts aren't necessarily bad (was Re: Odd Block
 allocation behavior on Reiser3)
Date: Tue, 10 Aug 2004 16:12:10 -0400
Message-ID: <41192C1A.6080909@suse.com>
References: <20040809201939.GA55683@kevlar.burdell.org> <1092083451.10651.218.camel@watt.suse.com> <20040809220459.GA57121@kevlar.burdell.org> <41187657.7030709@namesys.com> <20040810154514.GA67591@kevlar.burdell.org> <41190B5A.7070503@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20217-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41190B5A.7070503@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Sonny Rao <sonny@burdell.org>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
| Sonny Rao wrote:

|> Below I made 24 one gigabyte files in sequence
|> All of them are similarly fragmented:
| this could explain some reiser3 performance problems.   This is what
| happens when I spend all my time chasing funding and don't spend it
| reviewing code and benchmarks, sigh.
|
| Thanks for spotting this.  I would be curious if this is occuring near
| the transition between unformatted nodes and their parents, or something
| else.

Having a high extent count isn't indicative of fragmentation negatively
affecting performance. In fact, it may be just the opposite.

I modified filefrag.c to display the displacement between the extents,
and the average extent length. My disk was only 9 GB, so I had to limit
my test to 8 1 GB files, but the results are the same - it's a
sequential write. The number of files has no bearing on the result.

For this workload, the patterns are so simple, it's distributed almost
perfectly. Even using the skip_busy algorithm by itself (a practice I
warned about over a year ago) produces acceptible results. The results
showed an median extent length of 1023 extents (1 less than contained in
an indirect pointer block), followed by a median extent displacement of
2 blocks. For all intents and purposes, the file is contiguous, with
metadata interspersed.

The pattern of a streaming read/write operation would be like so:
Locate file, locate first indirect pointer block, read blocks, find next
indirect pointer block, read blocks, ...

In the perceived "ideal" fragementation pattern of 9 fragments
(1024MB/128MB - 4k per bitmap + 8*4k remainder), the metadata is not
interspersed with the file data. It makes the fragmentation extent
number look nice and low, but it really means that every time we need to
read another indirect pointer block, we're seeking outside the data
stream, reading a few blocks (readahead), and seeking back.

In the fragmentation pattern created using the new allocation algorithms
that Chris and I developed, you'll get a higher fragmentation number,
but the extents are close together, and the pointer blocks are already
read in due to readahead. The "actual" fragmentation is lower than the
"ideal" case above since less seeking is required.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBGSwaLPWxlyuTD7IRAkwWAJ4uPTDcvSAgKpJm6KA4KMcSDb5iKwCcDjKN
cdMveSkc/zsVdGzsZvx5SsM=
=l45w
-----END PGP SIGNATURE-----
