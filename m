From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: I oppose Chris and Jeff's patch to add an unnecessary additional namespace to ReiserFS
Date: Wed, 28 Apr 2004 12:44:35 +0300
Message-ID: <20040428094435.GE29226@nysv.org>
References: <1082750045.12989.199.camel@watt.suse.com> <408E9F42.2080804@namesys.com> <20040427190439.A20646@infradead.org> <200404281022.36081.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18269-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200404281022.36081.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

On Wed, Apr 28, 2004 at 10:22:36AM +0200, Christian Mayrhuber wrote:

>I wonder if Novell/SuSE would take over full Reiserfs3 maintainership as
>namesys is now concentrating on the next big step: Reiser4.

This would be an EXCELLENT idea; something that a SuSEist should take
seriously if reading this list.

Maybe Namesys could even make some money off of this.
There should be negotiations to be made here :)

IMO it's not even like selling out, more like accepting the fact that
life goes on and there is little use in sitting on an old project that
isn't too actively developed.

The money would of course go to a valued cause and SuSE could still
help out with Reiser4. This is beautiful.

If ReiserFS is still developed, I may be wrong in the above statement,
but the question "Why, if ReiserFS is already stable and Reiser4 is not?"
comes to mind.

>Imagine some filemanagers using xattr/acl interface because it is in the 2.6 
>kernel release. Such stuff would work on every linux filesystem, but Reiser4.

The community will take care of their own, just like in the ReiserFS+xattrs
case. If people want something that's not available, they'll do it themselves.

But still I always hope the better interface wins, and if Reiser4 is
better, it should win, for the greater good.

This is not an easy point, because xattrs might win in this competition
because people are used to it, they are lazy, they would use xattrs on
Reiser4 because they don't want to learn anything new. The power that is,
that writes xattrs support, would quite effectively pave the road to hell.

>I like the filesystem namespace very much and I guess I'm not alone, because  
>procfs, sysfs, etc. are there. It even follows the the tradition of unix in 
>accessing devices as special files.
>Hans should win such a discussion hands down ;-)

Amen.

-- 
mjt

