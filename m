From: Oleg Drokin <green@namesys.com>
Subject: Re: possible bug - fsck shows perfect results, linux refuses to mount
Date: Mon, 31 Mar 2003 14:36:23 +0400
Message-ID: <20030331143623.R25533@namesys.com>
References: <20030331072250.GC22731@cherenkov.orbis-terrarum.net> <20030331113446.A31858@namesys.com> <20030331074957.GD22731@cherenkov.orbis-terrarum.net> <20030331120014.C25533@namesys.com> <20030331083758.GA23518@cherenkov.orbis-terrarum.net> <20030331125652.H25533@namesys.com> <20030331091621.GA23666@cherenkov.orbis-terrarum.net> <20030331132454.L25533@namesys.com> <20030331101714.GA23949@cherenkov.orbis-terrarum.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13474-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030331101714.GA23949@cherenkov.orbis-terrarum.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robin H. Johnson" <robbat2@orbis-terrarum.net>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Mar 31, 2003 at 02:17:14AM -0800, Robin H. Johnson wrote:
> On Mon, Mar 31, 2003 at 01:24:54PM +0400, Oleg Drokin wrote:
> > > No change in the output of debugreiserfs.
> > Ok, plase run it under strace, kind of like this:
> > "strace -o /tmp/out debugreiserfs -p /dev/hdb1 >/dev/null" and
> > send me this /tmp/out file.
> http://www.orbis-terrarum.net/~robbat2/reiserfs/debugreiserfs.strace.bz2

_llseek(0, 73728, 0xbffff450, SEEK_SET) = -1 ESPIPE (Illegal seek)

Hm, seeking on stdin instead of file? That's strange.

> > If not, then probably you can compress the file and somehow make it available for
> > download?
> > If it will succeed, then there is certainly some interaction between harware and
> > debugreiserfs is going on.
> Ok, I think we can rule out hardware since it still happens anyway.

Sure.

> Next step is getting that data to you. I'm running bzip2 -9vvkz on the
> dd'd contents of the drive now, I expect that to take a few hours.
> Depending on the size of the output, I'll either see about getting the
> data up on a relatively high speed site somewhere, or splitting it into
> two parts and sending them to you on DVD-R if you can accept those?

Also you can just give me a shell on your box, so that I can tweak and
recompile reiserfsprogs (btw, you are not using debugreiserfs from
reiserfsprogs v3.6.5), also I need r/w access to the file containing
copy of partition data.
In order for me to be able to verify mountability of partition I need
a way to mount/umount it).

Bye,
    Oleg
