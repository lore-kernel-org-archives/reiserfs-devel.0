From: Jure =?ISO-8859-2?Q?Pe=5Far?= <pegasus@nerv.eu.org>
Subject: Re: reiserfs on Redhat Enterprise Linux
Date: Wed, 6 Oct 2004 15:24:01 +0200
Message-ID: <20041006152401.5cb2c4a7.pegasus@nerv.eu.org>
References: <1096987891.4297.383.camel@ketil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22008-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1096987891.4297.383.camel@ketil>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Tue, 05 Oct 2004 15:51:32 +0100
Ketil Froyn <reiserfs@ketil.froyn.name> wrote:

> Hi,
>=20
> I am investigating a migration of a system relying on reiserfs to Redhat
> Enterprise Linux 3. As I understand it, reiserfs is unsupported in
> RHEL3, but is available anyway in a kernel-unsupported package or
> something like that. However, it seems the reiserfs-utils package is not
> available.

They still keep it in their source tree, but it's at the same level as it is
in base kernel RHEL is built upon.=20

I have 2.4.21-9.EL kernel here that i've patched with reiserfs from 2.4.27 i
think and is working ok in production (large mail server). If you want, i
can put the tarball somewhere online.

> Which version of reiserfsprogs should I use to make sure I have one that
> works for me? For instance, should I always go for the latest one (which
> is 3.6.18 today), or do I need to match reiserfs-utils version to kernel
> version in some fashion?

Latest, of course :)


--=20

Jure Pe=E8ar
http://jure.pecar.org/
