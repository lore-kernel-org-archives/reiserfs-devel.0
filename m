From: David Greaves <david@dgreaves.com>
Subject: Re: viewprinting: what format should views be stored in?
Date: Fri, 20 Aug 2004 15:07:34 +0100
Message-ID: <412605A6.30505@dgreaves.com>
References: <20040819074027.8429715D94@mail03.powweb.com> <41248D43.3040905@dgreaves.com> <4124D09A.1060208@comcast.net> <4124E408.3090405@dgreaves.com> <41259FBF.5040308@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20433-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41259FBF.5040308@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: George Beshers <gbeshers@comcast.net>, reiserfs-list@namesys.com, david@dabbs.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:

| David Greaves wrote:
|
|>
|> David
|> PS can I offer 'mask specification' (shortened to maskspec above)
|> instead of 'presentation mask' for the glossary.
|>
|>
| Glossary? of?

terms.
There have been occasional mails that try and clarify what we're
talking about.
I think they're helpful.

|
| Instead of mask specification, just say mask.

One way:
I write a mask each line of which is a mask and then the mask compiler
turns it into a mask that the mask interpreter uses to mask the
permissions?
Q: What's the role of the mask?

Another way:
I write a mask specification each line of which is a masklet and then
the mask compiler turns it  into a maskfs that the mask interpreter
uses to modify the permissions?
Q: What's the role of the mask specification?

Confusion is bad.

Nb in conversation then of course we say 'first, write a mask' - lets
just agree the terminology for clarifying the followon questions.

David
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBJgWl8LvjTle4P1gRAr6jAJ9/0QgHDHWn54yRUMhdqpXp2xL19ACfTvey
NRGxwKOw87X0IQs5uLiVqrY=
=izE8
-----END PGP SIGNATURE-----

