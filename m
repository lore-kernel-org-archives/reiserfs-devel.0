From: Chris Mason <mason@suse.com>
Subject: Re: mount hang on kernel 2.6
Date: Sun, 07 Mar 2004 18:07:26 -0500
Message-ID: <1078700846.25077.205.camel@watt.suse.com>
References: <20040307_223203_003004.silos.reis@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17115-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040307_223203_003004.silos.reis@ig.com.br>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Fabiano Reis <silos.reis@ig.com.br>
Cc: reiserfs-list@namesys.com

On Sun, 2004-03-07 at 17:32, Fabiano Reis wrote:
> Hi list,=20
>=20
> I=B4m having problems to mount a reiserfs filesystem using kernel 2.6.3 o=
n=20
> RedHat 9.=20
>=20
> The fs I=B4m trying to mount was formated using kernel 2.4.20-24.9 (the l=
atest=20
> kernel for RH9) with ReiserFS version 3.6.25 (from dmesg) and reiserfspro=
gs=20
> 3.6.4 (from reiserfsck -v command)=20
>=20
> I upgraded to kernel 2.6.3 (rpm from=20
> http://people.redhat.com/arjanv/2.6/RPMS.kernel/)=20
>=20
> The symptom: When I execute the command=20
>=20

Can you reproduce with a vanilla or -mm kernel?

-chris


