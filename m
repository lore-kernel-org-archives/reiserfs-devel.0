From: "Burnes, James" <james.burnes@gwl.com>
Subject: reiser4 semantics / BeFS Architect(s) Query Resolution
Date: Mon, 30 Aug 2004 08:32:55 -0600
Message-ID: <3DF9165145FACB4C96977FF650C1E9040C46A3D1@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21110-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, Will Dyson <will_dyson@pobox.com>
Cc: Andrew Morton <akpm@osdl.org>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

(comments below)

> -----Original Message-----
> From: Hans Reiser [mailto:reiser@namesys.com]
> Sent: Saturday, August 28, 2004 3:55 AM
> To: Will Dyson
> Cc: Andrew Morton; hch@lst.de; linux-fsdevel@vger.kernel.org; linux-
> kernel@vger.kernel.org; flx@namesys.com; torvalds@osdl.org; reiserfs-
> list@namesys.com
> Subject: Re: silent semantic changes with reiser4
>=20
> I think there are two ways to analyze the code boundary issue.  One is
> "does it belong in the kernel?"  Another is, "does it belong in the
> filesystem. and if so should name resolution in a filesystem be split
> into two parts, one in kernel, and one in user space."  In ten years I
> might have the knowledge needed to make such a split, but I know for
> sure that I don't know how to do it today without regretting it
> tomorrow, and I don't really have confidence that I will ever be able
to
> do it without losing performance.
>=20
> Glad that BeFS finds the new model better.:)
>

(glad that BeFS supposedly solved it)

>=20
> > Hans Reiser wrote:
> >
> >> Will Dyson wrote:
> >>
> >>>
> >>> In the original BeOS, they solved the problem by having the
> >>> filesystem driver itself take a text query string and parse it,
> >>> returning a list of inodes that match. The whole business of
parsing
> >>> a query string in the kernel (let alone in the filesystem driver)
> >>> has always seemed ugly to me.
> >>
> >>
> >> Why?
> >

Here is an interesting interview of Dominic Giampaolo and Benoit
Schillings regarding the structure of BeFS.  Some interesting issues
regarding how queries were done.

http://www.theregister.co.uk/2002/03/29/windows_on_a_database_sliced/

BTW: I get paid during the day to do security engineering work.
Wouldn't parsing the query in the kernel make the kernel susceptible to
buffer overflows?  Bad place to have an overflow.

j.burnes

