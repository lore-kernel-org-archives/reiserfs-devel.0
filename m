From: David Masover <ninja@slaphack.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 02 Sep 2004 20:41:32 -0500
Message-ID: <4137CBCC.8050101@slaphack.com>
References: <20040829191044.GA10090@thundrix.ch> <3247172997-BeMail@cr593174-a> <20040831081528.GA14371@thundrix.ch> <20040901201608.GD31934@mail.shareable.org> <1094070506.28509.24.camel@shaggy.austin.ibm.com> <41369911.1030503@slaphack.com> <20040902060521.GB14177@mail.shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21388-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040902060521.GB14177@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Jamie Lokier wrote:
| David Masover wrote:
|
|>Isn't the kernel faced with the same issues here as userland programs
|>without meta attribute support?  How do you read the META element before
|>you know the encoding?
|
|
| Ideally you guess whether it's ASCII-compatible, EBCDIC-compatible, or
| UTF16 or UCS4 :) Then you scan for a META element.  I suspect everyone
| only tries for ASCII compatibilty.  There's a bit of guessing
| involved.  Every parser has its own way - it's not well defined

And though it's nice for that guessing to be in one place, I'd rather
not guess at all.  Especially when we don't have to -- see below.

| No.  File descriptors are pure binary.
|>Otherwise I agree -- the html editor should do that.  Although I'd hate
|>to see Vim patched to do that.  Maybe save it as file/utf8?
|
|
| file/utf8 would be wrong.

Why?  No, I don't mean as a MIME type ... literally do
	vim foo.txt/utf8
to open a file named "foo.txt" and save it as "utf8".

That means that if vim doesn't automatically know how to tell a file
what its encoding is -- since vim already knows its encoding.  But it
provides a generic way for a user to tell the text editor to tell the
FS, all in one easy step, how to save the file.

It has its drawback -- it can really only support encoding -- or only
one save option -- unless we're truly using files to send queries to the
fs -- that is, something like foo.txt/writer/encoding=utf8&eol=crlf

I think that's feasable, and I think similar things (stranger things,
like SQL queries) have been planned for reiser5 and such.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQTfLzHgHNmZLgCUhAQKP0w/+IWnJM6qI04xsKXQJCCOd1tArnr+NB4us
aGKj1JECibZCQhZiMc9aDLSr5FDosmTuMzdkVzMERoatzeuXjEyZrFFQNmsFQmzl
c6KIvRrIgNOP4L5vOYxMUhGII1WEVI2Ub91t5TOYlcERn0raO4FL3WIUJ9gq6Lhc
PcXrPvPp6yzIegJhe+mpHJi8/NrLnDdmmO8kg50C6ckYTrBeEzHwtTaJycEsaJub
JDKjNZlhceRreTx6wccW26lPKXVus6rp5GOZgX9WliA2ktW8K9D8/cyZvOqRzC0y
aDQUfhy5ZYkmxcHxKENEFrA85Gz3LTOwd4ci1DKCWW1HFp33EkmWIvXL7iiwMI7X
xpkFfwap78O1ohUk0VdvkuQuKtKp2FmxMVwJpJe/982EcyECeMXqYbD3D5WJeXN4
1fZVPiZnt5FKOMBXgQ8qPAGit5eZkfI4SDc6uMfoQ0st+gd/E02j1Bf4ArheWRse
7f7Mk1C8IaQ4j565IGTABDjkpJwWWsmkItJRdZctCv+u6A2g70DREykU9G0iG4ua
HGm53G8gba/A25Nt2Rw+7jt18zdeO/rEY9PaGmRKJVDkQSufHzWUuQ79LZrWr7as
z5wLW6u+3FEn5xXCDAWyv4tbJOxPcxXTAuVe12KB4nYAHDjBgin77q9BcP6gqOQJ
3z/s3Tu95Yw=
=m/jf
-----END PGP SIGNATURE-----
