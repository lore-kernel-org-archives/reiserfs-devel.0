From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: [PATCHES] 2.6.1 Cleanups
Date: Tue, 24 Feb 2004 13:11:23 +0100
Message-ID: <200402241311.23129.Dieter.Nuetzel@hamburg.de>
References: <4003176A.3070901@suse.com> <403ABD0C.2090408@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16904-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <403ABD0C.2090408@suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Jeff Mahoney <jeffm@suse.com>, Chris Mason <mason@suse.com>

Am Dienstag, 24. Februar 2004 03:55 schrieb Jeff Mahoney:
> Jeff Mahoney wrote:
> > Hey all -
> >
> > Now that the 2.6.0 hurdle has been cleared and Linus seems to be more
> > open to cleanup-type patches, I have these to submit for comment.
> >
> > I have 4 patches, descriptions follow:
> > * cleanup-01-basic-cleanup
> >     -- This cleans up journal.c such that the ugly 50+ character
> >     macro/derefs that are used repeatedly are evaluated once and
> >     then accessed using a temporary variable. The resulting code
> >     should be identical and makes it quite a bit nicer to read.
> >
> > * cleanup-01-sb-opts
> >     -- This eliminates individual #defines for superblock/mount
> >     options and instead uses an enum. It's not like the actual
> >     values of the mount options matter, and this just makes a list
> >     of them. Accordingly, since the values aren't apparently in the
> >     include, I added a BUG_ON to bail out of the value passes beyond
> >     the size of the mount_opts variable.
> >
> > * cleanup-02-bh-bits
> >     -- This patch makes all the accesses for bh->b_state use the
> >     appropriate macros, rather than accessing them directly.
> >
> > * cleanup-03-bh-cleanup
> >     -- This patch eliminates the local macro implementation for the
> >     bh->b_state accessors/mutators and uses the FNS_BUFFER
> >     implementation in fs.h, which automatically creates the macros
> >     with on line of code.
> >
> > * cleanup-04-sb-journal-elimination
> >     -- This patch is similar to the basic-cleanup, except that it
> >     focuses on the use of SB_JOURNAL(super) everywhere, and replaces
> >     it with a local "journal" variable. Again, this makes the code
> >     much easier to look at.
> >
> > Opinions? Comments?
> >
> > Patches can be found at
> > ftp://ftp.suse.com/pub/people/jeffm/reiserfs/kernel-v2.6/2.6.1/
> >
> > -Jeff
> >
> > I apologize if this posted twice. The first message had the patches
> > attached, and crossed the post size limit. I haven't received a bounce
> > yet.
>
> Hey all -
>
> I never got any sort of response on these. Shall I send them on to
> Linus? They still apply cleanly to 2.6.3.

Huh, never show up, here...

What about Chris's work?

ftp://ftp.suse.com/pub/people/mason/patches/data-logging/experimental/2.6.3

Here is the thread:
http://marc.theaimsgroup.com/?l=reiserfs&m=107716524819195&w=2

Regards,
	Dieter
