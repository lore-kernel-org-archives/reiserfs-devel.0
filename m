From: Scott Young <youngs1@sunyit.edu>
Subject: Re: Can compression at filesystem level improve
	overall	performance?
Date: Tue, 30 Mar 2004 23:51:18 -0500
Message-ID: <1080708678.31924.973.camel@localhost.localdomain>
References: <405B02ED.4010602@solidcode.net>
	 <1079713790.9729.1.camel@redeeman.linux.dk>
	 <16475.9613.375262.677576@laputa.namesys.com>
	 <1079978427.4658.63.camel@localhost.localdomain>
	 <405F46D8.1040607@namesys.com>
	 <1080011016.4658.408.camel@localhost.localdomain>
	 <20040329051614.GA19372@zero>
	 <1080617661.31924.91.camel@localhost.localdomain>
	 <20040330045359.GA22957@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17610-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040330045359.GA22957@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com



> > It probably does, but it's not particularly easy for the webserver
> 
> why not? it just sends the gzip file (or runs gzip, if there isn't a cached
> .gz version). i've noticed that when i use lynx now, it often says it's
> using ~/tmp/*.gz, so i think many sites are now using it. dynamic content is
> another issue, but that's just an issue of what's the cheapest way to get
> the data to the user, buy more throughput or buy more cpu.

If you make things easy and efficient for the webserver developers, then
they can focus their efforts on other optimizations.

> > developers.  How do they know if the uncompressed version of a file has
> > changed?  It's much more complicated to do this in an application that
> > can not easily detect file changes.  
> 
> mtime. 8)

So now they need to somehow store the mtime of the original file with
the gzipped file.  It does not seem so simple anymore, since you have do
deal with storing an mtime in a file, setting up permissions on this
file, not to mention that you're wasting space and you have do deal with
different scalability issues when working with millions or billions of
these mtime data entries and storing both the compressed and original
versions of the file.  The webserver developers should be able to tell
the FS (or some FS interface like VFS) that "B is a compressed version
of A, give me B" just as easily as they can tell the FS that "B is a
copy of A, give me B."


> > > i dunno about doing all this in the kernel. as it is, i wish the kernel
> > > wasn't so complicated. 8) what about a preload lib that puts everything
> > > through bitkeeper or cvs?
> > 
> > I don't quite understand what you mean about putting things through
> > bitkeeper or cvs, but it would probably be good to implement (at least
> 
> i meant all the versioning stuff. bitkeeper seems fairly complicated, and i
> wouldn't want that in the kernel.

It would probably be some relatively simple code in Reiser4's
storage-layer (for efficiency), and then the complicated stuff could be
done in userspace.  It could look like
/some/file/metas/versions/linear/5 from the FS, or maybe just a linked
list: /some/file/metas/versions/previous/versions/previous.  The
userspace programs would still need to do their own thing with diffing,
patching, figuring out how to show a versioning tree from a linear
versioning view, and transacting with the FS, but they would have this
new tool for efficient file versioning.

> > part of) this in VFS, as a replacement for VFS, as a new layer
> > underneath VFS, or as a module in VFS.  Why complicate the filesystem
> > code (except to maybe send higher-level instructions to the FS so the FS
> > can optimize its execution of those instructions, like sending the
> 
> i think someone recently announced (or proposed) a user mode fs interface.
> that would be nice for things like this (if you insist on putting it all in
> the fs 8).

That's what Reiser4 modules are for :)  Now if only VFS was modular....
Could you please post a link to this user mode fs interface?  I'd be
interested in reading about it.

> > > ide's can do this. and do you really want to have it run every time you
> > > save? i save often, many times when i know there are going to be problems
> > > cuz i haven't finished what i'm working on. 
> > 
> > No, it would compile when you access the executable and it realizes that
> > it's source files have changed, and there could be a usespace program
> > (running at nice level 20) that propagates recent changes.
> 
> you could just alias cmd="make && cmd".

I do something similar all the time.  However, with this method you
don't get a userspace program that tries to recompile while you're
rewriting, reviewing, and executing your code.  Wouldn't it be nice to
let the computer work more while you wait less?  This alias hack also
lacks information indicating how cmd was generated, so you can't easily
have utilities that take advantage of this information (like a makefile
generator or an automatic recompiler).

> 
> > There would also be no need for a makefile, since all of that
> > information would be stored in the instructions to create the derived
> 
> but what format would they be in? how would you describe all the
> dependencies? you'd end up with something just like a makefile. now you've
> moving make into kernel.

With modules, Reiser4 is a very extensible filesystem.  The dependencies
could be stored in whatever format is most efficient for storing the
dependencies, and those dependencies could be used in userspace in
whatever complicated way the userspace programs want to use them.  This
is the same as what i'm saying about versioning, but in a slightly
different example.  The FS would just store some more information at the
request of userspace programs.  The FS should provide: 1. a convenient
and powerful way of expressing this information and 2. an efficient way
of storing this information.  Every filesystem so far has failed in
doing this to some extent, and I'm ready for something with more
expressive power.

> > executable.  It would also be trivial to generate the makefile by
> > running a program that uses the stored instructions in the derived
> > executable to generate the makefile.  Wouldn't it be nice to have your
> > makefile generated as you compile the code?  It would be good if the
> > system could store and express things that are somewhat evident from the
> > user's actions.
> 
> ide's can generate makefiles, i think (i only use emacs).

Don't you consider Emacs to be an IDE?  I think it could even be it's
own operating system :)

Joking aside, when you compile using emacs, it could store and use the
fact that the resulting executable was generated by running a bunch of
commands you typed in.  With this information, a userspace program could
help generate the makefile.  I don't have much to say about other IDEs
because I haven't used any Unix IDEs and they probably have no problem
generating makefiles.  IDEs can wrap up so much information because
everything is built within them.  This information-wrapping could be
done in other places to achieve the same effects.





