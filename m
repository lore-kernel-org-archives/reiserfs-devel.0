From: Pierre Etchemaite <petchema@concept-micro.com>
Subject: Re: max files
Date: Tue, 4 May 2004 11:51:35 +0200
Message-ID: <20040504115135.74646e6c.petchema@concept-micro.com>
References: <3DF9165145FACB4C96977FF650C1E9040C469F16@its-mail1.its.corp.gwl.com>
	<4096851F.9040508@namesys.com>
	<409685C3.30502@mweb.co.za>
	<1083625008.6688.54.camel@faith>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18425-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1083625008.6688.54.camel@faith>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le Tue, 04 May 2004 08:56:49 +1000, Stewart Smith <stewart@flamingspork.com>
a =E9crit :

> stewart@saturn:~$ time ls Maildir/.Lists.linux-kernel/cur/ > /dev/null
> =20
> real    0m9.403s
> user    0m2.190s
> sys     0m0.230s
>=20
> and for repeated runs (i.e. when things are cached):
> stewart@saturn:~$ time ls Maildir/.Lists.linux-kernel/cur/ > /dev/null
> =20
> real    0m2.284s
> user    0m2.160s
> sys     0m0.130s

Very bad filesystem test, because ls will sort results by default. Try=20
ls -U (unsorted).
