From: David Masover <ninja@slaphack.com>
Subject: Re: ReConfigurable Directory Structure & Agrregation of files according
 to semantic.
Date: Thu, 18 Mar 2004 17:04:30 -0600
Message-ID: <405A2AFE.8060107@slaphack.com>
References: <94121091767-BeMail@cr593174-a> <40586501.1070005@slaphack.com> <87u10njss0.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17300-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87u10njss0.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hubert Chan wrote:
|>>>>>"David" == David Masover <ninja@slaphack.com> writes:
|
|
| David> Alexander G. M. Smith wrote:
| Alexander> ...  I (and others) think it would be better for this to be
| Alexander> done at the file system level.  That way you can leverage all
| Alexander> sorts of other utilities and
|
| David> What about a reiser4 plugin?
|
| I would think that would count as being in the filesystem level.

Yet it doesn't involve writing a *new* filesystem, which is I think what
was being suggested?  Alexander?

| David> What about a plugin that is mostly in userspace?
|
| That just reminded me of lufs[1], which allows you to create a userspace
| daemon that communicates with the lufs module to provide access to a

A userspace daemon is what I was thinking, except that lufs is, again,
implementing an entire filesystem rather than piggybacking on one that
already exists.  Or is this new filesystem really so easy?  If so, I
want my stable reiser4!

No offense to anyone working on reiser4.  It looks impressive so far,
and I haven't even taken a peek at the code.  I'm impatient, but I don't
want to seem ungrateful.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQFoq/ngHNmZLgCUhAQLiNg//QOOTYVCMGzvWp7TPpJUMBUw3ty8rN8cT
XzCojUMKnece5O3NT75UHjkiRRKWiZxFxSkvwa7idfzg0fOajdCxdYqxnN3k+c6q
nZyp2cUeLPG/EU4oSIhEjEZYhj5IUENUzALhPftAOveUMc4vN0XvmpAESUZ1ApBp
efKH61wiWn7eq3NdHXMBbWroC9Rp2W1H36Gqe4lBwZFPPSo+XXHmjT2kRY5sjw9x
RA2UcoFiNbsfLiLviFAsfAiHSkCUop06Tub0js3sMAvWNxHPE6Fu6/DOUxmZsKom
tz10eAL+I0oRBy0+iVzwpEZ6aB2ic17cPS9KW9RBwzYWfVavJKrJ+BqZRgL0sARl
dW4A9XkKiyngAufrUli6WDJaihaWZtpP1APpBmM+eDdVQzihuVlL9ZCPaybtuhDn
O8dgwXKSdE2GCKG0lGEweKbow6mXDe8TTypvXzpSDVU4cyvBdUzhisb2HyHlUigx
rH1kJlTQvEmQIWnxkqQQxe5oX98dNnHxJLDtRyoiIN9ATGE0tEWbHZzvO8rGsOA3
wxtRwIr4xeXUKF8I0RN+3JI9rNqH2UNTzNTTIhOleVqO9O50IDJSR++XT0ZJ65Lu
WDctewQ16xm84IobMKqV3c+GVdRIpQjIdaChjnDYaovf+wstcQnzT/y9D58MOOma
+U37zogaPIs=
=k/hJ
-----END PGP SIGNATURE-----
