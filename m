From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: reiser4: BUG during a backup (sequentially reading the whole
 fs) on 4.9
Date: Sat, 03 Jun 2017 02:21:30 +0300
Message-ID: <1496445690.28911.1.camel@intelfx.name>
References: <1488211296.5395.2.camel@intelfx.name>
                         <f7c80f08-6e89-226b-7914-54d2385aa834@gmail.com>
                         <1488212421.5395.3.camel@intelfx.name>
                         <4a88640c-8d98-1cc0-5713-3abd76abf208@gmail.com>
                         <1496328566.8314.2.camel@intelfx.name>
                         <290631df-dc46-e8ef-041f-c353b7eecf88@gmail.com>
                 <1496339175.12062.1.camel@intelfx.name> <59307242.5010705@gmail.com>
         <1496357947.4940.2.camel@intelfx.name> <5931CC9D.6080801@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-I6WaGIBxYMb+0D+okuMx"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:in-reply-to:references
         :mime-version;
        bh=sH8WpqIyKkfIXBW8IqDjlyvfJq3jdTQ0v5bp3LVkOhU=;
        b=BPd6hkklG+3/io+EX6M1pgKAQdeHnZj/GDjXppMb+NXjqLcjrY5KUq0lCMeJtsBZR8
         KAJ28RItoK3qE3AtJxUaeaCqfpyxF7bFbrcx+qVIDLz6A+1TVixCbJhf+fQEaYlDwFHg
         jksG/gF9EexJltkPXQzsnv3D1kMfyVeNfDDLQ=
In-Reply-To: <5931CC9D.6080801@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>


--=-I6WaGIBxYMb+0D+okuMx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Uh, I don't know exactly which partition is it. Strangely, I could not
reproduce this with a mock-up load (find -exec cat {} \; >/dev/null),
but odds are that it usually happens while reading a half-filled 500GB
partition.

Anyhow, I can put it on my public-facing NAS and give you either a
download link (my uplink is 50 Mbps wide) or ssh access, if you would
be kind enough to have a look at it :)

BTW, if I enable checkpoints in borg (so it saves internal state
periodically) and restart the backup from a checkpoint after the crash,
it always finishes successfully. Does that confirm or refute your
hypothesis?

Thanks,
--=20
Ivan Shapovalov / intelfx /


On 2017-06-02 at 23:37 +0300, Edward Shishkin wrote:
> Alas, can not reproduce it.
> I suspect garbage on the leaf level. For some reasons
> fsck can not detect it (on semantic pass).
> How big is your partition?
> Could you dd it to a file and let me download that file?
>=20
> Thanks,
> Edward.
>=20
> On 06/02/2017 01:59 AM, Ivan Shapovalov wrote:
> > Looking forward to your results.
> >=20
> > And by "looking at the tree" you mean the debugfs output, right?
> >=20
> > Thanks,
>=20
>=20
--=-I6WaGIBxYMb+0D+okuMx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE5N8nvImcx2nJlFGce94XyOTjDp0FAlkx8voACgkQe94XyOTj
Dp18yxAArtrVHDy/Q4gCER+wtpDh4PO/wexOHurm232wCN29wKDA1cLCs6BKHgnM
LwqS/7OLq3UoC5TCcez7rQYmqTKXS9owUHv436PwVMlF6wbOp78HmZGjxCaDo0DF
6ZbV6bo2xjJ7+YsNd8Koqg2AQ38xtMmqAEV+QGfbi+KOtebm+gzPzGlNrhyPeqwe
g7FWfKWoudwxptJrbXPE5Ajtc1YlU8GMhzrjkWkEES0yNlzDD/nEd1/j4AzvLRRh
rn32GICIg8PACFghRHomAgp+bJ2+jOzeBH23t41DSBwLYhKitF9Uk3QIjUu001c9
cq7Zrj4cMwXGXJw4KTiH5CEzOUyJ0bxmt5QRCWjtEwJRhZxz6rvcXX6arKJWwwtd
oPm4Gwdy8ePyq7TJPT2BqPn59XWDcHY3bRtJirGDDDCNBraSK3TgmkjhvN68L+AK
y3HpaUH8/KziUYKiup1z6S+ebSlmnRboE7R1ADudyOKiotIaO8KwUZ5MZrs9flMj
zbPCTeawfz7Ob8uMe30otZ9292/eMCElQ+277Z3AeU6QJCv9ddyIXsbMA7S5TtHg
cPfL4guyXQfZXQOSUDjUe46VAfYwLRelCGsEVkg3gobmliElie47sLlLKPcZVEbF
WMAuUztIF42flpAAJ/PDlLlaAQlZX/Qf4zVfA7mpFY4gozevSyI=
=KMJi
-----END PGP SIGNATURE-----

--=-I6WaGIBxYMb+0D+okuMx--

