From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Tue, 30 Mar 2004 21:04:08 +0400
Message-ID: <16489.43144.773836.364284@laputa.namesys.com>
References: <20040330123546.GA5229@nysv.org>
	<20040330162451.63097.qmail@web25001.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17598-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040330162451.63097.qmail@web25001.mail.ukl.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Cc: Markus =?koi8-r?B?IlT2cm5xdmlzdCI=?= <mjt@nysv.org>, reiserfs-list@namesys.com

Narcoleptic Electron writes:
 > Markus T=F6rnqvist wrote:=20
 >=20
 > > Scott Young wrote:
 > >=20
 > > >/home//attribute would be the an attribute on the
 > > >home directory.=20
 > >=20
 > > I think a double slash is a terrible idea. They are,
 > > probably by some
 > > standard, interpreted as a single one in most cases.
 >=20
 > Can you footnote this one?  I would hate to eschew an
 > idea simply as a result of speculation.
 >=20

----------------------------------------------------------------------
Pathname

A character string that is used to identify a file. In the context of
IEEE Std 1003.1-2001, a pathname consists of, at most, {PATH_MAX} bytes,
including the terminating null byte. It has an optional beginning slash,
followed by zero or more filenames separated by slashes. A pathname may
optionally contain one or more trailing slashes. Multiple successive
slashes are considered to be the same as one slash.

[The Open Group Base Specifications Issue 6]
----------------------------------------------------------------------

And... Google is your friend. :)

Nikita.
