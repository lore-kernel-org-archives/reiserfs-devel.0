From: "David Dabbs" <david@dabbs.net>
Subject: RE: Fibration questions
Date: Mon, 19 Jul 2004 17:32:53 -0500
Message-ID: <20040719223512.D069C15E26@mail03.powweb.com>
References: <40FC3E56.2020603@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19691-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40FC3E56.2020603@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'David Masover' <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>


> 
> David Dabbs wrote:
> |>-----Original Message-----
> |>From: David Masover [mailto:ninja@slaphack.com]
> |>Sent: Sunday, July 18, 2004 11:24 PM
> |>To: Hans Reiser
> |>Cc: David Dabbs; reiserfs-list@namesys.com
> |>
> |>Hans Reiser wrote:
> |>[...]
> |>| If FS naming was better designed, filenames would not have extensions.
> |>| I prefer to first better design naming, and then not need to optimize
> |>| the API for extensions.
> |>
> |>Still, if we're going to fibrate by file type and want to find a file by
> |>file type, there needs to be -- surprise! -- a standard way to determine
> |>file type.
> |>
> |
> |
> | There be dragons. Despite the fact that I advocated applying fibration
> data
> | to filesystem queries, the two (fibrating by file type [extension] and
> | 'finding a file by file type') are quite different. The former is simply
> a
> | way to bunch/glom/group particular filesystem objects together in the
> tree.
> | The latter requires metadata beyond that provided by the filesystem
> objects
> | themselves.
> 
> Why beyond?  Ask each fs object (without knowing its name), "What is
> your primary type?"  Put like-typed objects together.  Simple.
> 
> How do the file objects know what type they are?  After the first atom
> is committed, they default to a type based on their magic.  That is, a
> file that begins with "#!/usr/bin/perl" is a Perl, a Text file, a
> Script, and a Program.  Primarily Perl, so it gets fibrated that way.
> 
[David Dabbs] 
The files don't really know their type. The filesystem/OS is deducing this,
yes?

> This can be optimized -- a file that begins with "#!" is a script, we
> know this because the OS does.  If the file doesn't begin with "#!", we
> don't need to look at the rest of the line.  And for things which aren't
> perl, that's already a simpler check than "does the file end in '.pl'?"
> 
> On top of that, we only have to assign the file type once -- at
> creation.  For the rest of the file's lifetime, until someone decides to
> change its type, the type is a bit of static metadata, as optimized
> (fast/small) as file permissions, much faster and smaller than file
> extensions.
> 
[David Dabbs] 
True, but this would need to be recomputed when some process changes the
file contents that contributed to the initial type signature.


