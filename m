From: Jeff Mahoney <jeffm@novell.com>
Subject: Re: Participation in developement of Reiser4
Date: Wed, 03 Nov 2004 14:58:53 -0500
Message-ID: <4189387D.4000702@novell.com>
References: <200411022342.02126.sikkh@wp.pl> <41891106.3000600@novell.com> <4189133C.9050203@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22265-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4189133C.9050203@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Piotr Neuman <sikkh@wp.pl>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
| Jeff Mahoney wrote:
|
|
|>
|> All I can really give you as far as more specific advice is things I'd
|> like to see done with reiser4. The most obvious one, and one that should
|> be a fairly easy place to start, is to add support for the existing
|> xattr API to manipulate attributes that reiser4 currently provides under
|> the ..metas "meta-directory." The ..metas directory is quite
|> contraversial, and I'd hate to see reiser4 fall by the wayside because
|> it doesn't support a standard API.
|
|
| No, please, don't work on this.
|
| Work on copy on write links, and implement them as a plugin.  Sorry for
| my not responding earlier, I was somehow blanking on needed features
| even though we have a ton of them.
|
| Copy on write links are probably feasible for a beginner.
|
| Alternatively, look for fixmes scattered throughout the code, and fix
| one of them.
|
| Or, find code that needs better commenting and comment it.
|
|>
|> If this feature is already implemented, I apologize, I haven't been
|> following reiser4 development too closely.
|>
|> As a note to Hans, who I expect will object strenuously to this email,
|> the issue of the elegance of the files-as-directories approach that
|> reiser4 users is a debate that will not likely be concluded any time
|> soon. I think the best thing for reiser4 to do is to cater to its users.
|
|
| If I don't add elegance, why bother to write ReiserFS?  There are better
| ways to make money.

Hans, you're selling yourself short if you think that the only reason
people would use reiser4 is for the files-as-directories unified
namespace implementation. There is so much focus on benchmarks, other
features, etc that many people do want to use reiser4, but don't want to
adopt the semantics it offers. Tools already exist to do much of what
..metas implements, and people want to use them. There is no denying
that the ..metas interface has the potential to be much more expressive
and powerful than the xattr interface. Right now, though, users don't
want something more expressive and powerful - they want something that
works with what they have.

The whole concept of UNIX mountpoints and the single tree hierarchy is
that you shouldn't ever need to care what kind of filesystem you're on
when using it. Sure, there are small things here and there that change,
but mostly it's of a "this feature is optional, and may be
unimplemented" variety. Offering the standard xattr API *in addition* to
the ..metas interface allows all that existing code to work without any
additional effort.

Not having this support _is losing you users_. There are other parts of
the kernel that depend on the xattr interface working, such as SELinux.
Implementing standard interfaces is the difference between a research
filesystem and a deployable filesystem.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBiTh9LPWxlyuTD7IRAmkqAKCYVOnLyNuegEWzO/ZCtoKc0BDxuACgpfUr
TvO7rdxS9EFrL0E6HSGevhM=
=X+BW
-----END PGP SIGNATURE-----
