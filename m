From: "Burnes, James" <james.burnes@gwl.com>
Subject: FW: reiser4 plugin for maildir
Date: Wed, 3 Dec 2003 12:59:22 -0700
Message-ID: <3DF9165145FACB4C96977FF650C1E90409633541@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16218-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>



-----Original Message-----
From: Burnes, James 
Sent: Wednesday, December 03, 2003 1:38 PM
To: 'Hans Reiser'
Subject: RE: reiser4 plugin for maildir



> >I was considering installing qmail recently and upon analyzing the
> >architecture of their queue structure it looked like Dan Bernstein
> expended > >a lot of effort to achieve efficiency when you have 'many
files in the
> same
> >directory'.
> >
> >All the while I was thinking that Hans Reiser has already solved this
> >problem in reiserfs.
> >
> >Has anyone written a reiser4 plugin for qmail that implements this
> queueing
> >structure directly in the file system?
> >
> >
> No, and I'd love to see it happen.

Ok.  At least I'm on the right track.

I was re-reading the reiser4 docs yesterday and specifically the methods
that need to be implemented for each reiser4 plugin/object type.

All very elegant, but what wasn't too clear was the interface between the
new apps that can take advantage of these pluggable objects directly and the
interface between old-style POSIX apps and reiser4 that just want to see
these objects as files.

Since I just joined the reiserfs list, I'll copy/move this discussion there.
I'm sure there are a lot of people thinking about just these types of
issues. That way we can efficiently offload your brain, Hans ;-)

Some use-cases: (man haven't done some of this for a while...)

1. Web application in PHP or something acting as an OGG or MP3 store,
archives and reads audio files.  There is obvious structure in these files
and it seems silly to keep opening and reparsing their contents to extract
various bits of header information or separate forks in the data.

The web app understands this and R/W's the MP3 file using reiser4 into its
constituent components via the MP3 reiser4 plugin.  All interaction between
the app and the MP3 object lives at this layer of OO abstraction.

Meanwhile the host system's backup procedure uses POSIX fopens or whatever
to backup and restore the MP3 files.

Does the plugin have to know how to serially marshall and unmarshall the
object for POSIX programs so that it appears as a 'normal' MP3 file?

2. Someone develops a new mod_dav (mod_reiserDAV?) for Apache, that uses a
special reiser4 plugin to implement all of the DAV structures in reiser4
instead of the current hack that uses a DBM database.  Interesting/cool
features of DAV such as ordered DAV containers and revision control are
implemented directly with the reiser4 plugin.

3. As mentioned before, Dan Berstein's qmail program goes through a *lot* of
gyrations to efficiently implement many files in one directory (as well as
other issues).  I haven't tried a qmail queue on reiser3, but I gather that
they end up fighting each other to achieve the same goals.  Rather than
qmail trying to simulate a better file system, why not hack it to implement
message queuing functions in a reiser4 plugin.

Anyway, I'm just a beginner at kernel level filesystems, but I do have about
20 years systems software background so maybe I should give it a go.  It's
not going to get done tomorrow, but it should be fun.  All I have to loose
is my test partition ;-)

jim burnes
security engineer
great-west, denver



