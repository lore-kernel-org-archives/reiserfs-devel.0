From: Oleg Drokin <green@namesys.com>
Subject: Re: possible bug - fsck shows perfect results, linux refuses to mount
Date: Mon, 31 Mar 2003 15:33:51 +0400
Message-ID: <20030331153351.B1527@namesys.com>
References: <20030331113446.A31858@namesys.com> <20030331074957.GD22731@cherenkov.orbis-terrarum.net> <20030331120014.C25533@namesys.com> <20030331083758.GA23518@cherenkov.orbis-terrarum.net> <20030331125652.H25533@namesys.com> <20030331091621.GA23666@cherenkov.orbis-terrarum.net> <20030331132454.L25533@namesys.com> <20030331101714.GA23949@cherenkov.orbis-terrarum.net> <20030331143623.R25533@namesys.com> <20030331111332.GC23949@cherenkov.orbis-terrarum.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13482-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030331111332.GC23949@cherenkov.orbis-terrarum.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robin H. Johnson" <robbat2@orbis-terrarum.net>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Mar 31, 2003 at 03:13:32AM -0800, Robin H. Johnson wrote:
> > > Next step is getting that data to you. I'm running bzip2 -9vvkz on the
> > > dd'd contents of the drive now, I expect that to take a few hours.
> > > Depending on the size of the output, I'll either see about getting the
> > > data up on a relatively high speed site somewhere, or splitting it into
> > > two parts and sending them to you on DVD-R if you can accept those?
> > Also you can just give me a shell on your box, so that I can tweak and
> > recompile reiserfsprogs (btw, you are not using debugreiserfs from
> > reiserfsprogs v3.6.5), also I need r/w access to the file containing
> > copy of partition data.
> > In order for me to be able to verify mountability of partition I need
> > a way to mount/umount it).
> I'm afraid I can't do that Dave. Shells are out of the question. It

Ok, I fully understand that.

> opens up too many possible security holes. Paranoid I am.
> At the present rate, it looks like it will be at least 50% compression,
> I'm thinking more since the drive was about 60% full.

Ok. We will look at code meanwhile to see why it might have done lseek on stdin.

> ~5gb would be an acceptable download I think, split into 10x512Mb parts,
> using MD5SUMS. 
> I was going to upgrade to it, but it seems Gentoo currently has some
> issues with it, so I'm holding off on it.

You can uild it yourself if you want, or I can supply you with binary.

Bye,
    Oleg
