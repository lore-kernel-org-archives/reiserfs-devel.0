From: Ookhoi <ookhoi@humilis.net>
Subject: Re: [reiserfs-dev] Re: [ANNOUNCE]: reiser4 snapshot
Date: Thu, 16 Jan 2003 09:31:19 +0100
Message-ID: <20030116093119.H7526@humilis>
References: <15880.36350.410391.708308@laputa.namesys.com> <20030116091420.G7526@humilis> <20030116112254.A7254@namesys.com>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12372-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030116112254.A7254@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Ookhoi <ookhoi@humilis.net>, Nikita Danilov <Nikita@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>

Oleg Drokin wrote (ao):
> On Thu, Jan 16, 2003 at 09:14:20AM +0100, Ookhoi wrote:
> > Is there also a BK repository with the reiserfs4-progs?
> 
> Sure.
> bk://thebsh.namesys.com/bk/reiser4progs

Thanks :-)

> > And what is the right way to integrate reiser4 into the kernel? At
> > the moment I pull reiser4 and linux-2.5, patch linux-2.5 with the
> > reiser4.diff out of the snapshots dir, and replace fs/reiser4 with
> > the BK reiser4. 
> > This works*, but I think the patch part is not the right way.
> 
> Well. It is most right way actually. (besides pulling from our kernel
> repository, but we have different UML-related stuff in there so that
> might not be very good idea for you).
> Probably starting with next snapshot there will be separate kernel
> patch for people who would like to pull our tree directly out of
> bitkeeper.

Owh, cool!.

> > * I can compile a 2.5 kernel, boot it, and mkfs.reiser4 a partition.
> 
> Great success at our side! ;)
> Though I see you have not tried to mount that?

Ehm, sorry, I can also mount it. But the last few times I tried to wget
base2_2.tar (debian base) on it, it oopses immediately. As the system is
a kernel plus initrd on a floppy, I can't catch the oops. 

At the moment I try to build a kernel which decodes the oops by itself
and provide it to you (if it still oopses). Problem is that the kernel
gets too big, so now I try to wget the big kernel and boot it from out
of the initrd.

It is really great to be able to pull latest versions from BK and play
with it. I'll report success or failure.

Thanks again!
