From: Miguel <turtle.power@wanadoo.es>
Subject: Re: Can compression at filesystem level improve overall
 performance?
Date: Tue, 23 Mar 2004 01:17:33 +0100
Message-ID: <20040323011733.7026b4bb.turtle.power@wanadoo.es>
References: <405B02ED.4010602@solidcode.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17391-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <405B02ED.4010602@solidcode.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Erik Terpstra <erik@solidcode.net>
Cc: reiserfs-list@namesys.com

On Fri, 19 Mar 2004 15:25:49 +0100
Erik Terpstra <erik@solidcode.net> wrote:

> Hello everyone,
>=20
> For the last couple of years I noticed that the performance of most of
>=20
> my systems has it's bottleneck in data throughput rather than CPU=20
> performance.
>=20
> Is it fair to say that today compression at the filesystem level would
>=20
> improve overall performance?
>=20
> If this is the case, it probably wouldn't be too hard to implement as
> a module in Reiser4?
>=20
> Any thoughts?
>=20
> --Erik.
>=20
There's some publication on this issue:

http://ssrc.cse.ucsc.edu/Papers/ucsc-crl-03-04.pdf (Measuring the
compressibility of metadata and small files for disk/NVRAM hybrid
storage systems) at http://ssrc.cse.ucsc.edu/publications.shtml

I'dont know if it's statements are correct but it's a beginning

--=20
La resistencia es f=FAtil todos ser=E9is asimilados
