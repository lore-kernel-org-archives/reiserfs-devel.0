From: David Masover <ninja@slaphack.com>
Subject: Re: Fibration questions
Date: Thu, 22 Jul 2004 21:45:26 -0500
Message-ID: <41007BC6.3060209@slaphack.com>
References: <40FE0B47.3010600@slaphack.com> <20040721063607.1A09015C92@mail03.powweb.com> <20040721083232.GA4990@nysv.org> <40FF3DAD.6020100@slaphack.com> <20040722100657.GC4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19766-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040722100657.GC4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Markus T=F6rnqvist wrote:

| Anyway, setting propagation is important, but it's also important to
| handle conditions like (cool, pseudo-sql! ;)
| UPDATE formatting SET policy=3D'never\0' WHERE policy=3D'smart\0' RECURSE;
| instead of just
| UPDATE formatting SET policy=3D'never\0' RECURSE;
| which may break something else...

Both should be allowed.  Can that be done now?  And with echo, not SQL.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQQB7xngHNmZLgCUhAQIDVA/+JRN5/b2SEzHwqZYGyFVBRyXGQkvnUiUo
2IAkguvwZ0CJvrpKo5u2WjDIn/V0v4P8miq7CoLavYSsYpd5dvNeeayRdMDz7cLv
9AcQxXlfxJfu0wPvscP7iEBybs3ayHmkLalDbpMybeJfn+T3/+65YrBMVIEnrIGs
wz+4/j9ffEtC6jbij+Xt+XnI6GUUdK6jUSNP0lTe+Z/XGztZrd85uI4KuGsYjdrb
QkI9IEoUj1wLNUcNEdZD7kHS70kK9BA1CD7d/rj0Pc2urJYYHQ55LHlRt1s7VsQU
9qhBC8xtUqtZQe48IfOQ4VHLoZPoVygba3lMhFfAsTHvkieavHykZauNI6uBmOeY
uqc4gAZZtw8QvpnOYNsmDMyFo1Qlz9ZTNfi/BJQBpOvtFFqt6Q+NeMA2kSyyxd1u
GlagtGQMxrtMY9pgBiRK5R7+RusiSbEe2Skda1vDMok8owoUpLSW57dzVVlWCuXC
SPSdCSx23iQYBjNaKgeQtP1Zl4eVD1lsAAPq38tzK+Hx/66oWFlLLnlN5o2pbllI
togm9bW8dG2wGAptYaixcq0XAz7vi2G+9aD1snIJsAtuTVi1FEciYvjry+5tXiLO
LLogs6uIdMMJiQTr+S5781d/+KQ0YEo3dQXl/tilfIFUqWTKCJ7hqni/xE0kMDlS
ejswFHGTEeI=3D
=3DdUdg
-----END PGP SIGNATURE-----
