From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Odd Block allocation behavior on Reiser3
Date: Tue, 10 Aug 2004 21:31:36 -0400
Message-ID: <411976F8.2070004@suse.com>
References: <20040809201939.GA55683@kevlar.burdell.org> <1092083451.10651.218.camel@watt.suse.com> <20040809220459.GA57121@kevlar.burdell.org> <41187657.7030709@namesys.com> <20040810154514.GA67591@kevlar.burdell.org> <41190B5A.7070503@namesys.com> <1092162318.10651.365.camel@watt.suse.com> <1092163813.10651.372.camel@watt.suse.com> <20040810231219.GA72358@kevlar.burdell.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20216-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040810231219.GA72358@kevlar.burdell.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sonny Rao <sonny@burdell.org>
Cc: Chris Mason <mason@suse.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Sonny Rao wrote:
| On Tue, Aug 10, 2004 at 02:50:13PM -0400, Chris Mason wrote:
|
|>On Tue, 2004-08-10 at 14:25, Chris Mason wrote:
|>
|>>On Tue, 2004-08-10 at 13:52, Hans Reiser wrote:
|>>
|>>>Sonny Rao wrote:
|>>>
|>>>
|>>>>On Tue, Aug 10, 2004 at 12:16:39AM -0700, Hans Reiser wrote:
|>>>>
|>>>>
|>>>>
|>>>>>Interesting.What happens without overwrite, that is, if you write
more
|>>>>>files without deleting the old ones?
|>>>>>
|>>>>>
|>>>>
|>>>>Below I made 24 one gigabyte files in sequence
|>>>>All of them are similarly fragmented:
|>>>>data # filefrag *
|>>>>datafile0: 268 extents found
|>>>>
|>>>
|>>>this could explain some reiser3 performance problems.   This is what
|>>>happens when I spend all my time chasing funding and don't spend it
|>>>reviewing code and benchmarks, sigh.
|>>>
|>>>Thanks for spotting this.  I would be curious if this is occuring near
|>>>the transition between unformatted nodes and their parents, or
something
|>>>else.
|>>
|>>There have been a few threads on this on reiserfs-list
|>>
|>>singer:/data # dd if=/dev/zero of=foo bs=1MB count=1000
|>>1000+0 records in
|>>1000+0 records out
|>>singer:/data # filefrag foo
|>>foo: 1 extent found
|>>
|>>The new allocator really should be doing a better job here.
|>
|>Hmpf, that's what I get for expecting filefrag to work properly on
|>amd64.  The actual number of extents is 199, which is still better then
|>268.  Using fibmap, the fragmentation percentage is still the same as
|>ext3 (99.99% unfragmented) meaning the length between the extents is
|>quite small.
|>
|>If you mount with:
|>
|>mount -o alloc=skip_busy:oid_groups
|>
|>You get 8 extents on a 1GB file.
|>
|>This is because the oid grouping tries much harder to isolate the file
|>data from data from other files and metadata.  It is far from optimal
|>for normal usage, but for huge files it works nicely.
|>
|
|
| Is that "oid_groups" option present in the stock 2.6.7 kernel?  It
| didn't like that mount option, and a cursory grep for "oid_groups" in
| linux-2.6.7/fs/reiserfs/* doesn't show me anything.  The "skip_busy"
| option worked but didn't seem to change allocation behavior.

The oid_groups option is present in 2.6.8-pre releases, but only before
that from Chris Mason's FTP archive.

As far as skip_busy, there's two reasons for that: 1) The skip_busy
behavior was the default, and 2) skip_busy was never meant to be a full
scale allocation algorithm, just a way of keeping a pool of available
blocks close to already allocated files. When there's no hinting
involved, it ends up being poor for allocation - it will select the
first block available on disk when the file doesn't already exist. I
warned about this when I first submitted the code.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBGXb4LPWxlyuTD7IRAlFrAJ4lvW20RLzhFhLq4V0OMTDVFGsWwACfahaG
Jbb5Cq74+nI5Se90SdWrmsQ=
=hfS5
-----END PGP SIGNATURE-----
