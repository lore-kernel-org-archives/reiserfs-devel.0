From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 can't fix 1 fixable corruption
Date: Sat, 24 Apr 2004 00:59:57 +0400
Message-ID: <200404240048.40469.vitaly@namesys.com>
References: <200404201733.51809.rmeijer@internet.gr> <200404231311.38933.vitaly@namesys.com> <40897A6A.4000205@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18185-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40897A6A.4000205@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Domenico Andreoli <cavok@tiscali.it>, reiserfs-list@namesys.com

On Saturday 24 April 2004 00:19, Hans Reiser wrote:
> Vitaly Fertman wrote:
> >On Thursday 22 April 2004 15:44, Domenico Andreoli wrote:
> >>On Thu, Apr 22, 2004 at 02:46:21PM +0400, Vitaly Fertman wrote:
> >>>with --enable-stand-alone you get another 'stand alone' library that
> >>>includes the minimum of the code needed for programs like grub --
> >>>no librepair, no tree balancing code, no modification code, etc. The
> >>>code is minimised to be used with grub stage1_5. Libaal in stand-alone
> >>>includes simple memory menagement methods (malloc, free) to avoid
> >>>linking to libc -- as it links to no other libraries it is called
> >>>stand-alone.
> >>
> >>thanks, now it's much more clear :)
>
> how about calling it --minimal-footprint and fixing the documentation to
> include some of the words above?

It have to be --enable-minimal-footprint as you get this minimal-footprint 
library in addition to the base library.

> Please work on reviewing your documentation and options naming for
> greater clarity for a day.

yes, I am going to review all documentation just after finishing with 
the plugin inheritance.

-- 
Thanks,
Vitaly Fertman

