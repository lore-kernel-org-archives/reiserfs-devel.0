From: David Masover <ninja@slaphack.com>
Subject: Re: Fibration questions
Date: Sun, 18 Jul 2004 23:23:32 -0500
Message-ID: <40FB4CC4.80300@slaphack.com>
References: <20040716103441.2BA8715C1D@mail03.powweb.com> <40FA22A3.5060503@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19675-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40FA22A3.5060503@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Hans Reiser wrote:
[...]
| If FS naming was better designed, filenames would not have extensions.
| I prefer to first better design naming, and then not need to optimize
| the API for extensions.

Still, if we're going to fibrate by file type and want to find a file by
file type, there needs to be -- surprise! -- a standard way to determine
file type.

Extensions are universal, and aren't going away soon.  What do we want
to replace them with?  Only thing I particularly care about here is that
a file can appear as more than one type -- a script is both a program
and a text file, for example.  Of course, you'd only be able to fibrate
by one type (right?), so there'd have to be a "primary" file type.

This is helpful because it's the right thing to do, but also because it
may have implications right now.  For example, Gedit and AbiWord should
both show me uncompressed AbiWord docs in their "open" dialogs, by
default.  Using file extensions, that isn't possible unless you hack
Gedit to "know" every possible text file extension, or check the magic
on each file in the directory.

The "propor" way to implement it would be to ask the filesystem
something like "List all the text files in this directory".  And not,
btw, "List all the *.txt files in this directory".


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQPtMxHgHNmZLgCUhAQKJxA//R1jxJuQ+PerBlgXO0FeGawp/i6Fr0wEU
WnZBG81fX07fcp+BzZWWu0lFE6kOrrmY/nuyKNsV1GT54jz1BkYklCBxGGmgHjGs
GZW3FvHHVWEfKNNuYv9zUVEkgA3RhxbCiQ5v44IrHzBLOFFDGTaOaBtsSC/NJa5C
I95IitqXRDj3AYDgpdu+++absgH47mCzThEdXP++Sb8RQwGEgnaubEDJIWqi+qOu
K5Psgudnu7+QejTlNzU5WuoCAwCX3b2+Trk6qj1bOJk7CucaBtojlwvifLJpZzau
Mi5gBe8cddyderP9f1rDHovUCcRcd5x0If7ESFYwfmNZO/GakJI1MSzt9W6c5PWK
Elap3jaA8aHmPJ6gfN24+GFvEgM7LDM/zw9GpjJ41awcf4Y/m7n8AfRaGv1+Ybvm
B+JmWMexqk+O+phCNvI/lfOOnbOCcaIMihzw5LO/e+jpJkOTuMwozPWMaIy1OZBC
FRjvTv28uCcbTepjHRDw1xmdY3lQ7GuO53/li0DerIYiAC3+zlX1mg1/PV7kl85B
jWXh89OEQd6ak9W/DKJnxd3uFe5c3nue9yr6PzSdC+bqSaN3p/KWmlZxtkqKhxOM
E9QVgtsS9j5snwsf5d+viCZ1eEn3p8UYDZsVvvrqzwaC3opgXpYyQZ/YmnivLnJJ
EXadVtulIuU=
=67XN
-----END PGP SIGNATURE-----
