From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: [patch 4/4] reiser4: reduce frame size of reiser4_init_super_data
Date: Wed, 07 Oct 2009 21:54:42 +0200
Message-ID: <4ACCF202.7020701@free.fr>
References: <4AC9407C.2050105@gmail.com> <4ACCEFCA.9070106@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4ACCEFCA.9070106@free.fr>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 
Cc: Edward Shishkin <edward.shishkin@gmail.com>, akpm@linux-foundation.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Oops, sorry, Edward already sent a patch for this...

~~
laurent


Le 07/10/2009 21:45, Laurent Riffard a =E9crit :
> Hi Edward,
>=20
> This patch is buggy, isn't it ?
>=20
> I've got 2 reiser4 FS in my /etc/fstab:
>=20
> /dev/vglinux1/lvkernel-r4 /home/laurent/kernel reiser4 defaults,noati=
me,nodiratime,tmgr.atom_max_size=3D2048 0 0
> /dev/disk/by-uuid/b8dbe880-b664-49aa-8050-bddc91fd5e49 /mnt/diske rei=
ser4 noauto,users,noatime,nodiratime 0 0
>=20
> The first FS can't be mounted:
>=20
> [  235.078342] reiser4[mount(4205)]: parse_options (fs/reiser4/init_s=
uper.c:253)[nikita-2307]:
> [  235.078345] WARNING: Unrecognized option: "tmgr.atom_max_size=3D20=
48"
>=20
> although the second one can be mounted:
>=20
> [ 3152.046324] reiser4: sda7: found disk format 4.0.0.
>=20
>=20
> Let's have a look at the code in fs/reiser4/init_super.c:
>=20
>=20
> 392 int reiser4_init_super_data(struct super_block *super, char *opt_=
string)
> 393 {
> 394         int result;
> 395         struct opt_desc *opts, *p;
> 396         reiser4_super_info_data *sbinfo =3D get_super_private(sup=
er);
> 397=20
> ...
> 442         p =3D opts;
> 443=20
> 444         push_sb_field_opts(p, opts, sbinfo);
>=20
> p is passed by value to push_sb_field(). push_sb_field() does increme=
nt=20
> its local copy of p, but here p remains equal to opts.
>=20
> ...
> 501         result =3D parse_options(opt_string, opts, p - opts);
>=20
> 3rd argument is 0 because p=3D=3Dopts. Now let's have a look at parse=
_options()
>=20
> 230 static int parse_options(char *opt_string, struct opt_desc *opts,=
 int nr_opts)
> 231 {
>=20
> nr_opts always =3D=3D 0 here.
>=20
> 232         int result;
> 233
> 234         result =3D 0;
> 235         while ((result =3D=3D 0) && opt_string && *opt_string) {
>=20
> I assume opt_string is not null (opt_string =3D=3D "tmgr.atom_max_siz=
e=3D2048" ?),=20
> so let's loop:
>=20
> 236                 int j;
> 237                 char *next;
> 244                 for (j =3D 0; j < nr_opts; ++j) {
>=20
> nr_opts =3D=3D 0, so we won't do any iteration here.
>=20
> 245                         if (!strncmp(opt_string, opts[j].name,
> 246                                      strlen(opts[j].name))) {
> 247                                 result =3D parse_option(opt_strin=
g, &opts[j]);
> 248                                 break;
> 249                         }
> 250                 }
>=20
> here, j=3D=3D0 and nr_opts=3D=3D0.
>=20
> 251                 if (j =3D=3D nr_opts) {
> 252                         warning("nikita-2307", "Unrecognized opti=
on: \"%s\"",
> 253                                 opt_string);
> 254                         /* traditionally, -EINVAL is returned on =
wrong mount
> 255                            option */
> 256                         result =3D RETERR(-EINVAL);
>=20
> oops !
>=20
> ~~
> laurent
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
