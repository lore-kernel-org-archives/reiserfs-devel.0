From: Richard Heycock <rgh@roughage.com.au>
Subject: Re: software packaging and ReiserFS v4
Date: Fri, 05 Sep 2003 17:08:29 +1000
Message-ID: <1062745708.1523.21.camel@boadicea>
References: <20030903165409.GD4714@rahul.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15572-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030903165409.GD4714@rahul.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu, 2003-09-04 at 02:54, Bennett Todd wrote:
> I've got this thought that ReiserFS v4 may make it possible to
> implement a _really_ trivial software package management system,
> with even better power than rpm.
> 
> I'm building myself a new Linux distrib; my proximate motivation is
> that while there's lots I like about Red Hat --- in particular, rpm
> is the best software package mgmt tool I've used or heard of ---
> there's still a lot of accumulated cruft there.

Why not just use apt-get/dpkg? It make a mockery of rpms.

rgh

> 
> As I've gotten deeper into the project, I've had my nose rubbed in
> the fact that rpm is the accumulating cruft heart; it's the worst.
> Way, way overdue for a rewrite.
> 
> So I started fantasizing about the replacement. Some bits are easy;
> rather than trying to write a parser for yet another poorly
> documented subtle and complex file format like rpm spec files, the
> spec file will simply be a Lua <URL:http://www.lua.org/> source file
> that exports the necessary data.
> 
> Then I started thinking about the database that a good software
> packging tool needs to maintain. After a bit, it hit me that
> ReiserFS 4 would be _killer_!
> 
> Let the package install process deposit the "spec file" (lua data
> decl) in /var/lib/pkg/{pkgname}. Addenda like e.g. the checksums,
> and pre- and post-install scripts can be
> /var/lib/pkg/{pkgname}/sha1, /var/lib/pkg/{pkgname}/pre,
> /var/lib/pkg/{pkgname}/post, etc. Whatever open-ended addenda the
> package should wish to keep track of on a per-package basis can be
> simply added there.
> 
> The one tricky bit --- and it's the performance downfall of the
> current rpm --- is the reverse-mapping database, the one that maps a
> pathname of an installed file to the package that installed it.
> Maintaining that, and ensuring its consistency with the forward
> database, makes rpm slow.
> 
> With ReiserFS v4 its as natural as can be; a file /usr/bin/foo,
> installed by a package foo, would simply have a symlink
> 
> 	/usr/bin/foo/pkg -> /var/lib/pkg/foo
> 
> Besides scaling elegantly and staying wonderfully simple, this has
> the additional otherwise-impossible feature that the package
> attribution automatically correctly updates if you move the file
> (although the forward mappings within /var/lib/pkg/foo wouldn't
> update automagically).
> 
> I'm continuing to do the preliminary, basic dev of my new distrib on
> Reiser 3 w/ rpm, because they're what I've got, but when v4 comes
> around I'm seriously hoping to re-wrap the whole schmeer taking full
> advantage of v4 to make a very simple new package manager.
> 
> -Bennett
-- 
"It is possible to make things of great complexity out of things
 that are very simple. There is no conservation of simplicity"
 -- Stephen Wolfram

Richard Heycock <rgh@roughage.com.au>
tel : 0410 646 369
key fingerprint : 909D CBFA C669 AC2F A937 AFA4 661B 9D21 EAAB 4291
