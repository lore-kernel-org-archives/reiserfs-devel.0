From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Interesting reading that I agree with;-) (the meaning of "..")
Date: Wed, 22 May 2002 15:12:10 EDT (-0400)
Message-ID: <62925063875-BeMail@CR593174-A>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10402-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Hans wrote:
> http://plan9.bell-labs.com/sys/doc/lexnames.html

Interesting reading.  I tackled the multiple parent directories
problem in my experimental RAM file system for BeOS by defining
"..", "...", "...." and so on for each possible parent directory.
The ".." one is special in that it has a guaranteed direct path
up the name space graph to the root.  When you delete a directory
that is ".." for some child items, a bit of graph traversal goes
on and it promotes one of the other parent directories to be the
new "..".  It also uses the magic ".." to generate a "true path name"
for use in dynamic fake symbolic links, which are used to keep
software that doesn't understand hard links / aliases happy.

It works (even when files are deleted or renamed), but isn't as
programmer friendly (obvious to understand) as Rob Pike's method.

- Alex


