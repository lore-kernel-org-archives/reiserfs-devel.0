From: Cyril Brulebois <kibi@debian.org>
Subject: Re: Bug#858849: installation-reports: Successful Jessie installation
 with backported kernel 4.9.16-1+reiser4.0.1 on i915 system AMD64
Date: Wed, 29 Mar 2017 17:48:39 +0200
Message-ID: <20170329154839.GE17320@mraw.org>
References: <20170327163053.8989.51286.reportbug@xiuhcohuatl.metztli-it.com>
 <20170328030000.GC27809@mraw.org>
 <CAM12Q5QoPtqyE7V0oshZRQOraVJV-82PrYFhytNfwRNBoaRA9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EXKGNeO8l0xGFBjy"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mraw.org; s=mail;
        h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=1w21jXA9LrCLFeSER/sRuRQq3DfPgM8geN2t51TKnpo=;
        b=WXtZP0HGzLadp3xEv49z19ICwlTej1wIO3GODpWbpKM/cbi4meSN8+gIbR9uOKsw0NN5tDxVGO9XwxDUxypijt/Ph1z4NnJGmMCwuUSyV1H9MAnVWVDV5yeJQwiXW5uHC8fO5g1EKwni6IZg2jVyDrEGVqKg/aj33aYWs7ebX1I=;
Content-Disposition: inline
In-Reply-To: <CAM12Q5QoPtqyE7V0oshZRQOraVJV-82PrYFhytNfwRNBoaRA9g@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jose R R <jose@metztli-it.com>
Cc: 858849@bugs.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>


--EXKGNeO8l0xGFBjy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Jose R R <jose@metztli-it.com> (2017-03-29):
> With all due respect, 99% of the build code for the debian-installer
> is yours. As well as the build pulls 99% UDEBs from official debian
> repositories.

That doesn't mean that everything built on top of it has to be reported
on Debian mailing lists and bug tracker. See derivative distributions,
they have their own issue tracker, and only forward specific issues.

> i.e., this is a Debian issue, not mine -- as I did not even touch that
> code and/or modules -- which 1 month ago actually did work smooth:
>=20
> Netboot debian-installer was unable to load firmware from second USB
> for wifi connection; accordingly, in another virtual screen, I mounted
> the 2nd USB and manually copied the firmware directory onto the
> installer environment /lib. d-i then detected the wifi signal, etc.
>=20
>=20
> Second, report on this unofficial jessie-backports kernel
> 4.9.16-1+reiser4.0.1 sheds light on the fact I experienced *no issue*
> with module i915, as had been reported by (maintainer?): <
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D858078 > thus, in a
> collateral manner, I am contributing to official debian development.

If you want to reply to submitters/maintainers, reply to specific bug
reports/threads, instead of sending lengthy mails to other people?

> Finally, I am not requesting *any* support. I am simply reporting that
> your d-i pulling official UDEBs actually have been successful, with
> minor modifications and a few extra UDEBs of mine, in my installation
> experience, following Debian documentation guidelines:

I haven't put words in your mouth and suggested you were requesting some
support. I'm just not convinced such reports are useful. If you
encounter specific issues, report specific bug reports against the
relevant component.

debian-boot@ isn't and shouldn't be the destination of each and every
thing connected to, or merely using, Debian Installer.

> "We also encourage installation reports to be sent even if the
> installation is successful, so that we can get as much information as
> possible on the largest number of hardware configurations." <
> https://www.debian.org/releases/stable/amd64/ch05s04.html.en#submit-bug
> >

Sure, with official images.

> If you are still 'bothered' with my sporadic submissions, I encourage
> you to modify the documentation to specifically exclude the glaring
> omission.

I could be adding a specific =E2=80=9Cwe don't need reiser4-specific report=
s=E2=80=9D
there, but I would hope this isn't needed, since the only submitter of
such reports against images we don't build, publish, or support, seems
to be you.

Thanks for your cooperation.


KiBi.

--EXKGNeO8l0xGFBjy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJY29dIAAoJEP+RSvDCs1UgOZsQALbJNvkrPdP2aUM+om+Qv9ow
W1YbTbX4bIUnix/sdAEVvj6EMc+2s23tkweRTNdaPmv+o60iVxVhe28987e5k1pz
j8HatFfNTd4qS1zTpUn6NhNMEeN7JAUNTf3BaocY4VF3jN6KTB1tYjNTtOtu6XVg
BAzKIuloGSYVOskF/0i4vyucPPfCgKJddl4QQiR9F6M16usqPRqAl1DJuQ2gII0y
tgRPzjQXuSx7LWnf+D10PdV4c3oSRkbVMydp2C7F4KN0hkczIWNrDzg3106ScAxi
mmx0A1DQtFT0sTjExqXMIFsAwFNaKKQrdtqStDIPR3HkCcLvgVkW00ZD7BhLKiBK
hwXd/fcca7DIcVw8NSYzdSQ7u903YlJ+G2YJzJxXKFo5yAQWQpe87aUulbWVm9hR
Qoy0xC76dkW8ddKlfZ6azxMdts5fG3LSura87LNzKC8+IrYE21TrvfhgLaLQtneV
9eg2zOsovM7NTPPY4z/tZ6UuZXh47QW3W0yLQhFsT+dXQCmjtCKV+HOJhUXXT+iH
Rk0GH6h/PAe4uFSxY+OUV5NeOrTOLHJqNUb/eC5e7tD4c1+FPPCl4SyD+XnrzakW
y2Z1sKlGc1nlwMFHciIWzSwy01VlfeDfMR5Yd1Z+6UHOyqsZl88uMhTSB1PUlEoK
4wmBH1GVTWpCixf0e9vI
=SK2+
-----END PGP SIGNATURE-----

--EXKGNeO8l0xGFBjy--
