From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: ".meta." as a Name Prefix
Date: Wed, 21 Apr 2004 08:03:08 -0400 EDT
Message-ID: <84800866490-BeMail@cr593174-a>
References: <4085C7B2.4010104@slaphack.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18120-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4085C7B2.4010104@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

David Masover wrote on Tue, 20 Apr 2004 20:00:34 -0500:
> That's what we were doing before.  I didn't like it -- consider the use
> on files:
> 
> touch foo
> chmod +x foo
> cd foo/
> ls
> 
> You either get 'foo/' or an error message.  You do not get a list of all
> the pseudo files available.  I'm sorry, but 'cat ..pseudo' just isn't a
> viable substitute for ls.

Why wouldn't that work?  I must have missed something.  I can see that
the fildirute (combined file / directory / attribute) nature of the new
file system objects making the old rwx flags obsolete (does the "x" flag
make it an executable file or does it mean permission to change directory
to the child objects of the file).  But if you change directory to a thing,
it gets appended to your path and the OS should be able to figure out that
you want to look at its child objects (which I'd prefer to directly
include things named .meta.blah, while others want a .metas subdirectory
as a child object).


> | I'm probably repeating myself, but the trouble is that the .meta
> | directory isn't a full directory - you can't add attributes to it.
> What kind of attributes would you want to add?

GUI directory display attributes, like window position and size,
background picture, when displaying that directory.

>  And btw, check out what is currently 'metas/metas'.

I couldn't find that.  Instead I noticed "/filename/metadata/stat/owner"
in http://www.namesys.com/v4/v4.html which seems a bit odd.  I'd expect
something like "/filename/metadata/stat/metadata/owner" if you were using
a metadata magic directory.  Or in my .meta. name prefix scheme, it
would be "/filename/.meta.stat/.meta.owner"

> I don't know if that's actually functional or just read-only, but it
> works.  And I also see no reason why (in raw uneducated theory) a
> plugin couldn't be implemented to make it into a full directory for
> certain files (and thus losing no functionality for other files).

Sounds like extra work and complexity, just to keep the idea of having
a magic subdirectory child object rather than just putting the meta
attributes directly as child objects.

> It doesn't have to.  Look at how the "pure object-oriented" languages
> work.  Many of them make everything some subclass of "object" -- even
> classes themselves.  A class is an object of type class.  I'm not sure
> how this is implemented in code, but in concept it works fine.

In that kind of class system every object is an object, and you can
do all object type operations to it (such as finding it's class name).
The magic .meta directory breaks that very concept by not implementing
full file system object functionality.  It's not a first class object,
it's an awkward special case.

- Alex

