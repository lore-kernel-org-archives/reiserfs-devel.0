From: David Masover <ninja@slaphack.com>
Subject: Re: Recursive modfied-timestamp?
Date: Fri, 31 Dec 2004 16:49:06 -0600
Message-ID: <41D5D762.8050603@slaphack.com>
References: <200412311047.14634.namesys.Sch@ttgen.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23011-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200412311047.14634.namesys.Sch@ttgen.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fred Schaettgen <namesys.Sch@ttgen.net>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Fred Schaettgen wrote:
| Hi,
|
| Does reiser4 support something like recursive
last-modified-timestamps? What I
| mean is an attribute which contains the latest modification date of all
| subdirectories and files below a given directory.

Actually, I'm not sure about that, but reiser4 supports plugins.  Maybe
there's a kind of plugin which does what you want.  Or maybe you haven't
defined "what you want" properly?  (see below)

[...]
| The purpose btw. is to find all modified files in a tree as fast as
possible.
| There are quite a lot of application which would benefit from it: desktop
| search engines, locate, build systems, tools which visualize contents
of a
| file system (like fsview in KDE), backup tools etc.

Seems like all of those are really problems of caching/metadata, or more
accurately, "things which Make would understand".  How about some more
general way of caching or cache invalidation?

Here's how I would do it.  I'd make a standard for object dependencies
within the filesystem, some way like "make".  This is the same thing I
ranted about as a way for accessing the contents of zipfiles as part of
the filesystem, without a performance hit.  (cat foo.zip/bar.txt)

For instance, your search engine needs an index, which depends on (is
built from) all the files in the filesystem except itself.  Thus you
might have an index for each folder (starting with /).  Each index
depends on the indices of its subdirectories.  When a search is run,
everything has to be rebuilt, in "make"-like fashion, but it gives you
one global place to add the "many things that could be done" to improve
performance for all systems that do this kind of thing -- search engins,
locate, build systems, fsview, and backup tools.

| I know that modifying an attibute recursively on every update of the
stat data
| would have a huge perfomance impact, but there are many things that
could be
| done to keep the extra load low for most of the time.

Which of these things benefits from being _in_ the filesystem?  Not that
I don't like your approach (see above), I just want you to think harder
about it.

| It seem very likely that this is an idea which was discussed over and
over
| again already, but I really didn't find much about it. As a KDE
developer,
| I'm not much involved in filesystems, so maybe I'm just looking for
the wrong
| keywords?

Maybe.  Seems like people use things like FAM nowdays.  But you're
right, there needs to be a better way.  For instance, your desktop
search engine should only rebuild even the stat data when a user enters
a query, but it should be able to do it quickly (without searching the
whole tree).

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQdXXYngHNmZLgCUhAQJN2hAAkSk54jLWiKm6fhSp5+/gdhkps6LjsIHA
FOuKX62YQdUm+3oNfM+dm+r0Unkx5+NDbojxDujcezy1DHxUJKb1syhU3lE+IngE
XLIy3+GhoJSX0d8VLP9CALMpYVqlJbmvp9Xj6bSpqErTOKxeY18hHqG7ZljVQQfT
jQjg99pE4uDRQXVfJzygCep6sbjcB6aFFrfwDOmFpv6Qfp5Dho/Ladqm/v85S45H
NEuTeYVwyzuvSah8BqMQJTmtdfY2GdwcKAfQ6g3i/ATC0GdDrou1R+2YDdBkTYvM
uGw+P8qKmQw+q/WgXJjx0WFnAZHqHVayXMqdwPr4bONXdUPb5IHR7PXjxjB2acui
WuzsQ9tLupuBOpr0tiDbJlm7+ozHudShydbPRRQTop0FbZKecLrw1aA+MLg+krRs
waX9Shs24JWh/3MXZlO4I3os4nFLnhgOiHuNRVv4iZt7aAurvWYmWR5iCELvzwil
Sv6pxpHfu8F0sNzhnoKloj75zYCvNjzsINSepckqlt3zuBmlExXKpLf1pRWkNaA2
Q6oewc9ppFwhErD9+Tn177HIDZMiWhwDopMxyWp8CcNvcY7M9p5uGVAyq6/vSQcc
yky8clLnpU9NTMNDrp7WIA0srpUP8DZYyFqzzQC+ePREO9n3LnB1RU3CNqGT8xoR
f8TIvSw26zU=
=v/lu
-----END PGP SIGNATURE-----
