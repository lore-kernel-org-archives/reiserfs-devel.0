From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 can't fix 1 fixable corruption
Date: Fri, 23 Apr 2004 13:15:08 +0400
Message-ID: <200404231311.38933.vitaly@namesys.com>
References: <200404201733.51809.rmeijer@internet.gr> <200404221446.21162.vitaly@namesys.com> <20040422114459.GA19430@raptus.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18176-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040422114459.GA19430@raptus.homelinux.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Domenico Andreoli <cavok@tiscali.it>, reiserfs-list@namesys.com

On Thursday 22 April 2004 15:44, Domenico Andreoli wrote:
> On Thu, Apr 22, 2004 at 02:46:21PM +0400, Vitaly Fertman wrote:
> > with --enable-stand-alone you get another 'stand alone' library that
> > includes the minimum of the code needed for programs like grub --
> > no librepair, no tree balancing code, no modification code, etc. The
> > code is minimised to be used with grub stage1_5. Libaal in stand-alone
> > includes simple memory menagement methods (malloc, free) to avoid
> > linking to libc -- as it links to no other libraries it is called
> > stand-alone.
>
> thanks, now it's much more clear :)
>
> > > what does really change in the libraries? is something related to
> > > reiser4 or to libtool & co?
> > >
> > > is it legal for debian to distribute libaal and libreiser4 packages
> > > compiled with this option?
> >
> > yes. Although new changes are tested not in the stand-alone mode
> > first, and the stand-alone support may be delayed sometimes.
>
> this is not a problem, more people is able to use it, more will test
> it for bugs :) this is the main reason i'm doing this packaging stuff ;)
>
> ok, i'm trying to build packages (always targeted to debian experimental)
> with these stand alone libraries. i'm also reading in configure help
> message about "--enable-memory-manager". is anything a distribution
> could need [to test]?

yes, I forgot to tell the memory manager I mentioned above is enabled
with --enable-stand-alone and with --enable-memory-manager. Without
--enable-stand-alone you use libc methods, with --enable-stand-alone
only you can use you own memory methods implementation.

-- 
Thanks,
Vitaly Fertman


