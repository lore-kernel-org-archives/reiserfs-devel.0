From: Michael Milverton <camel78@iprimus.com.au>
Subject: Re: ReiserFS on Linux 2.6.7 kernel
Date: Mon, 28 Jun 2004 22:06:55 +0800
Message-ID: <200406282207.01984.camel78@iprimus.com.au>
References: <20040628133149.31608.qmail@web53304.mail.yahoo.com>
Reply-To: camel78@iprimus.com.au
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_FYC4AX8eamBdSmt";
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19431-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040628133149.31608.qmail@web53304.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: Ashish Rathi <ashish_pspl@yahoo.com>

--Boundary-02=_FYC4AX8eamBdSmt
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Ashish,
	There are two reiser filesystems, a new one that is still being debugged a=
nd=20
an older one that is in wide use. The older one is the one that is in the=20
kernel you reffered to, the new one is not. The new filesystem is called=20
Reiser4. This is very new and is not yet in wide use.=20

As far as I know the 3.6.17 you are referring to is the reiserfsprogs, eg t=
he=20
tools that manage the reiserfs filesystem. These should come with your=20
distribution. Apart from that just compile reiserfs into you kernel and you=
=20
should up and running.

On Mon, 28 Jun 2004 09:31 pm, Ashish Rathi wrote:
> Hi
>
> I am pretty new to ReiserFS and have a very basic
> question to ask.
>
> I recently upgraded to the 2.6.7 kernel available on
> kernel.org. On the ReiserFS download page, I see that
> ReiserFS 4 is being still listed as "experimental" for
> the Linux 2.6 kernel.
> So what version of ReiserFS does the 2.6.7 kernel
> include ? Is it 3.6.17 ? Where do I look in order to
> find this info ?
>
> I'll be glad if someone could help me out here.
>
> Thanks
> Ashish
>
>
>
>
>
>
>
>
> __________________________________
> Do you Yahoo!?
> New and Improved Yahoo! Mail - Send 10MB messages!
> http://promotions.yahoo.com/new_mail

=2D-=20
GNU/Linux: Secure, Stable, Free
Michael <camel78@iprimus.com.au>

--Boundary-02=_FYC4AX8eamBdSmt
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iQCVAwUAQOAmBTbWs3O08JjCAQLsJQP/aVTvUaRciWX+RgkiyzXVHdblK+yGh4yk
blX5W/6cbXUOQktg3noAK6YfgPZ7YPFfhc+RRbInDJVevI7L/QwZoDQ+5zxPx4rC
x+U2a+u+EQ7XxMd8anx+wywRTpe09Njq9amLCuxgB6XHrNyTpm3qGPZOCd/G/v0Z
5DU0leHrzg0=
=e9e/
-----END PGP SIGNATURE-----

--Boundary-02=_FYC4AX8eamBdSmt--
