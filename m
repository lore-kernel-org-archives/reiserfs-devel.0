From: Chris Mason <mason@suse.com>
Subject: Re: Memory Corruption
Date: 29 Aug 2002 09:40:26 -0400
Message-ID: <1030628426.17778.337.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11344-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Boutcher <boutcher@us.ibm.com>
Cc: reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

On Wed, 2002-08-28 at 17:00, David Boutcher wrote:
> 
> >On Mon, 2002-08-19 at 12:50, Dave Boutcher wrote:
> >> Hi,
> >>
> >> I'm chasing a wierd memory corruption problem on a ppc64 system.  The
> >> first byte of a slab_t structure keeps getting stepped on (zeroed,
> >> actually.)  This happens during a testcase that copies a large file
> >> called "junk" between file systems (a mix of ext2 and reiser) on a
> >> 2.4.13 kernel.  I know that's REALLY REALLY old, but it's whats in
> >> SuSE's SLES-7 release that we have customers running...
> >
> >Any chance the test case involves renames?
> >
> >-chris
> 
> So I posted my problem with memory corruption a few weeks ago....and the
> problem turned out to be a REALLY old/moldy set of userland reiser tools.
> I don't know exactly why that caused memory corruption in the kernel, but
> updating the tools fixed everything right up.

Well, that shouldn't fix it ;-)  Which version of reiserfsprogs were you
running before?

Are the filesystems getting checked during boot at all (you would see
reiserfsck messages during boot)?

-chris


