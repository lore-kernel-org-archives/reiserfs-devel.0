From: Russell Coker <bofh@coker.com.au>
Subject: Re: [OT] memory issue with GNU find
Date: Sat, 26 Oct 2002 00:28:24 +0200
Message-ID: <200210260028.24951.bofh@coker.com.au>
References: <20021024174330.34f2d72e.philippe.gramoulle@mmania.com> <200210251900.33613.russell@coker.com.au> <20021025202302.633fcce4.philippe.gramoulle@mmania.com>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11788-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021025202302.633fcce4.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?iso-8859-1?q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs <reiserfs-list@namesys.com>

On Fri, 25 Oct 2002 20:23, Philippe Gramoull=E9 wrote:
>   |  One issue I noticed with find is that the amount of memory required =
is
>   |   propertional to the length of the maximum path name.  If you have a
>   | very deep tree of subdirectories then the amount of memory taken
>   | becomes significant.
>
> Are you aware of a find variant that would be memory limited ? :

No.

> If memory usage goes up , then at a certain point, commit everything in R=
AM
> to a file , free up memory, and continue like this again and again.

That could be done, then there's always the issue of disk space.  For your =

example of a NAS device it might not be such an issue.  For a situation of =
a=20
small machine and a DOS attack then putting a long chain of directories and=
 a=20
large file at the end could make things really difficult for recovery!

Also this still wouldn't make the following work:
find /tmp/junk -exec rm {} \;

>   |   It's easy to create a set of nested directories that crash find (it=
's
>   | a good local DOS attack).
>   |
>   |   while /bin/true ; do
>   |     mkdir foo
>   |     cd foo
>   |   done
>
> Users don't have shell access but they could do it over FTP indeed. We
> already found cases of such very nested directory.

When I was running my SE Linux play machine (public root password and a=20
challenge to the world to hack it) someone did that to it.  Since then I've=
=20
been meaning to write a program to remove a directory tree of arbitary dept=
h=20
in O(N) time where N is the depth.

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

