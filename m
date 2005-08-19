From: studdugie <studdugie@gmail.com>
Subject: Re: 15M files
Date: Fri, 19 Aug 2005 18:44:52 -0400
Message-ID: <5a59ce530508191544232bf73d@mail.gmail.com>
References: <5a59ce53050819144970d07ab0@mail.gmail.com>
	 <43065899.3030301@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25582-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43065899.3030301@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-mailing-list <reiserfs-list@namesys.com>

MySQL is too slow for the task, even over localhost. I've benchmarked
it. Berkeley DB was 3x faster than MySQL for my usecase. The app is
written in Java so I would be forced to use JDBC to talk to MySQL. The
wrapping/unwrapping overhead is a killer.

On 8/19/05, David Masover <ninja@slaphack.com> wrote:
>=20
> studdugie wrote:
> > Hello. I'm looking to replace a couple Berkeley DB data stores w/
> > regular file system directories backed by reiserfs (3.6).
>=20
> Why 3.6, and not 4?  I'll bet v4 is better at this.
>=20
> > I
> > would really appreciate some feedback from the experts before I go
> > ripping out the Berkeley DB code.
>=20
> Others can answer the questions about whether the FS can handle it.  I
> would suggest that you consider a real database, though, at least until
> Reiser4 gets a good way (sys_reiser4?) of handling multiple files --
> otherwise, you can expect to lose a lot of speed to all the open(2) calls=
.
>=20
> I don't know anything about the status of sys_reiser4.  If it's almost
> done, you may want to wait for it, but I don't think it's almost done.
>=20
> Maybe MySQL would do the trick?  You may end up having to benchmark it
> yourself...
>
