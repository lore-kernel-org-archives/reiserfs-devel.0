From: Chris Mason <mason@suse.com>
Subject: Re: when distros do not support official Marcelo kernels they are
	not being team players (was Re: reiserfs on redhat advanced server?)
Date: 03 Feb 2003 21:02:54 -0500
Message-ID: <1044324173.15684.503.camel@tiny.suse.com>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org>
	 <3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no>
	 <3E3A6071.6060102@namesys.com>	<20030131115333.GC15359@marowsky-bree.de>
	 <3E3A67AE.4050601@namesys.com>	<20030131122147.GE15359@marowsky-bree.de>
	 <3E3A6D76.7080300@namesys.com> <86lm0xpmho.fsf@trasno.mitica>
	 <3E3E7A95.1050908@namesys.com> <1044284001.15685.358.camel@tiny.suse.com>
	 <3E3EBA3F.7060806@namesys.com> <1044300746.15684.428.camel@tiny.suse.com>
	 <3E3EC7EC.8090005@namesys.com> <1044304857.15684.475.camel@tiny.suse.com>
	 <3E3F0D5D.5070409@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12626-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E3F0D5D.5070409@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Juan Quintela <quintela@mandrakesoft.com>, Lars Marowsky-Bree <lmb@suse.de>, Ragnar =?ISO-8859-1?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, Jure Pecar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

On Mon, 2003-02-03 at 19:46, Hans Reiser wrote:
> Chris Mason wrote:
> 
> >
> >namesys does a great job of processing bug reports from any random guy
> >with any random set of patches/apps/distro. 
> >
> A Marcelo kernel is NOT a randomly patched kernel.  It is the OFFICIAL 
> kernel that the community has picked to be the official kernel.  SuSE 
> and RedHat should be team players, and act accordingly. 
> 

The idea is that since you support randomly patched kernels, you also
support generic kernels well.  I was trying to complement the support
job you currently do, especially important since later comments might be
misunderstood as saying you don't do support well.


> Why is what Namesys (and you, since you don't personally seem to 
> hesitate to fix bugs wherever you can find one however much you might 
> defend SuSE not officially doing so

Every developer (not just in suse) I've worked with tries to fix bug
reports seen on various mailing lists and other unofficial channels. 
It's a major part of all of our jobs.

My argument is that when someone buys the distribution, replaces some
piece and complains about their replacement not working, we suggest they
undo their change and call back.  And yes, the kernel is one of those
pieces.

> ) does so hard?  I don't think it is....
> 

Feel free to start the ultimate distribution where people can purchase a
complete set of cds that results in a coherent, stable and fast install,
where any component could be swapped with it's
generic-recompiled-from-the-net counterpart and still provide support
when people report bugs, all for a reasonable price.

I believe it's a problem of scale, where many components are
exponentially harder to support than a single one.

-chris




