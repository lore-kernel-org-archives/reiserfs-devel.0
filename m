From: Chris Mason <mason@suse.com>
Subject: Re: when distros do not support official Marcelo kernels they are
	not being team players (was Re: reiserfs on redhat advanced server?)
Date: 04 Feb 2003 17:22:59 -0500
Message-ID: <1044397378.15684.714.camel@tiny.suse.com>
References: <20030131122147.GE15359@marowsky-bree.de>
	 <3E3A6D76.7080300@namesys.com> <86lm0xpmho.fsf@trasno.mitica>
	 <3E3E7A95.1050908@namesys.com> <1044284001.15685.358.camel@tiny.suse.com>
	 <3E3EBA3F.7060806@namesys.com> <1044300746.15684.428.camel@tiny.suse.com>
	 <3E3EC7EC.8090005@namesys.com> <1044304857.15684.475.camel@tiny.suse.com>
	 <3E3F0D5D.5070409@namesys.com> <20030204163609.GT19723@suse.de>
	 <3E403488.9050408@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12647-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E403488.9050408@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Hubert Mantel <mantel@suse.de>, Ragnar =?ISO-8859-1?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, reiserfs-list@namesys.com

On Tue, 2003-02-04 at 16:45, Hans Reiser wrote:

> The official kernel is our kernel community's only chance to overcome 
> its fragmentation.  We need to support it.  

We do support the official kernel, by actively developing and improving
it, and by answering questions on public mailing lists.  When things
work in our kernel (like reiserfs, or andrea's vm etc) we work to get it
into the vanilla kernel.  We're also constantly updating our work to
keep it in line with the current vanilla sources.  It takes a while due
to the volume of patches and testing required, but we're always working
on it.

Of course this is a different issue from debugging customer problems
sent to support@distro.foo hit while running a vanilla kernel.

The entire reason we have our own kernel is because for some reason or
another the vanilla kernel wasn't sufficient to meet our needs.  This
fact is mutually exclusive with supporting someone who uses the vanilla
kernel.

This is the key point that I seem to be failing to convey, so please
explain how we can:

A) modify a kernel because it doesn't work, and then B) help people use
the unmodified kernel that doesn't work without C) telling them to use
our modifications.

> All of us, regardless of 
> what camp we are in.   It should never be the discouraged officially 
> unsupported branch of the kernel 

Marcelo's kernel is a base that we all start from, and all work toward,
but each distro has the right to decide which features and fixes they
believe are critical for their own support contracts, and then expect
the users to use those features and fixes before we start answering
their questions.

Again, this has nothing to do with questions sent to public mailing
lists, where every distro coder will help debug a problem hit on a
vanilla kernel.  It's only about someone sending mail to
support@distro.foo, and expecting help with some random combination of
packages that may or may not have come from us.

-chris (not speaking for suse in any official sense)


