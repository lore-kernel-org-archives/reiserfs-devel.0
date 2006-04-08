From: Danny Milosavljevic <danny.milo@gmx.net>
Subject: Re: script binding for reiserfs?
Date: Sat, 08 Apr 2006 15:30:17 +0200
Message-ID: <1144503017.6772.80.camel@localhost.localdomain>
References: <9bc0d5d20604060123v18c5518cmb072472ec56d8fe0@mail.gmail.com>
	 <3395df770604071759y26ca8903s3c77efee45ba33ec@mail.gmail.com>
	 <9bc0d5d20604072116j250b3d84m9f77c750d1f1d460@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28461-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <9bc0d5d20604072116j250b3d84m9f77c750d1f1d460@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dongxu Ma <dongxu.ma@gmail.com>
Cc: Peter van Hardenberg <pvh@pvh.ca>, reiserfs-list@namesys.com

Hi,

Am Samstag, den 08.04.2006, 12:16 +0800 schrieb Dongxu Ma:
> 
> 
> On 4/8/06, Peter van Hardenberg <pvh@pvh.ca> wrote:
>         Dongxu,
>         
>         Reaching into the filesystem itself for a project like this is
>         not a very good idea. A wiki is a set of files -- let the
>         filesystem do the hard work for you and use the standard API
>         that is already in existence -- the VFS. You'll get all the
>         benefits of the Reiser filesystem without having to break
>         compatibility with other systems.
> 
> my own thought is that one can operate the filesystem, or at least
> query it via programming interface, you know, 

well, use the usual interface:

stat
creat
lockf
open
write
read
close
truncate
unlink
opendir
readdir
closedir
rename
sendfile
utime
readlink

I don't get what good it would do to use some extra interface with
different functions, given that all possible basic actions are already
covered... (although transactions would be nice to have ;))

> introduce shell is really a bad idea. 

What do you mean by that?


> 
>         I think a DBI/DBD interface to a Reiser-friendly file format
>         is a really neat idea. You could create table rows as
>         individual files within a directory and do foreign keys with
>         links! 

You mean like in a relational database? That's very unflexible and a bad
idea on a filesystem. There is a reason relational databases are only
used properly in well-defined and limited-size big-design-up-front
projects.

And good relational databases are not even stored in files, but directly
onto the raw partition.

>         I wonder what on-disk form would leverage Reiser4's dancing
>         trees and intelligent allocation the most efficiently?
> 
> Yeah, I can store  each  field  into a file, and creat view and table
> structure from directory and links. With the help of reiserfs, I
> assume this could be possible to try.

It really depends on what you want to do with it, but of course you can
store each field into a file of it's own. The question is if you need
that kind of fine granularity...
> 
cheers,
  Danny
> 
>         I must say though, there is no binding to the Reiser4 API, and
>         the Namesys team is very busy right now working towards
>         getting R4 included in the mainline kernel. Hopefully once
>         they have achieved this, the more exciting development can
>         continue. 
> 
> 2.6.16 is a big step;-P
> 
> 
>         As for your second question, my experience is strictly with
>         R4, so someone else will have to comment on that issue.
> 
> Anyway, great help for me, thanks.
> 
> 
>         All the best,
>         Peter van Hardenberg
>         
>         
>         On 4/6/06,  Dongxu Ma <dongxu.ma@gmail.com> wrote:
>                 Hi all,
>                 
>                 As reiserfs more and more popular, is there any
>                 binding package for use in script languages? I did a
>                 search on Google and nothing found.
>                 Curently I am thinking about writing a binding for
>                 Perl, which can offer: 
>                 1) script-level operation against reiserfs
>                 2) DBI && DBD for reiserfs binding to treat the fs as
>                 a database. My aim is constructing a mid-and-small
>                 wiki directly on reiserfs without employing any real
>                 database 
>                 
>                 However, after some seeking on source. I got several
>                 issues:
>                 1) is there any so-called official userspace api
>                 exported? 
>                 On gentoo there is a package named progsreiserfs
>                 introducing an api set under /usr/include/reiserfs,
>                 but I am not very sure if it is stable and the project
>                 is still alive. 
>                 
>                 2) regarding reiser3, where could I start to port?
>                 since exporting something in kernelspace is quite
>                 risky. 
>                 
>                 Any advice and hint?
>                 
>                 
>                 -- 
>                 Cheers, Dongxu
>                 __END__
>                 dongxu.wordpress.com
>                 search.cpan.org/~dongxu
>         
>         
>         
>         
>         -- 
>         Peter van Hardenberg
>         Victoria, BC, Canada
>         "The wise man proportions his belief to the evidence." --
>         David Hume
> 
> 
> 
> -- 
> Cheers, Dongxu
> __END__
> dongxu.wordpress.com
> search.cpan.org/~dongxu

