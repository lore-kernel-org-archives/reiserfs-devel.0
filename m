From: Oleg Drokin <green@namesys.com>
Subject: Re: possible bug - fsck shows perfect results, linux refuses to mount
Date: Mon, 31 Mar 2003 13:24:54 +0400
Message-ID: <20030331132454.L25533@namesys.com>
References: <20030331072250.GC22731@cherenkov.orbis-terrarum.net> <20030331113446.A31858@namesys.com> <20030331074957.GD22731@cherenkov.orbis-terrarum.net> <20030331120014.C25533@namesys.com> <20030331083758.GA23518@cherenkov.orbis-terrarum.net> <20030331125652.H25533@namesys.com> <20030331091621.GA23666@cherenkov.orbis-terrarum.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13470-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030331091621.GA23666@cherenkov.orbis-terrarum.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robin H. Johnson" <robbat2@orbis-terrarum.net>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Mar 31, 2003 at 01:16:21AM -0800, Robin H. Johnson wrote:

> > What if you run that debugreiserfs command again and see if it
> > complains about being unable to read 18th block?
> No change in the output of debugreiserfs.

Ok, plase run it under strace, kind of like this:
"strace -o /tmp/out debugreiserfs -p /dev/hdb1 >/dev/null" and
send me this /tmp/out file.

> > > But I suspect that may be a much larger task (and I certianly don't want
> > > my drives and RAID arrays ever getting that full in the first place).
> > Repacker is not that trivialindeed, if you read this list for some
> > time already, you might have noticed discussion in which Hans and
> > Chris have agreed that while repacker is cool and can be implemented,
> > nobody knows what layout for the data should be chosen.
> Nope, I just subscribed to the list today, when I had this problem.
> I've taken the system home for now, I so I can hack on it some more.
> Mostly to find what was causing the reboots previously, but also so this
> can get worked on.

Hmm, I also wonder what happens if you dd the whole partition (/dev/hdb1) to
some file and then run debugreiserfs on that file will it succeed?
If not, then probably you can compress the file and somehow make it available for
download?
If it will succeed, then there is certainly some interaction between harware and
debugreiserfs is going on.

Bye,
    Oleg
