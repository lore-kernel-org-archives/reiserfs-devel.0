From: Mike Houston <mikeserv@bmts.com>
Subject: Re: hans! i found a bug in reiser4 :((((
Date: Mon, 12 Apr 2004 12:29:38 -0400
Message-ID: <20040412122938.24ef3999.mikeserv@bmts.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17873-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello

I think that I have experienced a related problem.

I'm not subscribed to this list, but I tried the 2004.03.26 snapshot, applying all.diff.gz to the 2.6.5-rc2 kernel, booted with it, built the tools and created a reiser4 filesystem (using exact command given) on my "scratch" partition. I keep source trees and compile all my software on that partition.

I was otherwise impressed with it, but there seems to be a problem, I'm guessing with timestamps, that causes the make utility to treat files as being modified. The most obvious symptom is that make issues commands to recompile just about everything on the make install. I didn't have anything fail to compile (I didn't have cause to do a build of glibc), it just had to do a pile of extra work.

I've refrained from reporting this as a bug, because I'm unsure if it's a reiser4 bug, or a problem with utilities like coreutils or make that need to be brought up to speed, or a problem with the kernel itself in relation to reiser4. This does not occur on any of my ext2 partitions. fsck.reiser4 --check was not finding any problems with the filesystem either. (it was otherwise GREAT)

I am checking these list archives, and waiting for the next snapshot, to try again in earnest, but for now I no longer have the reiser4 filesystem. (I needed full use of that partition back again and wanted to move on with 2.6.5)

Gnu Make 3.80
Coreutils 5.2.1
gcc 3.3.3
binutils 2.14.90.0.8

If you want to know anything else about my system, let me know.

Mike Houston

---------- Quoted Text Follows---------------------

List:       reiserfs
Subject:    Re: hans! i found a bug in reiser4 :((((
From:       Redeeman <redeeman () metanurb ! dk>
Date:       2004-04-12 11:05:05
Message-ID: <1081767905.8170.3.camel () redeeman ! linux ! dk>
[Download message RAW]

i noticed this while trying to do a livecd with gentoos cataylst, i
thught it would help speeding up on a reiser4 partition.

before that i read on the forums that it didnt compile on reiser4, but i
thought "wtf! lamer! why wouldnt it?!"

but when i moved the build to reiser4 partition, it failed. moving back
to reiserfs partition, and it builds. with absolutely no change other
than the fs change. and for cflags, im just using standard. no
optimization at all.


On Mon, 2004-04-12 at 12:40, Thomas Graham wrote:
> it seems a very serious problem, are you sure that the problem is come
> from reiserfs4 ? did you put optimize tag to none when you compile glibc ?
> because glibc is very sensative on optimize tag, please post the error
> section to mail list, so that people could help for that, I hope that's
> not reiser4 problem, errrr...
> 
> 
> > That is correct.
> >
> > Vladimir Saveliev wrote:
> >> Hello
> >>
> >>
> >> Do you mean that you put glibc sources on reiser4 and that make fails?
> >>
> >>
> >
> >
-- 
Regards, Redeeman
