From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH CFT] tons of logging patches
Date: 03 Jun 2002 08:26:01 -0400
Message-ID: <1023107161.6829.1802.camel@tiny>
References: <1023076301.22608.1778.camel@tiny> 
	<m37klglpfo.fsf@merlin.emma.line.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10487-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <m37klglpfo.fsf@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Cc: reiserfs-list@namesys.com

On Mon, 2002-06-03 at 04:46, Matthias Andree wrote:
> Chris Mason <mason@suse.com> writes:
> 
> > Hello everyone,
> >
> > ftp.suse.com/pub/people/mason/data-logging
> 
> You seem to mean:
> 
> ftp://ftp.suse.com/pub/people/mason/patches/data-logging/

Correct, thanks.

> 
> > optimizations to keep kupdate from triggering commits every 5 seconds
> 
> Does this mean the current released ReiserFS versions are causing the
> persistent write activity at 5 s interval that I observe?
> 
> Or is it ext3fs also?

No, there is a dirty flag on the super struct that should get cleaned
after all commits are done.  The commit_super-8 patch might fix a bug
where we are not properly cleaning the flag.

-chris


