From: David Masover <ninja@slaphack.com>
Subject: Re: Atomic filesystem or not
Date: Thu, 15 Jul 2004 20:46:24 -0500
Message-ID: <40F73370.2090600@slaphack.com>
References: <200407151434.23082.marcel@hilzinger.hu> <200407151354.47063.ctpm@ist.utl.pt> <40F6DE4A.2070103@slaphack.com> <40F6E06B.1080505@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19649-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40F6E06B.1080505@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Claudio Martins <ctpm@ist.utl.pt>, reiserfs-list@namesys.com, Marcel Hilzinger <marcel@hilzinger.hu>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1




Hans Reiser wrote:
| David Masover wrote:
|
|>
|> doing atomic operations -- because a system call named "reiser4"
|
|
| Maybe I should call it sys_reiser and not sys_reiser4? ;-) What about
| the name is not portable? ;-)

Um.  Suppose someone wanted to duplicate it on (say) ext3?  Then the
name sys_reiser becomes confusing.

But I bet your system call does more than just define atoms, right?  Or
it's supposed to?

Is there an advantage to having one system call, instead of many?
(sys_begin_atom, sys_end_atom, sys_keyword_search, and so on...)

If so, you either want to try to turn it into a standard (so all new
filesystems will have a sys_reiser call) or create a library to abstract
the system call away (something like atom_new, atom_end, and so on).  In
fact, if I'm not mistaken, the "atomic" features could even be
implemented entirely as a userland library on top of the filesystem, at
least as long as the power is on ;)

I like your way better, but I also like the idea of making those
features so widespread (even poorly implemented) that programs start
adopting them.

No matter how good reiser4 is, I don't think everyone will start using
it overnight.  And its atomicity means very little to the average user
if it isn't ubiquitous.  I want cp, vim, thunderbird, and so on to all
support reiser4-style atoms.  If they can do that without a reformat for
existing users/developers, it's more likely to happen in such mainstream
apps, and it helps make reiser4 more useful.




-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQPczb3gHNmZLgCUhAQKkPw//R388NdP+dEpU/Tw4XG4Fpg8BF5gfv1aG
jpa0rExvG0qdfbDUKL6esiWoMIKqsELhxt7UdIl8a3ncs8Grd/XuE62cdUZsWwnn
xCjXtQ3OlHOI33hXwPokVQ4VJ7WvjgGxKFr9de3R7lT5Aw+Y7QomH92oCK3SNBHT
pDOwOqeDUyhnN6bRHIWvBsk+9zq5QiI9IQEaYjMDwCqKUg3vyyM0qLWlcQNVwE9A
cgJgb8xkWdXQbK5+ZZDKbVGM5yws7rt6pqTVdJgc2JhSMk1Rt4i+no2+pBqyAz1d
LvCzsRJ+7yGayzGQbqvNPYMM4ddlJz6FIBXPhbBFSiCFCAR38zb3LUgXhxAIZxIT
g6fkQjWPJhuQkqGGK2zmjKaUQynMfuby1pjw2mPdxuHwVGiSxXv4fdNBnlHkqqkF
bbWLBGOC/gu3RZzzImOKeAKAcmqjItZnIihsERUEf2EijV5Xtz15HeJ8wO+UEchi
GRIYzIkiAhE5PGeCZyCuEhbRPgSe5/78pkQIa1kO8USR1p0xMpEnFPNLpdZtpeah
/TOgTOztuxVZJhDlJnbydnJHD2wr/pj9jWVa7nUoCrDJFCK93LENL0QrsMvXWhp6
/T+xYRPAfee2/rTLV+0xKRSuJNO+jrjWnUAbMDSBGP+gm6Idfhh/RERD4SF0DNH1
l+n/dqCpCKE=
=YPGx
-----END PGP SIGNATURE-----
