From: Scott Young <youngs1@sunyit.edu>
Subject: Re: Can compression at filesystem level improve
	overall	performance?
Date: Mon, 22 Mar 2004 22:03:36 -0500
Message-ID: <1080011016.4658.408.camel@localhost.localdomain>
References: <405B02ED.4010602@solidcode.net>
	 <1079713790.9729.1.camel@redeeman.linux.dk>
	 <16475.9613.375262.677576@laputa.namesys.com>
	 <1079978427.4658.63.camel@localhost.localdomain>
	 <405F46D8.1040607@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17397-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <405F46D8.1040607@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Mon, 2004-03-22 at 15:04, Hans Reiser wrote:
> Scott Young wrote:
> 
> >>That's common misconception. :)
> >>
> >>The goal of compression is to conserve disk bandwidth rather than space.
> >>
> >>By compressing it is possible to transfer data (== uncompressed data
> >>user works with), at a rate higher than raw device bandwidth.
> >>    
> >>
> >
> >I will be doing some research on an algorithm that speeds up data
> >transfers over a network by adaptively selecting a compression
> >algorithm.  It can be applied to filesystem reads and writes too.  When
> >the send queue is reasonably full on the server, it starts compressing
> >data at the tail of the queue while sending the data at the head of the
> >queue.  If the output stream catches up to segment currently being
> >compressed, then that segment is sent uncompressed.  If the compressed
> >data is not significantly smaller, then the uncompressed data is sent
> >instead.  For network applications that are not network interface bound
> >(like rsync over a 100mbit connection), the buffer will be empty most of
> >the time and therefore little compression would be needed or wanted as
> >it would only slow the application down.  Compression is chosen from a
> >pool of algorithms and varied depending on the history of buffer
> >overflows and under-runs.  Slower, better compression algorithms are
> >used when the buffer is mostly full and the compression is observably
> >effective.  The idea here is to minimize the time between the client
> >requesting the data and having the usable data in a minimal amount of
> >time.  This can be seen as a time-verses-amount-of-usable-data-on-client
> >graph, and some applications prefer a low latency for the initial stream
> >of data (such as a web page) whereas some prefer the time to retrieve a
> >very large piece of data (such as scp scott@1.2.3.4/SomeBigDocument.sxw
> >/home/scott over a 56k modem).
> >
> >Adapting this to filesystem concepts, the server can be seen as the
> >write process and the client can be seen as the read process. 
> >
> I don't understand.  Why not view the client as the disk drive and the 
> bus as the network?

Interesting view.  The "server," as I see it, is the source of the data,
and the client is the ultimate destination.  In the context of a
filesystem, one could see the disk as the ultimate destination. 
However, data on a disk has no use at all until it is read and used by
some application.  Therefore, I see writing to the filesystem as a
server and, reading from the filesystem as a client, and the bus and
disk drive together as the network (at least when translating the
concept from a network context to a filesystem context).

> > The idea
> >can be applied to Reiser4 by compressing the overwrite set while the
> >journal data is being written, and then compressing the tail of the
> >relocate set moving backwards until the write stream catches up to the
> >compression.  It could also take into account the estimated
> >decompression time when reading the data back, and use it for deciding
> >whether the compression ratio is good enough to write the compressed
> >data instead of the uncompressed data.
> >  
> >
> I didn't understand the above.

What I'm saying is that you can start writing uncompressed data to the
drive while the yet-to-be-written data is being compressed.  The goal is
to have some segments of data compressed, and have them compressed
before they come up next for writing to the drive.  Virtually no time is
lost if the data cannot be compressed because the data will be sent to
the disk at full speed anyway, whether or not the system had time to
compress it.  The repacker could compress the data that was written to
the drive before it could be compressed if the repacker thinks that
compression would speed up reading of that data (or significantly reduce
space usage, which will generally happen at the same time as data moving
faster because of compression).


> >Another interesting twist would be to cache the compressed data if the
> >same data is going to be sent from the server several times.  This
> >reduces CPU overhead on the server (and possibly it's memory
> >requirements for caching the data, and reduces the amount of data that
> >needs to be read from the drive), but it is complicated in the context
> >of a network algorithm and is mostly application-dependent.  This is
> >research for another day, maybe in the form of a derived-data plugin for
> >ReiserFS where an application tells the filesystem how to construct the
> >file, and the filesystem can store the original, the result, or both,
> >depending on space needs and performance analysis, with copy-on-write
> >metadata flags when appropriate.
> >  
> >
> I didn't understand the above.

Yeah, I realize now what I wrote was an incoherent mess.  I think too
much and write too little sometimes :-)  I was combining the idea for
networking with another different idea for ReiserFS, and that
combination came out unclear.

