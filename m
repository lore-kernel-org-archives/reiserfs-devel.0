From: David Masover <ninja@slaphack.com>
Subject: Re: ReConfigurable Directory Structure & Agrregation of files according
 to semantic.
Date: Wed, 17 Mar 2004 08:47:29 -0600
Message-ID: <40586501.1070005@slaphack.com>
References: <94121091767-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17273-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <94121091767-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alexander G. M. Smith wrote:
...
| I (and others) think it would be better for this to be done at the file
| system level.  That way you can leverage all sorts of other utilities and


What about a reiser4 plugin?
What about a plugin that is mostly in userspace?
Even a generic reiser4 kernel plugin that allows userspace plugins to be
written?

I suggest v4 because you can start right now.  Maybe v6 would be better,
but at this rate, you'll be lucky to get a stable v4 by the time you're
done your project.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQFhlAXgHNmZLgCUhAQJFQQ//VKa0yoqu+WXEKynR/KsNZv+pGNDrKvUh
6uVewiftyE7wJIyhmqwOSwsfcNb9LjaV5TPt7h1bzw7g+dZyktIZIOM7564Zeb/V
ETbiE+S43lnprDxfGMUcrhp+n26mej48Onz5MOJI+Nb7JtJ6HkWs14lXfjNuyxg3
1arbX8PkH/igXknzMYvl4ghp6nrpyVf33kDSHjvq9jSA64Pott17Z1b1p0uUzUG/
WSXaqsosXATAR/mgfPP780693y9oxjIovWs0XBvOXhjDmpNWt3H829yFwfH+h4EO
23gj9kd3xmdXJiVSKpFwvZSVxm2wMDcMON92t0klTSthPB3E8t/f6lI/ndDhC1a0
xySmAwS52Mi1vhE+9Dc3w9vX90de/vUzHQoXhbVXDHtytP96VhumF9kco5QfqPPL
jLwa7k2ZcQS8maP4pUaYgtAdI8dOqNNyBxeEpTzzJ0WWBM1xa9OaeT+FOW1yQofj
2bO+ax+Mx+mXCw6RCWU2SvEGwjxLV1Rb+zcY+dx8E4cULw8K+PglOcaPFQKlW8CR
w7vvY8aXp/cTwQjLiNQPzzerudQtB4hLvMosmofisRr+95oiX6hLfdchQAWQung4
Ol9d9SJFZXnyxuzIUgeB1ELwF85iX0pAEcIyLqP4u3uwLIhEKCqBjvz+hpL/4MEo
Pvkl8kLPsQE=
=1erf
-----END PGP SIGNATURE-----
