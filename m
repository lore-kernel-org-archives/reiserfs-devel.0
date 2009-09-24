From: Denic Sinisa <sdenic@yandex.ru>
Subject: Re: reiser4->GRUB
Date: Thu, 24 Sep 2009 13:54:22 +0400
Message-ID: <35531253786062@webmail44.yandex.ru>
References: <85be3c990909080732m2fa251depac3f21b52dae083b@mail.gmail.com> <4AA7A22A.30102@gmail.com> <85be3c990909231421i54c548dw7648c0c34f2a8cc6@mail.gmail.com> <4ABA9D67.8090709@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4ABA9D67.8090709@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

                  Edward, take a look at this
/home/eiserfs/reiser4progs-1.0.7 # grep 1.0.5 -r *

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ChangeLog:      1.0.5 version.
configure:        *\ [01].* | *\ 2.[0-9].* | *\ 2.1[0-5].*)
configure:        *\ [01].* | *\ 2.[0-9].* | *\ 2.1[0-5].*)
configure:        *\ [01].* | *\ 2.[0-9].* | *\ 2.1[0-5].*)
configure:{ echo "$as_me:$LINENO: checking for libaal version =3D 1.0.5=
" >&5
configure:echo $ECHO_N "checking for libaal version =3D 1.0.5... $ECHO_=
C" >&6; }
configure:libaal_config_major_version=3D`echo 1.0.5 | \
configure:libaal_config_minor_version=3D`echo 1.0.5 | \
configure:libaal_config_micro_version=3D`echo 1.0.5 | \
configure:{ echo "$as_me:$LINENO: checking for libaal-minimal version =3D=
 1.0.5" >&5
configure:echo $ECHO_N "checking for libaal-minimal version =3D 1.0.5..=
=2E $ECHO_C" >&6; }
configure:libaal_config_major_version=3D`echo 1.0.5 | \
configure:libaal_config_minor_version=3D`echo 1.0.5 | \
configure:libaal_config_micro_version=3D`echo 1.0.5 | \
configure.in:AC_CHECK_LIBAAL(aal, 1.0.5, ,exit)
configure.in:           AC_CHECK_LIBAAL(aal-minimal, 1.0.5, ,exit)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
               while :=20
/home/reiserfs/reiser4progs-1.0.7 # grep 1.0.7 -r *
               produces only this:
ChangeLog:      1.0.7 version.
reiser4progs.spec:Version: 1.0.7
           =20
All above iz valid for reiser4progs-1.0.6 too.

I'm a little confused which version of r4progs is latest,=20
some one from gentoo portage lunched v 1.0.7 while v1.0.6 resides at of=
ficial reiser4progs site
Thanks
Sinisa

24.09.09, 02:12, "Edward Shishkin" <edward.shishkin@gmail.com>:

> Sinisa Denic wrote:
> > Hi Edward, I figured out that grub-0.97 with current reiser4 patch =
can't
> > compile with reiser4progs above 1.0.5 because of "objplug" and some=
 more
> > dependencies.
> >  =20
> Wow,
> I thought you've forgotten about grub+reiser4 already.. ;)
> > Current set I could compile against reiser4progs but I've been geti=
ng a
> > linking error about libreiser4-minimal this looks like:
> >
> > /usr/lib/gcc/x86_64-pc-linux-gnu/4.3.2/../../../../x86_64-pc-linux-=
gnu/bin/ld:
> > skipping incompatible
> > /usr/lib/gcc/x86_64-pc-linux-gnu/4.3.2/../../../libreiser4-minimal.=
a when
> > searching for -lreiser4-minimal
> >
> > I made a few changes and now grub-0.97 can compile against latest
> > reiser4progs-1.0.7 but I'm still getting the same error at link sta=
ge:
> > /usr/lib/gcc/x86_64-pc-linux-gnu/4.3.2/../../../../x86_64-pc-linux-=
gnu/bin/ld:
> > skipping incompatible
> > /usr/lib/gcc/x86_64-pc-linux-gnu/4.3.2/../../../libreiser4-minimal.=
a when
> > searching for -lreiser4-minimal
> >
> > Any idea, what compatibillity is violeted
> >  =20
> It seems, that I was inaccurate when releasing reiser4progs>1.0.5
> and some version numbers remain not updated. Would you please
> grep for "1.0.5" in the latest packages?
> Thanks!
> Edward.
> > Regards, Sinisa
> > p.s. There is a little grub(reiser4progs-1.0.5 -1.0.7) - patch in a=
ttachment
> > On Wed, Sep 9, 2009 at 12:40 PM, Edward Shishkin
> > wrote:
> >
> >  =20
> >> Sinisa Denic wrote:
> >>
> >>    =20
> >>> Hallo, Edward here Sinisa(Serbia),
> >>>
> >>>
> >>>      =20
> >> Hello.
> >>
> >>  I've foundout reiserfs until now has been better then ext3 for me=
,and I
> >>    =20
> >>> home
> >>> reiser4 will continue such tradition.
> >>> So I'm disappointed with fortune of Hans and reiser4, I think he =
has BAD
> >>> luck...
> >>> I've some programing experience in kernel programing and I'm intr=
esting in
> >>> programming support for reiser4 in GRUB, or may be important thin=
gs(in
> >>> your
> >>> opinion)
> >>>
> >>>
> >>>      =20
> >> Yes, it is important.
> >>
> >>  Would you have some words to me,how to begin, where to start etc.
> >>    =20
> >>>      =20
> >> There is a reiser4 patch for grub-0.97. It can be found here:
> >> http://ftp.icm.edu.pl/packages/linux-reiserfs/reiser4progs/grub/
> >>
> >> But I have heard that there are some problems with this.
> >> I don't know what is wrong: I didn't test it. It would be great
> >> to figure out and fix it. Here you can find the instructions for
> >> grub+reiser4 installation:
> >>
> >> http://web.archive.org/web/20061113154722/http://www.namesys.com/i=
nstall_v4.html
> >>
> >> First test it in "safe mode" (grub shell).
> >> Try grub shell commands (root, cat, ...) to work with filesystem (=
reiser4).
> >> Use gdb to figure out what is wrong.
> >> Please, ask, if something is not clear..
> >>
> >> Thanks!
> >> Edward.
> >>
> >>    =20
> >
> >  =20
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
=D0=9C=D0=B5=D1=82=D0=BA=D0=B0=D1=8F =D0=BF=D0=BE=D1=87=D1=82=D0=B0 =D0=
=BD=D0=B0=D1=85=D0=BE=D0=B4=D0=B8=D1=82=D1=81=D1=8F =D0=B7=D0=B4=D0=B5=D1=
=81=D1=8C:http://mail.yandex.ru/promo/new/labels
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
