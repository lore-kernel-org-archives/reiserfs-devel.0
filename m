From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 15:59:43 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>
 <20040825152805.45a1ce64.akpm@osdl.org> <112698263.20040826005146@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20536-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <112698263.20040826005146@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spam <spam@tnonline.net>
Cc: Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com



On Thu, 26 Aug 2004, Spam wrote:
> 
> > My own order of preference is b) c) a).  The fact that one filesystem will
> > offer features which other filesystems do not and cannot offer makes me
> > queasy for some reason.
> 
>   This last sentence makes me wonder. Where is Linux heading? The idea
>   that   a  FS  cannot  contain  features that no other FS has is very
>   scary.

That's not what Andrew said or meant.

Note the "cannot offer". As in "there is no way to offer them even if the 
filesystem could support it otherwise". 

We have tons of filesystems that do things other filesystems cannot do.  
Most filesystems support writing to a file - despite the fact that some
filesystems (iso9600 being an obvious one) cannot. The infrastructure is
there in the VFS layer, and it becomes a _choice_ for the filesystem
whether it offers certain capabilities.

So look at what Andrew said, again: his top choice would be (b). Let's see 
what that was again, shall we?

> b) accept the reiser4-only extensions with a view to turning them into
>    kernel-wide extensions at some time in the future, so all filesystems
>    will offer the extensions (as much as poss) or

In other words, if reiserfs does something special, we should make 
standard interfaces for doing that special thing, so that everybody can 
do it without stepping on other peoples toes.

That doesn't mean that we'd _force_ everybody to do it. The same way we 
don't force iso9660 to write to a CD-ROM.

		Linus