As an example, take a web server that has HTTP compression enabled. 
Instead of compressing the data once per request, simply store the
compressed version and send that when the next request occurs.  The
server isn't compressing data all the time, so the CPU can be used for
other tasks.  To make life easier on the web-server developers, the
filesystem could have an interface that allows for defining a file as a
derivative of another with some transformation done to that file, such
as a compression algorithm.  It'd be like telling the filesystem that
"File B is what happens when you do X to file A."  The web server
developer would not have to worry about storing the compressed file to
increase performance because it would be handled by the filesystem. 
Furthermore, the web server developer would not have to use the
compression libraries directly, making their job much easier.

There could be a "live" derivative, where any change to the original
file reflects in the derivative file, or they could be constant, where
any change in the original does not reflect in the derivative.  When I
say "constant" I mean that the source file can be thought of as being
constant because any change to the original will not be reflected in the
derivative.  Think of the simplest case: a derivative file with the
identity transform applied to the original file, or simply stated,
copying a file.  A "live" derivative with the identity transform would
act like a hard link, and a constant derivative with the identity
transform would act like copying the entire file and storing it
separately (Underneath the covers, the transform could just link the
derived file to the original with copy-on-write enabled, thereby
improving performance).  This becomes complicated depending on what
files are actually stored and what is the fastest way to arrange
things.  The derivative could simply be calculated from the original,
and space can be saved by not storing the derivative on disk, or CPU
time could be saved by storing it on disk (e.g. an MD5 derived-file). 
Sometimes the derivative may load faster if it is calculated from the
original (e.g. if /dev/urandom is implemented as a derived stream from
some seed file.  In this case the file size could be infinite too, so
storing it would not be prudent).  If the derivative file is not stored
on the disk, and it is marked as a constant derivative, then the
original file would have to use copy-on-write so that the constant
derivative file isn't altered.

Your idea of /etc/.passwd as the combination of small per-user password
files could be implemented using derived files.  They would need some
way of moving the writes to the combined file back to the original small
files, but that could be a part of the derived-data plugin for combined
files.

As another example, gcc could create a "live" derived file a.out that
that means "a.out is the live derivative of files src1.c, src2.c,
src3.c, src4.c when applied using the command gcc -o a.out src1.c src2.c
src3.c src4.c".  Of course it would be encoded in the syntax that the
derived-file plugin would understand.  When the source files change, the
developer wouldn't have to rerun gcc to run the executable.  The file
would automagically be compiled from the sources.

The more I think about it, it seems that derived-files could be
implemented as plugin(s) with only one extra feature added to the core
filesystem: copy-on-write.  (Copy-on-write could be extended to only
write changes, and have the new version be constructed as a derived file
from the original, thereby compactly maintaining multiple versions of a
file and improving write performance, but I digress)

> >I haven't started coding the adaptive compression algorithm yet, but I
> >have a general idea about how I am going to implement it.  For the
> >proof-of-concept, I want to write this using sockets and some basic
> >library compression algorithms (gzip, bzip2, and maybe a simple MTF +
> >Adaptive Huffman).  Later variants may work with TCP or other protocols
> >around that layer.  Any suggestions will be appreciated.
> >  
> >
> I think we need to use adaptive compression in Reiser4, based on the 
> type of file being compressed,  

I think it should be based on how well compression is working during the
actual write.  That way you don't have the overhead of compression when
there is no benefit of compression, and CPU-bound applications will not
run slower because of CPU-intensive compression.  The type of file could
be used, but I'd like to see it as only a suggestion to the adaptive
compression heuristic.

> and anyone who finds it interesting to 
> develop heuristics for selecting compression strategies is welcome to 
> help and join the fun.

And it shall be fun!

I have many other ideas relating to compression.  In high school I
designed a filesystem that used the ideas in rsync to find identical
segments of data between files, and only write the matching segments
once.  It could barely be called a filesystem (It was written as a
filesystem-within-a-file using java and I didn't implement deletion or
mounting), but it gave me many ideas and directions to go for making the
general idea work in a real filesystem.  One thing I realized is that an
array of millions or billions of random hashes can be compressed, and a
Trie is a good basis for implementing a compressed data structure for
random hashes (I could further describe the complete data structure I
designed, but that is probably worth writing a coherent peer-reviewed
paper instead of quickly writing an incoherent email on the topic). 
Furthermore, I realized that my filesystem algorithm would significantly
slow down the system, and only be applicable in specific circumstances
(such as a when there is a dedicated file server that has plenty of CPU
and RAM to give up).  This leads to the network algorithm for
compressing when compressing is good:  it embodies a general heuristic 
for algorithms that have parts that don't have to be done but can have
positive effects they are done.  For example, compression does not have
to be done to send data across a network, and an rsync-like signature
search does not need to be done to write data to a filesystem, but using
them will lead to a performance improvement in some circumstances.

If/when I implement these ideas, I will contribute them to ReiserFS. 
I'd have more time to work on this if I didn't have college and a
part-time job, but there's no rush to implement all these features.







