From: Scott Young <youngs1@sunyit.edu>
Subject: Re: Can compression at filesystem level
	improve	overall	performance?
Date: Wed, 24 Mar 2004 11:19:23 -0500
Message-ID: <1080145163.4658.1314.camel@localhost.localdomain>
References: <405B02ED.4010602@solidcode.net>
	 <1079713790.9729.1.camel@redeeman.linux.dk>
	 <16475.9613.375262.677576@laputa.namesys.com>
	 <1079978427.4658.63.camel@localhost.localdomain>
	 <405F46D8.1040607@namesys.com>
	 <1080011016.4658.408.camel@localhost.localdomain>
	 <4060189B.2000500@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17433-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4060189B.2000500@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Oops... I forgot to use "reply to list" instead of "reply to sender."



> >What I'm saying is that you can start writing uncompressed data to the
> >drive while the yet-to-be-written data is being compressed.  The goal is
> >to have some segments of data compressed, and have them compressed
> >before they come up next for writing to the drive.  Virtually no time is
> >lost if the data cannot be compressed because the data will be sent to
> >the disk at full speed anyway, whether or not the system had time to
> >compress it.  The repacker could compress the data that was written to
> >the drive before it could be compressed if the repacker thinks that
> >compression would speed up reading of that data (or significantly reduce
> >space usage, which will generally happen at the same time as data moving
> >faster because of compression).
> >  
> >
> Too much complexity.  LZW is fast and effective.

If you apply LZW when the data is not compressible, or when running a
CPU bound application, then you would slow the system down.  My approach
tries to eliminate that	effect (at least during writes) by changing the
compression algorithm (possibly to no compression) depending on how the
compression is doing in relation to the drive writes.  Set up a race
between the compression and the drive write, and the data will always be
written at an optimal speed, whether the data is coming from an IO or
CPU intensive application.


> >As an example, take a web server that has HTTP compression enabled. 
> >Instead of compressing the data once per request, simply store the
> >compressed version and send that when the next request occurs.  The
> >server isn't compressing data all the time, so the CPU can be used for
> >other tasks.  To make life easier on the web-server developers, the
> >filesystem could have an interface that allows for defining a file as a
> >derivative of another with some transformation done to that file, such
> >as a compression algorithm.  It'd be like telling the filesystem that
> >"File B is what happens when you do X to file A."  The web server
> >developer would not have to worry about storing the compressed file to
> >increase performance because it would be handled by the filesystem. 
> >Furthermore, the web server developer would not have to use the
> >compression libraries directly, making their job much easier.
> >
> >There could be a "live" derivative, where any change to the original
> >file reflects in the derivative file, or they could be constant, where
> >any change in the original does not reflect in the derivative.  When I
> >say "constant" I mean that the source file can be thought of as being
> >constant because any change to the original will not be reflected in the
> >derivative.  Think of the simplest case: a derivative file with the
> >identity transform applied to the original file, or simply stated,
> >copying a file.  A "live" derivative with the identity transform would
> >act like a hard link, and a constant derivative with the identity
> >transform would act like copying the entire file and storing it
> >separately (Underneath the covers, the transform could just link the
> >derived file to the original with copy-on-write enabled, thereby
> >improving performance).  This becomes complicated depending on what
> >files are actually stored and what is the fastest way to arrange
> >things.  The derivative could simply be calculated from the original,
> >and space can be saved by not storing the derivative on disk, or CPU
> >time could be saved by storing it on disk (e.g. an MD5 derived-file). 
> >Sometimes the derivative may load faster if it is calculated from the
> >original (e.g. if /dev/urandom is implemented as a derived stream from
> >some seed file.  In this case the file size could be infinite too, so
> >storing it would not be prudent).  If the derivative file is not stored
> >on the disk, and it is marked as a constant derivative, then the
> >original file would have to use copy-on-write so that the constant
> >derivative file isn't altered.
> >
> >Your idea of /etc/.passwd as the combination of small per-user password
> >files could be implemented using derived files.  They would need some
> >way of moving the writes to the combined file back to the original small
> >files, but that could be a part of the derived-data plugin for combined
> >files.
> >
> >As another example, gcc could create a "live" derived file a.out that
> >that means "a.out is the live derivative of files src1.c, src2.c,
> >src3.c, src4.c when applied using the command gcc -o a.out src1.c src2.c
> >src3.c src4.c".  Of course it would be encoded in the syntax that the
> >derived-file plugin would understand.  When the source files change, the
> >developer wouldn't have to rerun gcc to run the executable.  The file
> >would automagically be compiled from the sources.
> >
> >The more I think about it, it seems that derived-files could be
> >implemented as plugin(s) with only one extra feature added to the core
> >filesystem: copy-on-write.  (Copy-on-write could be extended to only
> >write changes, and have the new version be constructed as a derived file
> >from the original, thereby compactly maintaining multiple versions of a
> >file and improving write performance, but I digress)
> >  
> >
> Consider our use of compression atoms, it may reduce the incentive for 
> what you describe.

