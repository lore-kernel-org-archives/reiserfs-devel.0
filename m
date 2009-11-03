From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: BUG? a suspected race bug at check_journal_end()
Date: Tue, 3 Nov 2009 15:27:42 +0200
Message-ID: <20091103132742.GA2356@localdomain.by>
References: <2014bcab0911030508s5fe0ae8dvde4631108d8eb2b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:received:date:from
         :to:cc:subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=6W/jZUS9pS49f7j+NyBB7exBbsEp4lq7FZrsmqnpccY=;
        b=igTHDvZrUXqGK5qZqn3gC4n2hXssM9hMfbyPuD8V2s2RuDXxxWt8/OtIhiM8FucDCs
         sx+BuvRiy7RvQg30eSFu1+/VdKC7f96BoTBcxyK6gzAv8KmHHuKaof3uM62vf1mcZ9oH
         UdU9Btv6sgT+cy8YTLW0xNvZ9utoZU5/W+1x8=
Content-Disposition: inline
In-Reply-To: <2014bcab0911030508s5fe0ae8dvde4631108d8eb2b@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: =?utf-8?B?7ZmN7Iug?= shin hong <hongshin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On (11/03/09 22:08), =ED=99=8D=EC=8B=A0 shin hong wrote:
> Hello. I am reporting atomic instructions usages
> which are suspected to be misused in reiserfs/journal.c
> of Linux 2.6.31
>=20
> I do not have much background on reiserfs
> so that I am not certain whether it is correct or not.
> But I hope this report is helpful. Please examine the code.
>=20
> In check_journal_end(), there are following codes:
>=20
>     if (atomic_read(&(journal->j_wcount)) > 0) {
>         atomic_dec(&(journal->j_wcount)) ;
>=20
>=20
> It first checks journal->j_wcount and then increments its value by one.
>=20
> If a function which changes journal->j_wcount executes concurrently
> for the same journal->j_wcount, race condition might be possible.
>=20
> I think it would be better to combine two atomic operations
> into one atomic operation (e.g. atomic_dec_and_test)
>=20

Hello,
Isn't it performed on locked journal?

journal.c:3973:
        lock_journal(sb);
        ...
 =20
 =20
        Sergey
--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iJwEAQECAAYFAkrwL84ACgkQfKHnntdSXjRSzAP+O597LxXUhsygXvgOj9RaD54U
THUWKrLGwfghqyTgTWlH0Uuob/nEC9C8ZMuLktxEg4vCVi/EXemoI7iHs3ju9Jl9
pjZAi6wysYcgCBv4sp0AnuYlIehIJn+6beq3GxpVEvZ/v9sWHo9RPvXmSBb0HPWf
nEUyPq3fX+dQDScO5gc=
=AVub
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
