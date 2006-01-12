From: David Masover <ninja@slaphack.com>
Subject: Re: Authoring a versioning plugin
Date: Thu, 12 Jan 2006 15:48:36 -0600
Message-ID: <43C6CEB4.8000209@slaphack.com>
References: <200601111759.14638.fred@lab.matcom.uh.cu>	 <43C5D694.9050402@namesys.com> <43C5FAE0.5090602@namesys.com>	 <1137083591.14934.5.camel@localhost> <f18a8d980601121033x12e0b148g65ecc78f306b4446@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27687-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <f18a8d980601121033x12e0b148g65ecc78f306b4446@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bedros Hanounik <2bedros@gmail.com>
Cc: Jonathan Briggs <jbriggs@esoft.com>, Hans Reiser <reiser@namesys.com>, Yoanis Gil Delgado <fred@lab.matcom.uh.cu>, reiserfs-List@namesys.com

Bedros Hanounik wrote:
> I think versioning plugin is a great idea and I bet there're many people 
> like me waiting for such a plugin. However, I have few questions;
> 
> what happens when I delete a file? should I loose all history of the 
> file with such action?

Depends.  Delete has always been a modification of the directory, not 
the file.  So, if you were versioning an entire directory tree 
(recursively, of course), then deleting a single file within that tree 
would be a modification to its parent directory.  Until the 
changelog/history/old versions of the parent directory all disappear, 
there will be a link to the file, meaning the file still behaves exactly 
as it always did, it's just that instead of only being linked to in

foo/bar

it's now in

foo/.../version/1234/bar

[...]

> if you store all the history in  a sub direcotry let's say .rev and make 
> it generic (and hence visible) to everyone, the above problems will go 
> away.

Only now you have some new problems:

What if someone wants to make a .rev for something else?  '...' was 
carefully selected, and is still debated.  Now you're suggesting each 
plugin be able to have its own file/directory in every normal directory?

NO.  Will not work.

What might work is creating a '.metadata-archive' directory, which has 
hardlinks to everything tar is allowed to backup from '...' -- that way, 
we only need to come up with one more unique name than we already have.

Technically, not even that -- we could hide a directory with any name we 
like inside '...', and let tar archive '...', but not, say, '.../notar', 
but that's a hassle for users.  Anyone have a better name for 
'.metadata-archive', though?

You also have another problem:  You've just broken 'rm -r' and 'mv' 
across partitions/devices.  Consider:  Am I allowed to remove 
'.metadata-archive'?  If yes, then what happens when I look for it 
again?  Is it magically still there?  And if no, how am I supposed to 
ever be able to rmdir a directory that's technically not empty?  Should 
that just magically work?

I suspect that we'd be fine if we just say that removing it should 
pretend to work (return an OK status), and rmdir should actually work, 
but it should always show up in the directory listing, because I can't 
think of why a program would step through the directory listing, 
unlinking each file, and then get another directory listing, to make 
sure they're all gone, before it tried 'rmdir'-ing the directory.  It 
makes no sense -- you try to 'rmdir', and you complain to the user if 
"directory not empty" because someone stuck a new file in the dir while 
you were trying to delete it.

> for example filename.ext deltas could be stored in  .rev/filename- 
> rev-date-time.delta with base rev in .rev/filename-rev-date-time.ext

I don't like your semantics.  I just don't.

It makes sense to use file extensions for fibration, because you can 
guess that '.o' files are similar to each other.  Same with '.c' files. 
  But fibration is completely transparent, and just affects performance, 
so it's ok to guess there.

When it comes to actually affecting semantics, file extensions have 
always been irrelevant except to programs that care, and those programs 
only care about their own extensions.

For instance, say I have

foo.tar.bz2

Obviously, this way looks bad:

foo.tar-rev-date-time.delta
foo.tar-rev-date-time.bz2

So do we do it this way?

foo-rev-date-time.delta
foo-rev-date-time.tar.bz2

No, because then what if you have this?

foo.01.12.2006.tar.bz2

Obviously, this is wrong:

foo-rev-date-time.delta
foo-rev-date-time.01.12.2006.tar.bz2

And this is just as wrong as it was before:

foo.01.12.2006.tar-rev-date-time.delta
foo.01.12.2006.tar-rev-date-time.bz2

And for that matter, what if I have these?

foo.tbz2
foo.zip

Both become foo.delta.

And just a minor thing, but you're also making the limit on filenames 
just that much more restrictive.

Instead, I suggest we do it this way:
foo/.../version/<rev>

with symlinks to some handy versions of
foo/.../version/<date>
foo/.../version/<time>

This should also work if foo is a directory.  So to actually publish a 
given revision, you do

tar -cjSf foo-1234.tar.bz2 foo/.../1234

Now, what about forking?  If we had good copy-on-write support, we could 
just do something like

cp --cow foo/.../1234 foo-fork

Obviously, this would use the same underlying mechanism of copy-on-write 
that is used for the versioning system, so there's no need for the 
system itself to know about forks.

What about merges?  I don't know, but my knowledge of existing 
versioning systems is pretty limited...
