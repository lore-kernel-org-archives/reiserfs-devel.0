From: Tom Vier <tmv@comcast.net>
Subject: Re: Can compression at filesystem level improve overall	performance?
Date: Thu, 8 Apr 2004 17:46:28 -0400
Message-ID: <20040408214628.GA13059@zero>
References: <405B02ED.4010602@solidcode.net> <1079713790.9729.1.camel@redeeman.linux.dk> <16475.9613.375262.677576@laputa.namesys.com> <1079978427.4658.63.camel@localhost.localdomain> <405F46D8.1040607@namesys.com> <1080011016.4658.408.camel@localhost.localdomain> <20040329051614.GA19372@zero> <1080617661.31924.91.camel@localhost.localdomain> <20040330045359.GA22957@zero> <1080708678.31924.973.camel@localhost.localdomain>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17808-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1080708678.31924.973.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Tue, Mar 30, 2004 at 11:51:18PM -0500, Scott Young wrote:
> If you make things easy and efficient for the webserver developers, then
> they can focus their efforts on other optimizations.

i don't know how apache handles caching compressed static content, but it
can't be that hard. i don't think there's any reason to put that in the
kernel.

> > > developers.  How do they know if the uncompressed version of a file has
> > > changed?  It's much more complicated to do this in an application that
> > > can not easily detect file changes.  
> > 
> > mtime. 8)
> 
> So now they need to somehow store the mtime of the original file with
> the gzipped file.  It does not seem so simple anymore, since you have do

no, just check if the mtime of the .html is > the compressed cached version.

> deal with storing an mtime in a file, setting up permissions on this
> file, not to mention that you're wasting space and you have do deal with

wasting space how?

> different scalability issues when working with millions or billions of
> these mtime data entries and storing both the compressed and original

that has to be done somewhere (i don't think the kernel is right place).

> versions of the file.  The webserver developers should be able to tell
> the FS (or some FS interface like VFS) that "B is a compressed version
> of A, give me B" just as easily as they can tell the FS that "B is a
> copy of A, give me B."

> > i meant all the versioning stuff. bitkeeper seems fairly complicated, and i
> > wouldn't want that in the kernel.
> 
> It would probably be some relatively simple code in Reiser4's
> storage-layer (for efficiency), and then the complicated stuff could be
> done in userspace.  It could look like

if it's handing this complexity off to a daemon, then i have less of a
problem with it. i still think apps can (and already do) deal with this
stuff. i just don't think it's useful or necessary. one man's trash is
another's treasure, though.

> /some/file/metas/versions/linear/5 from the FS, or maybe just a linked
> list: /some/file/metas/versions/previous/versions/previous.  The
> userspace programs would still need to do their own thing with diffing,
> patching, figuring out how to show a versioning tree from a linear
> versioning view, and transacting with the FS, but they would have this
> new tool for efficient file versioning.

> > i think someone recently announced (or proposed) a user mode fs interface.
> > that would be nice for things like this (if you insist on putting it all in
> > the fs 8).
> 
> That's what Reiser4 modules are for :)  Now if only VFS was modular....
> Could you please post a link to this user mode fs interface?  I'd be
> interested in reading about it.

i don't have one. i just remember someone meantioning it on l-k.

> I do something similar all the time.  However, with this method you
> don't get a userspace program that tries to recompile while you're
> rewriting, reviewing, and executing your code.  Wouldn't it be nice to
> let the computer work more while you wait less?  This alias hack also
> lacks information indicating how cmd was generated, so you can't easily
> have utilities that take advantage of this information (like a makefile
> generator or an automatic recompiler).

an ide can do all this.

> > > There would also be no need for a makefile, since all of that
> > > information would be stored in the instructions to create the derived
> > 
> > but what format would they be in? how would you describe all the
> > dependencies? you'd end up with something just like a makefile. now you've
> > moving make into kernel.
> 
> With modules, Reiser4 is a very extensible filesystem.  The dependencies
> could be stored in whatever format is most efficient for storing the
> dependencies, and those dependencies could be used in userspace in
> whatever complicated way the userspace programs want to use them.  This

so now you need an in-kernel 'make', right?

> is the same as what i'm saying about versioning, but in a slightly
> different example.  The FS would just store some more information at the
> request of userspace programs.  The FS should provide: 1. a convenient
> and powerful way of expressing this information and 2. an efficient way
> of storing this information.  Every filesystem so far has failed in
> doing this to some extent, and I'm ready for something with more
> expressive power.

> > ide's can generate makefiles, i think (i only use emacs).
> 
> Don't you consider Emacs to be an IDE?  I think it could even be it's
> own operating system :)
> 
> Joking aside, when you compile using emacs, it could store and use the
> fact that the resulting executable was generated by running a bunch of
> commands you typed in.  With this information, a userspace program could
> help generate the makefile.  I don't have much to say about other IDEs
> because I haven't used any Unix IDEs and they probably have no problem
> generating makefiles.  IDEs can wrap up so much information because
> everything is built within them.  This information-wrapping could be
> done in other places to achieve the same effects.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
