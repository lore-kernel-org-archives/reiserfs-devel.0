From: David Masover <ninja@slaphack.com>
Subject: Re: Fibration questions
Date: Mon, 19 Jul 2004 16:34:14 -0500
Message-ID: <40FC3E56.2020603@slaphack.com>
References: <20040719072026.1959F15D1B@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19688-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040719072026.1959F15D1B@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: 'Hans Reiser' <reiser@namesys.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



David Dabbs wrote:
|>-----Original Message-----
|>From: David Masover [mailto:ninja@slaphack.com]
|>Sent: Sunday, July 18, 2004 11:24 PM
|>To: Hans Reiser
|>Cc: David Dabbs; reiserfs-list@namesys.com
|>
|>Hans Reiser wrote:
|>[...]
|>| If FS naming was better designed, filenames would not have extensions.
|>| I prefer to first better design naming, and then not need to optimize
|>| the API for extensions.
|>
|>Still, if we're going to fibrate by file type and want to find a file by
|>file type, there needs to be -- surprise! -- a standard way to determine
|>file type.
|>
|
|
| There be dragons. Despite the fact that I advocated applying fibration
data
| to filesystem queries, the two (fibrating by file type [extension] and
| 'finding a file by file type') are quite different. The former is simply a
| way to bunch/glom/group particular filesystem objects together in the
tree.
| The latter requires metadata beyond that provided by the filesystem
objects
| themselves.

Why beyond?  Ask each fs object (without knowing its name), "What is
your primary type?"  Put like-typed objects together.  Simple.

How do the file objects know what type they are?  After the first atom
is committed, they default to a type based on their magic.  That is, a
file that begins with "#!/usr/bin/perl" is a Perl, a Text file, a
Script, and a Program.  Primarily Perl, so it gets fibrated that way.

This can be optimized -- a file that begins with "#!" is a script, we
know this because the OS does.  If the file doesn't begin with "#!", we
don't need to look at the rest of the line.  And for things which aren't
perl, that's already a simpler check than "does the file end in '.pl'?"

On top of that, we only have to assign the file type once -- at
creation.  For the rest of the file's lifetime, until someone decides to
change its type, the type is a bit of static metadata, as optimized
(fast/small) as file permissions, much faster and smaller than file
extensions.

| This is the kind of thing for which the W3C's SemanticWeb activity might
| advocate OWL/RDF. Possible means aside, the following are among the
| questions the community would need to address:
|
| 1. What is the range of 'file types'?

How many "file types" are there on Windows?  That might be a good place
to start.  They'd just be implemented in a more flexible way.

| 2. The range of known 'file type aliases' (extensions)?

No extensions.  Just file types.  You could name an mp3 file ".doc" and
not fool the system.  The tooltip in GNOME would say "foo.doc -- mpeg
music file" or something similar.

I'm thinking something like MIME, more or less.

| 3. How should applications interpret and buy into this consensus?

The app defines what file types it can deal with, and then only shows
the user files of that type.  It finds the type by looking at ..metas/type.

| 4. At what level is this ontology managed? The OS, VFS, particular
| filesystems?

Reiser4 plugin, at first.  VFS (as in GNOME VFS) would probably be the
next layer up.

| 5. What is a portable metadata storage format that is easily
maintained (and
| shared) by humans and parsed/employed by applications?

Reiser4 metadata.  Possibly a default is set using file magic.  Users
who don't know how to directly access such metadata probably don't
understand extensions anyway -- note that Windows "hides file extensions
by default".  You know it's a word document because the icon is of a
word document and when you go to Word's open dialog, it shows up.
That's the level at which the user understands "file types".

Portable?  I'm hoping that other filesystems start supporting metadata
in a similar way.  Otherwise, this just becomes yet another enhancement
for reiser4-based systems.

In fact, if this is supported in some library (say, at the GNOME VFS
level), it is entirely portable, because it can fall back on extensions
if the metadata isn't supported, and we can fall back on asking for
*.foo if the fs doesn't support a query for "files of type foo".

| Extensions are a convention humans share that are tenuously/inconsistently
| 'understood' by the computers humans use. Under Windows, an installed
| application also installs a 'rule' that associates the application with
| filesystem objects that exhibit certain attributes, e.g. that they end in
| '.foo.'

Under Windows, when I open notepad and go to File->Open, it shows me, by
default, files that end in txt.  When on Windows, I'd use notepad for a
lot more -- editing html files, batch files, and so on.  So I basically
have to use the dropdown menu to select "all files", which means I might
accidently open an mp3 file in Notepad -- I'll certainly have to sort
through mp3 files to get to the .m3u file I wanted.

The main drawback of extensions is that you can't have a file with two
extensions.  Witness things like .tar.bz2 and .tbz2.  You now have an
exception for files that end in .bz2 -- check if the preceding
characters are .tar, and if so, treat it as a .tbz2.  Or, if a file ends
in .tbz2, and we're looking for things we can extract with bzcat (maybe
using tab-completion in Bash), we have to support .tbz2, not to mention
.bzabw -- and easily a dozen more really obscure ones that we don't know
about.

| I believe the proper thing to do is to leave this service to the operating
| system (prob. the VFS) and to application programmers. The filesystem
can be

You don't think a file type is metadata?  And I bet it'd be nice to be
good/fast at finding objects which have a certain property.  Say, a
permission set.  rwx=some_value -- type=some_value -- what's the diff?


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQPw+VngHNmZLgCUhAQJAcA//TH5DgiWAkdt1I2xrBQGiydynoeknVnD5
08ULzcgy+JkXqxbcupBwUX3yqhvJu0i7jx/UjMhJdFFtmeSJqqoGXB5UWGaFg7s3
dix3klCLKiuEIyNrWQnJjjnlivO7uq0oV62cFe5NE+NwFQTgusP+k6VMf4DkFI+d
/8ddW6YBtD8UIMHi980/n/9BcVeNd7NJrpC35QYJqASDOIYkj2TeoMk3tz9z6J8g
0V4jmpV8212XrWXy1acEwQOIbKsa3xdlhS0LkQ5As41qEpisV3M//QQSwY8zSucH
57YPrfLWEA1oO5jMvsLQCbTORjksGoBjIlB5idED7d75xB24obovuBilp+UJmQwH
zBNyJLdcjxpmkeqWW3aHadjQNNPGG/+uWVonOOmLfU2RQ1T+OoFWjqb5fj25eDwD
JBdBdyrBn0KPOKLKWCElD6jM9z+6xvSgJ0nP42jrI1OdGM3XVAco76h4KQ5mrv9Y
1ssk4isGMfJaen9MIrr43k8T4SY8FGul7WklpRue+UhNt95PwFfD1PGrBGzU5JNM
U8xprMt8td7jswRk2JKuYBZru1ihHtWD/eBfC4sAxOd/7JFQ7ctubk/BqPozW3z2
UnDc5XZeDSJfsZUKmCwN0qpsK6M1bPzibMHxIq2xP1ao0ldZmdUezzMQb80x42is
G5j11VswkJk=
=9YdA
-----END PGP SIGNATURE-----