I'm not exactly sure about what you mean by a compression atom, but what
I describe goes beyond mere compression.  It would allow the application
developers to use, as an example, compressed versions of a file and not
have to worry about how, when, and if the compressed version of a file
is stored.  All they would have to say is "I want a compressed version
of this file," and the filesystem would efficiently deliver that
request, possibly storing the result to speed up future identical
requests.  Derived data is mostly related to the semantic layer while
the compress-as-you-write idea is completely related to the storage
layer.


> >I have many other ideas relating to compression.  In high school I
> >designed a filesystem that used the ideas in rsync to find identical
> >segments of data between files, and only write the matching segments
> >once.  It could barely be called a filesystem (It was written as a
> >filesystem-within-a-file using java and I didn't implement deletion or
> >mounting), but it gave me many ideas and directions to go for making the
> >general idea work in a real filesystem.  One thing I realized is that an
> >array of millions or billions of random hashes can be compressed, and a
> >Trie is a good basis for implementing a compressed data structure for
> >random hashes (I could further describe the complete data structure I
> >designed, but that is probably worth writing a coherent peer-reviewed
> >paper instead of quickly writing an incoherent email on the topic). 
> >  
> >
> I think ATT and MS have done work in this area.  It is interesting 
> topic, you need to (deeply) worry about adding additional seeks though.

I believe MS calls it Shadow Copy, and all it does is write what was
changed in a file and keep the old versions.  Using rsync for finding
matching data is a bit more effective at reducing space usage, and
storing the signatures on all of the files on the filesystem leads to
yet another algorithm I have devised: a network algorithm that can
quickly find matching blocks of data between a file being downloaded and
any file on the filesystem (like rsync, but without the need to specify
source files), AND it can easily be layered on top of other systems like
BitTorrent or Freenet.

And yes, additional seeks is a major problem.  One solution to this
would be to do a complete copy-on-write when modifying a file (or at
least copy enough to minimize seeks), and have the repacker encode the
old version of the file using the signature-search technique.  There is
no need for additional seeks in the most recent version of the file, and
the old versions are stored in a compact manner, especially if that
particular file is large with few changes.  Of course, some performance
is sacrificed by copying the file on write, but much of this loss can be
overcome, and the result is the world's fastest versioning filesystem. 
Additional metadata could identify the program and the user that made
that specific version of a file, and any malicious changes can be
selectively rolled back.  An administrator may use the metadata to audit
the changes a file made to the filesystem, or a program could be run in
a jail where the changes it makes to the filesystem are only visible to
itself.  Versioning opens up a plethora of possibilities for data
security.

Looking at the grid of security Hans has previously described (files x
users x programs), instead of having the value at each point be rw, r-,
-w, or --, versioning would add in rv and -v, where the touched files
are written using versioning control and possibly rj and -j for a
changes-are-only-visible-to-the-program-itself-or-admins-who-want-to-
see-those-changes jail.





