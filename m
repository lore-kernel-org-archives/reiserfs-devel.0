From: Tom Vier <tmv@comcast.net>
Subject: Re: Can compression at filesystem level improve overall	performance?
Date: Mon, 29 Mar 2004 23:53:59 -0500
Message-ID: <20040330045359.GA22957@zero>
References: <405B02ED.4010602@solidcode.net> <1079713790.9729.1.camel@redeeman.linux.dk> <16475.9613.375262.677576@laputa.namesys.com> <1079978427.4658.63.camel@localhost.localdomain> <405F46D8.1040607@namesys.com> <1080011016.4658.408.camel@localhost.localdomain> <20040329051614.GA19372@zero> <1080617661.31924.91.camel@localhost.localdomain>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17587-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1080617661.31924.91.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Young <youngs1@sunyit.edu>
Cc: reiserfs-list@namesys.com

On Mon, Mar 29, 2004 at 10:34:36PM -0500, Scott Young wrote:
> This is what the repacker is for.  It squeezes slums together to
> increase fanout (and therefore decrease number of seeks), and eventually
> some other compression methods may be implemented to speed up total
> throughput.

a little off topic, but
an online defragger is an interesting idea. i think i remember the topic
coming up for ext2 along time ago. iirc, reiserfs can lose performance over
time (usage, actually), too.

> It probably does, but it's not particularly easy for the webserver

why not? it just sends the gzip file (or runs gzip, if there isn't a cached
.gz version). i've noticed that when i use lynx now, it often says it's
using ~/tmp/*.gz, so i think many sites are now using it. dynamic content is
another issue, but that's just an issue of what's the cheapest way to get
the data to the user, buy more throughput or buy more cpu.

> developers.  How do they know if the uncompressed version of a file has
> changed?  It's much more complicated to do this in an application that
> can not easily detect file changes.  

mtime. 8)

> > i dunno about doing all this in the kernel. as it is, i wish the kernel
> > wasn't so complicated. 8) what about a preload lib that puts everything
> > through bitkeeper or cvs?
> 
> I don't quite understand what you mean about putting things through
> bitkeeper or cvs, but it would probably be good to implement (at least

i meant all the versioning stuff. bitkeeper seems fairly complicated, and i
wouldn't want that in the kernel.

> part of) this in VFS, as a replacement for VFS, as a new layer
> underneath VFS, or as a module in VFS.  Why complicate the filesystem
> code (except to maybe send higher-level instructions to the FS so the FS
> can optimize its execution of those instructions, like sending the

i think someone recently announced (or proposed) a user mode fs interface.
that would be nice for things like this (if you insist on putting it all in
the fs 8).

> instruction "copy A to B" to the FS so the FS can do copy-on-write
> instead of having to take a bunch of "read this from A" and "write this
> to B" instructions that have the same effect)?

yeah, cow would be neat.

> > ide's can do this. and do you really want to have it run every time you
> > save? i save often, many times when i know there are going to be problems
> > cuz i haven't finished what i'm working on. 
> 
> No, it would compile when you access the executable and it realizes that
> it's source files have changed, and there could be a usespace program
> (running at nice level 20) that propagates recent changes.

you could just alias cmd="make && cmd".

> There would also be no need for a makefile, since all of that
> information would be stored in the instructions to create the derived

but what format would they be in? how would you describe all the
dependencies? you'd end up with something just like a makefile. now you've
moving make into kernel.

> executable.  It would also be trivial to generate the makefile by
> running a program that uses the stored instructions in the derived
> executable to generate the makefile.  Wouldn't it be nice to have your
> makefile generated as you compile the code?  It would be good if the
> system could store and express things that are somewhat evident from the
> user's actions.

ide's can generate makefiles, i think (i only use emacs).

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
