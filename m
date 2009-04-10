From: Bron Gondwana <brong@fastmail.fm>
Subject: Re: [PATCH] reiserfs: kill-the-BKL
Date: Fri, 10 Apr 2009 10:39:47 +1000
Message-ID: <20090410003947.GA21681@brong.net>
References: <1239070789-13354-1-git-send-email-fweisbec@gmail.com> <87tz4x97uq.fsf@basil.nowhere.org> <alpine.LFD.2.00.0904090831000.4583@localhost.localdomain> <20090409184022.GA2665@elte.hu> <20090409193635.GO14687@one.firstfloor.org> <20090409211733.GA23233@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090409211733.GA23233@elte.hu>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Ingo Molnar <mingo@elte.hu>
Cc: Andi Kleen <andi@firstfloor.org>, Linus Torvalds <torvalds@linux-foundation.org>, Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Bron Gondwana <brong@fastmail.fm>, Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>

On Thu, Apr 09, 2009 at 11:17:33PM +0200, Ingo Molnar wrote:
>=20
> * Andi Kleen <andi@firstfloor.org> wrote:
>=20
> > > Using a mutex seems like the sane choice here. I'd advocate spinl=
ocks=20
> > > for a new filesystem any day (but even there it's a fine choice t=
o have=20
> > > a mutex, if top of the line scalability is not an issue).
> > >=20
> > > But for a legacy filesystem like reiser3, which depended on the B=
KL=20
> >=20
> > reiser3 is much more widely used in the user base than a lot of=20
> > "non legacy" file systems. It's very likely it has significantly=20
> > more users than ext4 for example. Remember that it was the default=20
> > file system for a major distribution until very recently. [...]
>=20
> ( Drop the condescending tone please - i very much know that SuSE=20
>   installed reiser3 by default for years. It is still a legacy=20
>   filesystem and no new development has gone into it for years. )

legacy (adj) =E2=80=94 A pejorative term used in the computer industry =
meaning
"it works"

http://homepages.tesco.net/~J.deBoynePollard/FGA/legacy-is-not-a-pejora=
tive.html

It's by far the best of all the currently available and stable
filesystems for our workload (big honking Cyrus IMAP boxes)

There have been bugfixes and occasional bits and pieces over
the years.  We applied a couple of patches for a while until
they were accepted upstream only a couple of years ago.

It doesn't get much new development because, gee, "it works".
Some people like their filesystem to keep just working in a
predictable way.

I would be very concerned if people though it was OK to break
it just because these shiny new ext4 and btrfs filesystem which
are _NOT_YET_READY_ had replaced it.

Ta.
=20
> > [...] I also got a few reiser3 fs still around, it tended to=20
> > perform very well on kernel hacker workloads.
>=20
> Then i am sure you must like this patch: it introduces a per=20
> superblock lock, splitting up the big BKL serialization. You
> totally failed to even acknowledge that advantage, maybe you
> missed that aspect?
>=20
> For example, if you have /home and / on separate reiser3=20
> filesystems, you could see as much as a 200% jump in performance=20
> straight away on certain workloads, on a dual-core box.
>=20
> That big BKL overhead is a real reiser3 scalability problem -=20
> especially on reiser3 using servers which are likely to have several=20
> filesystems on the same box.

Yes - I'm certainly interested in that.

That said, we have a box with 83 reiserfs partitions on it, and
which is constrained by IO (main servers really don't need much
CPU).  Performance is pretty good even now.

So - I'm interested in this patch series, but not at the expense
of making reiserfs any less stable.  Our customers, funnily enough,
like it when our service is stable!

Thanks,

Bron.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
