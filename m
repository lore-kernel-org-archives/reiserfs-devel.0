From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: I oppose Chris and Jeff's patch to add an unnecessary additional namespace to ReiserFS
Date: Wed, 28 Apr 2004 10:22:36 +0200
Message-ID: <200404281022.36081.christian.mayrhuber@gmx.net>
References: <1082750045.12989.199.camel@watt.suse.com> <408E9F42.2080804@namesys.com> <20040427190439.A20646@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18266-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040427190439.A20646@infradead.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tuesday 27 April 2004 20:04, Christoph Hellwig wrote:
> I also still think someone who does most work in the last years on a fs
> (Chris on reiserfs v3) should be considered maintainer, but that's just my
> 2cents and I'd rather leave that to you guys.
I wonder if Novell/SuSE would take over full Reiserfs3 maintainership as
namesys is now concentrating on the next big step: Reiser4.

>
> The important part is xattr/acl/namespace semantics.  In Linux those
> semantics are at the _VFS_ level, not at the individual filesystem,
> in fact if a fs can mess with namespace semantics I'd almost considere
> that a bug.
As Hans mentioned, bad semantics cripple useability, but what's even worse
is if there is no standard way of doing things - at least from a user point of 
view.
Reiser4 does not support the xattr/acl interface and is therefore worse
than Reiserfs3 + xattr patch. Offering an additional, cleaner approach
is great, but acl/xattr is in the official kernel and a long time will pass by 
till this interface can be deprecated and removed.
Imagine some filemanagers using xattr/acl interface because it is in the 2.6 
kernel release. Such stuff would work on every linux filesystem, but Reiser4.

>
> So if you want different xattr/acl semantics after you ignored all the
> discussion has been going on the last years start *now* to discuss you
> proposal on -fsdevel, and acl-devel, explaining why your semantics are
> better and hash out the implementation details to support both
> transparently.

I like the filesystem namespace very much and I guess I'm not alone, because  
procfs, sysfs, etc. are there. It even follows the the tradition of unix in 
accessing devices as special files.
Hans should win such a discussion hands down ;-)

>
> Funneling in new semantics through a low level driver is pretty much
> always wrong.
Someone has to experiment with the new semantics somehow. Rewriting
vfs would be overkill.

-- 
lg, Chris

