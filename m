From: Jeff Mahoney <jeffm@novell.com>
Subject: Re: Participation in developement of Reiser4
Date: Wed, 03 Nov 2004 12:10:30 -0500
Message-ID: <41891106.3000600@novell.com>
References: <200411022342.02126.sikkh@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22262-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200411022342.02126.sikkh@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Piotr Neuman <sikkh@wp.pl>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Piotr Neuman wrote:
| Hello
|
| I'm looking for some intresting projects to devote my spare time to.
Reiser v4
| is a very promising one, so I would like to ask wheter there are some
tasks
| that a relative newbie in kernel programming like me could do.
Something like
| kernel-janitor like tasks maybe (code cleanup) or maybe reiser4 tools.
|
| I'm a bit familiar with linux VFS if that can help (I did some work on
User
| Mode Linux filesystem called humfs).
|
| I hope I could help...
|
| Regards
|
| Piotr Neuman
|
| ps. I know I could just start making patches to reiser4 and send them
right to
| namesys.com but I don't know where to start/what to do ;-)
|

Well, this is the same advice that applies to everybody looking to
participate in any project. Find something that bothers you, and try to
fix it. The list will be happy to take a look at your patches and give
you pointers on how to improve them. The best way to learn is through
experience.

All I can really give you as far as more specific advice is things I'd
like to see done with reiser4. The most obvious one, and one that should
be a fairly easy place to start, is to add support for the existing
xattr API to manipulate attributes that reiser4 currently provides under
the ..metas "meta-directory." The ..metas directory is quite
contraversial, and I'd hate to see reiser4 fall by the wayside because
it doesn't support a standard API.

If this feature is already implemented, I apologize, I haven't been
following reiser4 development too closely.

As a note to Hans, who I expect will object strenuously to this email,
the issue of the elegance of the files-as-directories approach that
reiser4 users is a debate that will not likely be concluded any time
soon. I think the best thing for reiser4 to do is to cater to its users.
Many users will disable the files-as-directories support because it does
cause conflicts with existing apps. Whether that makes those apps
"buggy" or not is irrelevant: Users will just use another filesystem
rather than bug their favorite software author to adjust to a situation
that no other filesystem presents. Users that want to use the ..metas
approach are free to do so. To quote something that borders on trite
these days, "Since when does Linux eliminate choice?"

- -Jeff


- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBiRAZLPWxlyuTD7IRAiWiAJ9aQczwp0IafGefLwloral7Q8E2bACfSyjj
ckxTYV0AFS1cQS/z1WsGVaI=
=Se78
-----END PGP SIGNATURE-----
