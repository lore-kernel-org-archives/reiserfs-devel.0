From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCHES] 2.6.1 Cleanups
Date: Mon, 23 Feb 2004 21:55:08 -0500
Message-ID: <403ABD0C.2090408@suse.com>
References: <4003176A.3070901@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16901-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4003176A.3070901@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS Mailing List <reiserfs-list@namesys.com>

Jeff Mahoney wrote:
> Hey all -
> 
> Now that the 2.6.0 hurdle has been cleared and Linus seems to be more
> open to cleanup-type patches, I have these to submit for comment.
> 
> I have 4 patches, descriptions follow:
> * cleanup-01-basic-cleanup
>     -- This cleans up journal.c such that the ugly 50+ character
>     macro/derefs that are used repeatedly are evaluated once and
>     then accessed using a temporary variable. The resulting code
>     should be identical and makes it quite a bit nicer to read.
> 
> * cleanup-01-sb-opts
>     -- This eliminates individual #defines for superblock/mount
>     options and instead uses an enum. It's not like the actual
>     values of the mount options matter, and this just makes a list
>     of them. Accordingly, since the values aren't apparently in the
>     include, I added a BUG_ON to bail out of the value passes beyond
>     the size of the mount_opts variable.
> 
> * cleanup-02-bh-bits
>     -- This patch makes all the accesses for bh->b_state use the
>     appropriate macros, rather than accessing them directly.
> 
> * cleanup-03-bh-cleanup
>     -- This patch eliminates the local macro implementation for the
>     bh->b_state accessors/mutators and uses the FNS_BUFFER
>     implementation in fs.h, which automatically creates the macros
>     with on line of code.
> 
> * cleanup-04-sb-journal-elimination
>     -- This patch is similar to the basic-cleanup, except that it
>     focuses on the use of SB_JOURNAL(super) everywhere, and replaces
>     it with a local "journal" variable. Again, this makes the code
>     much easier to look at.
> 
> Opinions? Comments?
> 
> Patches can be found at
> ftp://ftp.suse.com/pub/people/jeffm/reiserfs/kernel-v2.6/2.6.1/
> 
> -Jeff
> 
> I apologize if this posted twice. The first message had the patches
> attached, and crossed the post size limit. I haven't received a bounce yet.


Hey all -

I never got any sort of response on these. Shall I send them on to 
Linus? They still apply cleanly to 2.6.3.

-Jeff
