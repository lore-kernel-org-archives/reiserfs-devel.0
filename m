From: "Chester R. Hosey" <chosey@nauticom.net>
Subject: Re: where are reiser4 sources
Date: Fri, 25 Feb 2005 03:20:33 -0500
Message-ID: <421EDFD1.4080403@nauticom.net>
References: <421A096F.5040603@gmx.de> <421A941B.5030708@slaphack.com> <421B4DC0.2000006@gmx.de> <421B7CD5.8080001@namesys.com> <421B7FFF.8050201@gmx.de> <421CBB13.4030306@namesys.com> <421CC811.7010002@gmx.de> <Pine.LNX.4.58.0502231935400.20004@kheldar.edsons.demon.nl> <421CEF99.2030901@gmx.de> <421DE8C8.9030107@edsons.demon.nl> <421EAAD9.5050907@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <421EAAD9.5050907@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

David Masover wrote:
| Rudy Zijlstra wrote:
| | Mark Junker wrote:
| |
| |> Rudy Zijlstra schrieb:
| |>
| |>>
| |> This sounds to me that I can only use GPL'd software with other GPL'd
| |> software but this cannot be true because you're allowed to use it with
| |> libraries with other licenses too as long as they don't contain
| |> conflicts ...
| |>
| | Take a look at the difference between GPL and LGPL. LGPL allows dynamic
| | linking against non GPL SW, GPL does not. Both allow usage of the
| | interfaces *without* linking, either dynamic or static. Neither allow
| | static linking to non (L)GPL.
|
| Come to think of it, isn't that kind of how nvidia can put a binary
| driver in Linux?

The relevant clause states that "If identifiable sections of that work
are not derived from the Program, and can be reasonably considered
independent and separate works in themselves, then this License, and its
terms, do not apply to those sections when you distribute them as
separate works."

The question is whether a module which uses a published API to interface
with other code can reasonably be considered independent of the original
work.

One could probably argue that in the case of ReiserFS and Windows, the
original Windows code is an "identifiable section [...] and can be
reasonably considered independent and separate", and thus does is not a
derived work.

Following this line of thinking, under GPL terms one could modify
ReiserFS in such a way that the code could interface with Windows via
the defined API, and they could redistribute those modifications under
the GPL as long as the modified ReiserFS code is distributed separately
from Windows itself.

"But when you distribute the same sections as part of a whole which is a
work based on the Program, the distribution of the whole must be on the
terms [of the GPL]". This would explain why binary-only drivers aren't
generally distributed with the Linux kernel itself -- the GPL seems to
explicitly forbid it, with the exception that they may reside on the
same media.

This would also seem to indicate that if Microsoft wanted to include
ReiserFS as a part of Windows they would either have to GPL Windows
itself or strike a deal with Hans Reiser. Actually, the same would be
true for Apple, or any publisher of a non-GPL operating system.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (MingW32)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFCHt/RrDBoMHxfhXwRAo86AJ9pEfw9EQXhH3RO7TRaqbWj4MdSBQCg1S3O
8dbzE9AzEbmnZrq/kHwJOkc=
=kKdo
-----END PGP SIGNATURE-----
