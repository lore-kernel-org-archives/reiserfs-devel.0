From: Chris Mason <mason@suse.com>
Subject: Re: when distros do not support official Marcelo kernels they are
	not being team players (was Re: reiserfs on redhat advanced server?)
Date: 03 Feb 2003 15:40:58 -0500
Message-ID: <1044304857.15684.475.camel@tiny.suse.com>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org>
	 <3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no>
	 <3E3A6071.6060102@namesys.com>	<20030131115333.GC15359@marowsky-bree.de>
	 <3E3A67AE.4050601@namesys.com>	<20030131122147.GE15359@marowsky-bree.de>
	 <3E3A6D76.7080300@namesys.com> <86lm0xpmho.fsf@trasno.mitica>
	 <3E3E7A95.1050908@namesys.com> <1044284001.15685.358.camel@tiny.suse.com>
	 <3E3EBA3F.7060806@namesys.com> <1044300746.15684.428.camel@tiny.suse.com>
	 <3E3EC7EC.8090005@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12622-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E3EC7EC.8090005@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Juan Quintela <quintela@mandrakesoft.com>, Lars Marowsky-Bree <lmb@suse.de>, Ragnar =?ISO-8859-1?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, Jure Pecar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

On Mon, 2003-02-03 at 14:50, Hans Reiser wrote:

> Also, if you refuse to support an official Marcelo kernel, you are 
> undermining our unified social structure.  That is a social structure 
> that should be undermined only for good cause.
> 

We do support the Marcelo kernel by fixing bugs and giving out the
resulting binary (and source) with all the fixes/features we believe are
important. 

We contribute back to the social structure as much as we can, because
we're a part of it.

> I have always had a pet peeve for keeping users disenfranchised from the 
> right to program.  Not everyone agrees with me, particularly the persons 
> whose workload is increased by such subversive activity.;-)
> 

Our workload goes down when people modify and contribute to programs,
especially when they find bugs or add cool features, it's highly
encouraged ;-)  But once you go off and hack vi, you're using your vi
and not the suse vi.  Send yourself the bug reports, or reproduce on the
suse vi and send us the bug report.

> > 
> >
> >Any reasonable distro is going to try working with their customers as
> >much as possible.  At the same time, we've put huge amounts of time and
> >energy into making a coherent, fast and reliable product.  The customer
> >needs to understand that swapping out bits and pieces of that makes it
> >significantly harder to support the system as a whole.
> >
> Kind of like buying a non-IBM hard drive for your IBM PC?

No, kind of like breaking the warranty void seal on the IBM hard drive,
replacing the motor and then expecting namesys to find a reiserfs bug
when there's constant drive corruption.  Or how about 'I burnt my own
roms onto my hardware raid controller, my parity checking algorithm is
much faster, but now I get these odd crashes all the time.'

In both cases I'd tell them to come back when they can reproduce the
problem on stable hardware, regardless of what actual problem they were
having. 

> >
> The issues you raise are real ones, and important ones, but not 
> sufficient ones.

Grin, then I don't see how I'll ever convince you.  Feel free to start
the swap-any-package-with-anything-that-you-find-on-the-net distro;
convince me by example.

namesys does a great job of processing bug reports from any random guy
with any random set of patches/apps/distro.  But my personal belief is
that supporting the distro as a whole is different, especially when
trying to keep the support costs within the bounds set by the sale price
on the box.

-chris


