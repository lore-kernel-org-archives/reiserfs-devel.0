From: Oleg Drokin <green@namesys.com>
Subject: Re: possible bug - fsck shows perfect results, linux refuses to mount
Date: Mon, 31 Mar 2003 12:56:52 +0400
Message-ID: <20030331125652.H25533@namesys.com>
References: <20030331072250.GC22731@cherenkov.orbis-terrarum.net> <20030331113446.A31858@namesys.com> <20030331074957.GD22731@cherenkov.orbis-terrarum.net> <20030331120014.C25533@namesys.com> <20030331083758.GA23518@cherenkov.orbis-terrarum.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13465-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030331083758.GA23518@cherenkov.orbis-terrarum.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robin H. Johnson" <robbat2@orbis-terrarum.net>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Mar 31, 2003 at 12:37:58AM -0800, Robin H. Johnson wrote:
> On Mon, Mar 31, 2003 at 12:00:14PM +0400, Oleg Drokin wrote:
> > > http://www.orbis-terrarum.net/~robbat2/reiserfs/debugreiserfs.run
> > "bread: Cannot read the block (18)."
> > Well, now this is something.
> > Do you have I/O errors messages in kernel logs, or do you know another reason for
> > it to fail reading 18th block?
> Nope, no I/O messages in the logs at all.

Hm...
And you can do "dd if=/dev/hdb1 of=/tmp/somefile bs=4096 count=2 skip=18" and it does
not produce any errors?
What if you run that debugreiserfs command again and see if it complains about being unable
to read 18th block?

> > Perhaps try to run "badblocks -b 4096" to find out if there are more blocks
> > that cannot be read?
> I had previously scanned the partition only, but I've scanned the entire
> drive now, just to be entirely certain, and there are no bad blocks at
> all. I've tested with both the standard readonly test, and the
> non-destructive read/write.

Hmm, but debugreiserfs cannot read it for some reason, this is weird.

> > > A question for you, so I can support things. Is there a list somewhere
> > > of features requested, and how much you money you want to be paid to add
> > > them in? Especially the smaller features (hint hint).
> > Well, there is http://namesys.com/support.html , as of features, usually
> > we expect customers to come up with features they need. If you lack something
> > in reiserfs and you are willing to pay, we can implement it.
> > If you are happy with the current features-set, why to pay for features that
> > would be never used?
> I've been trying and using reiserfs since before it was officially in
> 2.4, and this is actually the first real issue I've hit with it. I had
> just wondered if you had some feature list of minor things you would
> like, but never had time for. Eg nice to have, but not crucial.
> Random thing I saw while reading ReiserFS docs, like maybe the repacker?

Well, repacker, delayed block allocations, fine-grained locking is coming to my
head right now, but all of this is going to be in reiser4, and Hans intends reiser4 to
replace reiserfs eventually, so he feels that spending money/time on such things is
just a waste of resources. Probably you can look at the list of all of new features of
reiser4 and think of those as of features missed in reiserfs.
On the other hand if somebody actually needs these features in reiserfs right now,
just vote with the money ;)

> But I suspect that may be a much larger task (and I certianly don't want
> my drives and RAID arrays ever getting that full in the first place).

Repacker is not that trivialindeed, if you read this list for some time already, you might have
noticed discussion in which Hans and Chris have agreed that while repacker is cool and can be
implemented, nobody knows what layout for the data should be chosen.

Bye,
    Oleg
