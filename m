From: Scott Young <youngs1@sunyit.edu>
Subject: Re: Can compression at filesystem level improve
	overall	performance?
Date: Mon, 29 Mar 2004 22:34:36 -0500
Message-ID: <1080617661.31924.91.camel@localhost.localdomain>
References: <405B02ED.4010602@solidcode.net>
	 <1079713790.9729.1.camel@redeeman.linux.dk>
	 <16475.9613.375262.677576@laputa.namesys.com>
	 <1079978427.4658.63.camel@localhost.localdomain>
	 <405F46D8.1040607@namesys.com>
	 <1080011016.4658.408.camel@localhost.localdomain>
	 <20040329051614.GA19372@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17585-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040329051614.GA19372@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Mon, 2004-03-29 at 00:16, Tom Vier wrote:
> On Mon, Mar 22, 2004 at 10:03:36PM -0500, Scott Young wrote:
> > What I'm saying is that you can start writing uncompressed data to the
> > drive while the yet-to-be-written data is being compressed.  The goal is
> 
> i like your race idea. one problem is all writes now take significant cpu
> (depending on the method). 

The neat part about it is that the CPU will be used, but in a way that
it is generally not a problem.  It shouldn't slow down cpu-bound
applications because in that case the buffer will be mostly empty while
it computes.  However, an app writing compressible data might slow down
another CPU-intensive one.  I have realized that the compression should
be done in a separate thread (because it would otherwise block as it's
running), and all writes could be compressed using the same low-priority
thread (or threads, since there would be 1 thread per processor).

> i'm wondering about a daemon that (in userspace)
> that scans for files that are worth compressing. that's what disk doubler
> used to do. i'd be interested to see some benchmarks, to see if compression
> has much effect on total throughput.

This is what the repacker is for.  It squeezes slums together to
increase fanout (and therefore decrease number of seeks), and eventually
some other compression methods may be implemented to speed up total
throughput.


> > As an example, take a web server that has HTTP compression enabled. 
> > Instead of compressing the data once per request, simply store the
> > compressed version and send that when the next request occurs.  The
> 
> the server should cache the compressed versions in files. i'm pretty sure
> apache does.

It probably does, but it's not particularly easy for the webserver
developers.  How do they know if the uncompressed version of a file has
changed?  It's much more complicated to do this in an application that
can not easily detect file changes.  

> 
> > There could be a "live" derivative, where any change to the original
> > file reflects in the derivative file, or they could be constant, where
> > any change in the original does not reflect in the derivative.  When I
> <snip>
> 
> i dunno about doing all this in the kernel. as it is, i wish the kernel
> wasn't so complicated. 8) what about a preload lib that puts everything
> through bitkeeper or cvs?

I don't quite understand what you mean about putting things through
bitkeeper or cvs, but it would probably be good to implement (at least
part of) this in VFS, as a replacement for VFS, as a new layer
underneath VFS, or as a module in VFS.  Why complicate the filesystem
code (except to maybe send higher-level instructions to the FS so the FS
can optimize its execution of those instructions, like sending the
instruction "copy A to B" to the FS so the FS can do copy-on-write
instead of having to take a bunch of "read this from A" and "write this
to B" instructions that have the same effect)?

> > developer wouldn't have to rerun gcc to run the executable.  The file
> > would automagically be compiled from the sources.
> 
> ide's can do this. and do you really want to have it run every time you
> save? i save often, many times when i know there are going to be problems
> cuz i haven't finished what i'm working on. 

No, it would compile when you access the executable and it realizes that
it's source files have changed, and there could be a usespace program
(running at nice level 20) that propagates recent changes.

There would also be no need for a makefile, since all of that
information would be stored in the instructions to create the derived
executable.  It would also be trivial to generate the makefile by
running a program that uses the stored instructions in the derived
executable to generate the makefile.  Wouldn't it be nice to have your
makefile generated as you compile the code?  It would be good if the
system could store and express things that are somewhat evident from the
user's actions.

> a "lint" button would be better, imho.

A programming language that is designed well and doesn't need things
like lint would be better yet, but that is a bit off-topic.  If the
systems designers made it easier to make applications, then the
applications designers would have more time to create buttons like that.





