From: Andrew Morton <akpm@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 15:28:05 -0700
Message-ID: <20040825152805.45a1ce64.akpm@osdl.org>
References: <20040824202521.GA26705@lst.de>
	<412CEE38.1080707@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20532-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412CEE38.1080707@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

Hans Reiser <reiser@namesys.com> wrote:
>
> I had not intended to respond to this because I have nothing positive to 
> say, but Andrew said I needed to respond and suggested I should copy 
> Linus.

Yes, but I didn't say "flame Christoph and ignore the issues" ;)

There are lots of little things to do with implementation, coding style,
module exports, deadlocks, what code goes where, etc.  These are all normal
daily kernel business and we should set them aside for now and concentrate
on the bigger issues.

And as I see it, there are two big issues:

a) reiser4 extends the Linux API in ways which POSIX/Unix/etc do not
   anticipate and 

b) it does this within the context of just a single filesystem.

I see three possible responses:

a) accept the reiser4-only extensions as-is (possibly with post-review
   modifications, of course) or

b) accept the reiser4-only extensions with a view to turning them into
   kernel-wide extensions at some time in the future, so all filesystems
   will offer the extensions (as much as poss) or

c) reject the extensions.


My own order of preference is b) c) a).  The fact that one filesystem will
offer features which other filesystems do not and cannot offer makes me
queasy for some reason.

b) means that at some time in the future we need to hoist the reiser4
extensions (at a conceptual level) (and probably with restrictions) up into
the VFS.  This will involve much thought, argument and work.


To get us started on this route it would really help me (and, probably,
others) if you could describe what these API extensions are in a very
simple way, without referring to incomprehehsible web pages, and without
using terms which non-reiser4 people don't understand.

It would be best if each extension was addressed in a separate email
thread.

We also need to discuss what a reiser4 "module" is, what its capabilities
are, and what licensing implications they have.

Then, we can look at each one and say "yup, that makes sense - we want
Linux to do that" and we can also think about how we would implement it at
the VFS level.

If we follow the above route I believe we can make progress in a technical
direction and not get deadlocked on personal/political stuff.


Now, an alternative to all the above is to just merge reiser4 as-is, after
addressing all the lower-level coding issues.  And see what happens.  That
may be a thing which Linus wishes to do.  I'm easy.
