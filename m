From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck --blame-it-on-the-hardware-yeah-yeah
Date: Sun, 9 Feb 2003 13:01:17 +0300
Message-ID: <20030209130116.A32206@namesys.com>
References: <20030208005057.GA1059@horo.vilain.net> <20030208132044.A30757@namesys.com> <20030208224928.A30012@ns.soreal.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12679-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030208224928.A30012@ns.soreal.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam@Vilain.net
Cc: reiserfs-list@namesys.com, vitaly@namesys.com

Hello!

On Sat, Feb 08, 2003 at 10:49:28PM +0000, Sam@Vilain.net wrote:

> Ah, right, well that explains it.  It complained about block 524111,
> which would be physical block number 2096444.  This is off the end of
> the block device, which only has 2000061 blocks.

Aha, so this is indeed the problem.

> I acknowledge that I used `hda' where I should have used `hda1' for
> the simple read-test with dd, but did you not see the `badblocks'
> program output in the same e-mail?  `badblocks' read in the existing

Yes, I saw it.

> then wrote the original data back.  It detected no error anywhere in
> the block device.

That's good, it means your hard drive is probably ok.

> Therefore, your reiserfsck has a bug.  The whole point of a fsck is

Well, currently the logic is "If we cannot read some block, that
usually means this is a badblock".
And so it prints the message. Of course more testing about
if the block is beyond partition boundary should be probably added.

> that any data, anywhere, can be corrupted - and reiserfsck should not
> fall over because of it.  So, what you should do is carefully go

Sure, unfortunatelly interactive part of reiserfsck is not very mature.
And what do you think it should have done? Shrink the size of FS
to fit changed (may be because of corruption) partition size?
Enlarge the partition? What else?

> through your filesystem data structure, insert garbage in at each
> unique structural location, and run `reiserfsck' on it to see if it
> handles the problem correctly.  Then I'd suggest sollowing that up
> with some randomly corrupted filesystems.

Yup, we are running such tests. But thanks for suggestion.

> Looking at the source code, I now see why the --no-journal-available
> switch does not do anything if a `standard' journal is used rather
> than an off-device journal.  However, I would suggest that this test
> is superfluous, and the tool has more benefit to the system
> administrator if the test for a `standard' journal with
> fsck_skip_journal is removed, or perhaps replaced with a warning or
> another prompt.

We will think about it. Thanks for the idea.

> I'm going to try removing that test in the 3.x.1b version and see if
> the fsck completes.

Well, 3.x.1b should not be actually used, lots of bugs were fixed since then.

Thanks for the report.

Vitaly: We need a check that journal target block is in range of filesystem.
Please add this test.

Bye,
    Oleg