> | This is the kind of thing for which the W3C's SemanticWeb activity might
> | advocate OWL/RDF. Possible means aside, the following are among the
> | questions the community would need to address:
> |
> | 1. What is the range of 'file types'?
> 
> How many "file types" are there on Windows?  That might be a good place
> to start.  They'd just be implemented in a more flexible way.
> 
[David Dabbs] 
...and Unix, etc. Anyway, when you get down to it, and leaving out
encodings, there are really only two essential file types: text and binary.
From there, you move into 'abstract' types based upon these. Using text as
an example, you might have an abstract type such as 'XML,' which would be
any text/* or application/* (using MIME) that is known to be based on an XML
format. After that, you get to application-specific types.

> | 2. The range of known 'file type aliases' (extensions)?
> 
> No extensions.  Just file types.  You could name an mp3 file ".doc" and
> not fool the system.  The tooltip in GNOME would say "foo.doc -- mpeg
> music file" or something similar.
> 
> I'm thinking something like MIME, more or less.
> 
> | 3. How should applications interpret and buy into this consensus?
> 
> The app defines what file types it can deal with, and then only shows
> the user files of that type.  It finds the type by looking at
> ..metas/type.
>
[David Dabbs] 
True. But in today's extension-based 'consensus,' there is no coordination
required between _anyone_ if some enterprising developer creates a great new
file format for, say, music files. Applications that decide to consume these
files simply add *.foo to the list of files presented to users. Using
metas/type, file type creators and application developers would need to
share and maintain consistent type IDs/signatures namespace. I'm not against
what you're proposing, just trying to consider possible issues in
implementing it.
 
> | 4. At what level is this ontology managed? The OS, VFS, particular
> | filesystems?
> 
> Reiser4 plugin, at first.  VFS (as in GNOME VFS) would probably be the
> next layer up.
> 
[David Dabbs] 
While I'm a reiser4 'true believer,' other VFS filesystems do and will
continue to exist. Might an application developer's job be complicated if
not every filesystem for which it presents a file list supports metas or
some means to query file objects' type?

> | 5. What is a portable metadata storage format that is easily
> maintained (and
> | shared) by humans and parsed/employed by applications?
> 
> Reiser4 metadata.  Possibly a default is set using file magic.  Users
> who don't know how to directly access such metadata probably don't
> understand extensions anyway -- note that Windows "hides file extensions
> by default".  You know it's a word document because the icon is of a
> word document and when you go to Word's open dialog, it shows up.
> That's the level at which the user understands "file types".
> 
> Portable?  I'm hoping that other filesystems start supporting metadata
> in a similar way.  Otherwise, this just becomes yet another enhancement
> for reiser4-based systems.
>
> In fact, if this is supported in some library (say, at the GNOME VFS
> level), it is entirely portable, because it can fall back on extensions
> if the metadata isn't supported, and we can fall back on asking for
> *.foo if the fs doesn't support a query for "files of type foo".
> 
> | Extensions are a convention humans share that are
> tenuously/inconsistently
> | 'understood' by the computers humans use. Under Windows, an installed
> | application also installs a 'rule' that associates the application with
> | filesystem objects that exhibit certain attributes, e.g. that they end
> in
> | '.foo.'
> 
> Under Windows, when I open notepad and go to File->Open, it shows me, by
> default, files that end in txt.  When on Windows, I'd use notepad for a
> lot more -- editing html files, batch files, and so on.  So I basically
> have to use the dropdown menu to select "all files", which means I might
> accidently open an mp3 file in Notepad -- I'll certainly have to sort
> through mp3 files to get to the .m3u file I wanted.
> 
> The main drawback of extensions is that you can't have a file with two
> extensions.  Witness things like .tar.bz2 and .tbz2.  You now have an
> exception for files that end in .bz2 -- check if the preceding
> characters are .tar, and if so, treat it as a .tbz2.  Or, if a file ends
> in .tbz2, and we're looking for things we can extract with bzcat (maybe
> using tab-completion in Bash), we have to support .tbz2, not to mention
> .bzabw -- and easily a dozen more really obscure ones that we don't know
> about.
> 
> | I believe the proper thing to do is to leave this service to the
> operating
> | system (prob. the VFS) and to application programmers. The filesystem
> can be
> 
> You don't think a file type is metadata?  And I bet it'd be nice to be
> good/fast at finding objects which have a certain property.  Say, a
> permission set.  rwx=some_value -- type=some_value -- what's the diff?
> 
> 

[David Dabbs] 
I do think a file type is metadata. And it would certainly be nice to search
by and (quickly) find a file by its type. But I think the APIs, etc. above
the filesystem(s) will first need to incorporate a notion of type. Until
applications/users start screaming for filesystem type attributes/queries,
the fs overhead and effort involved to figure it out doesn't really seem
worth it.

Going back to your original response to Hans's comment:

> |>Still, if we're going to fibrate by file type and want to find a file by
> |>file type, there needs to be -- surprise! -- a standard way to determine
> |>file type.

What I (we) originally started out exploring was using fibration plugin
flexibility to group files beyond one character of the file name, which is
unfortunately the best, shared means for file typing we have today. If
you're interested in a more robust type system and its use in fibration,
then 'Just try it!' That's what one of the reiser4 developers suggested to
me. 

One thing to note when coming up with a fibration-compatible type signature
is that r4's key structure only provides 7 bits with which to work. I'd bet
that there are many more than 7 bits worth of distinct file types out there.


Cheers,

David


