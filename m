From: "David Dabbs" <david@dabbs.net>
Subject: RE: Fibration questions
Date: Mon, 19 Jul 2004 02:21:08 -0500
Message-ID: <20040719072026.1959F15D1B@mail03.powweb.com>
References: <40FB4CC4.80300@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19677-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40FB4CC4.80300@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'David Masover' <ninja@slaphack.com>, 'Hans Reiser' <reiser@namesys.com>
Cc: reiserfs-list@namesys.com


> -----Original Message-----
> From: David Masover [mailto:ninja@slaphack.com]
> Sent: Sunday, July 18, 2004 11:24 PM
> To: Hans Reiser
> Cc: David Dabbs; reiserfs-list@namesys.com
> 
> Hans Reiser wrote:
> [...]
> | If FS naming was better designed, filenames would not have extensions.
> | I prefer to first better design naming, and then not need to optimize
> | the API for extensions.
> 
> Still, if we're going to fibrate by file type and want to find a file by
> file type, there needs to be -- surprise! -- a standard way to determine
> file type.
> 

There be dragons. Despite the fact that I advocated applying fibration data
to filesystem queries, the two (fibrating by file type [extension] and
'finding a file by file type') are quite different. The former is simply a
way to bunch/glom/group particular filesystem objects together in the tree.
The latter requires metadata beyond that provided by the filesystem objects
themselves.

Leaving aside fibration for a moment, there is a (big) difference between
the filesystem's ability to answer an (objective) query regarding some
aspect of an object's human-readable name (search by extension) and what it
seems you are seeking (search by file _type_). In your use case, the
filesystem would be required to 'deduce,' via suitable, consistent and
human-maintained metadata, which objects are subclasses of some 'type' 
in a human-maintained 'FileObject' ontology.

This is the kind of thing for which the W3C's SemanticWeb activity might
advocate OWL/RDF. Possible means aside, the following are among the
questions the community would need to address:
 
1. What is the range of 'file types'?
2. The range of known 'file type aliases' (extensions)?
3. How should applications interpret and buy into this consensus?
4. At what level is this ontology managed? The OS, VFS, particular
filesystems?
5. What is a portable metadata storage format that is easily maintained (and
shared) by humans and parsed/employed by applications?

> Extensions are universal, and aren't going away soon.  What do we want

Extensions are a convention humans share that are tenuously/inconsistently
'understood' by the computers humans use. Under Windows, an installed
application also installs a 'rule' that associates the application with
filesystem objects that exhibit certain attributes, e.g. that they end in
'.foo.' 

> to replace them with?  Only thing I particularly care about here is that
> a file can appear as more than one type -- a script is both a program
> and a text file, for example.  Of course, you'd only be able to fibrate
> by one type (right?), so there'd have to be a "primary" file type.
> 
> This is helpful because it's the right thing to do, but also because it
> may have implications right now.  For example, Gedit and AbiWord should
> both show me uncompressed AbiWord docs in their "open" dialogs, by
> default.  Using file extensions, that isn't possible unless you hack
> Gedit to "know" every possible text file extension, or check the magic
> on each file in the directory.
> 
> The "propor" way to implement it would be to ask the filesystem
> something like "List all the text files in this directory".  And not,
> btw, "List all the *.txt files in this directory".
> 
> 

I believe the proper thing to do is to leave this service to the operating
system (prob. the VFS) and to application programmers. The filesystem can be
very good/fast at finding objects that end in some 'extension,' but any more
understanding about objects should be handled 'above' the (a particular)
filesystem.



