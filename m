From: Andrew Morton <akpm@osdl.org>
Subject: Re: reiserfs logging patches udpated
Date: Wed, 24 Mar 2004 14:35:16 -0800
Message-ID: <20040324143516.3162cbfe.akpm@osdl.org>
References: <1080149399.14737.77.camel@watt.suse.com>
	<20040324141855.742a6395.akpm@osdl.org>
	<1080167194.14743.120.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17444-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1080167194.14743.120.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Chris Mason <mason@suse.com> wrote:
>
> On Wed, 2004-03-24 at 17:18, Andrew Morton wrote:
> > Chris Mason <mason@suse.com> wrote:
> > >
> > > ftp.suse.com/pub/people/mason/patches/data-logging/experimental/2.6.5-rc2-mm2
> > > 
> > > Has a new set of reiserfs patches. 
> > 
> > -ENODOCCO.  If people are going to test this stuff we will need setup and
> > usage instructions, links to userspace tool upgrades, etc, etc.
> 
> For data=ordered?  The only docs are to mount -o data=writeback if you
> don't want data=ordered (which is the new default).  No tool upgrades
> are required.

OK, thanks.  Switching the default on day one sounds radical doesn't it?

> reiserfs needs a Documentation/filesystems/reiserfs.txt, but it needs
> that in general.  I'll write one up and have the namesys guys review.

OK.  And these guys need boring old changelogs please:

reiserfs-nesting-02.patch
reiserfs-journal-writer.patch
reiserfs-logging.patch
reiserfs-jh-2.patch
reiserfs-prealloc.patch
reiserfs-tail-jh.patch
reiserfs-writepage-ordered-race.patch
reiserfs-file_write_hole_sd.diff.patch
reiserfs-laptop-mode.patch
reiserfs-truncate-leak.patch
reiserfs-ordered-lat.patch
reiserfs-dirty-warning.patch

