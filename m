From: Serkan Kaba <serkan@gentoo.org>
Subject: Re: File copy problems kde 4.5 to 4.6.1 with reiser4 2.6.38
Date: Wed, 06 Apr 2011 07:35:54 +0300
Message-ID: <4D9BEDAA.6020400@gentoo.org>
References: <201103090918.47762.berny@dwami.com> <4D7774D7.3030908@dwami.com> <4D7FA356.1000309@gmail.com> <201104041142.42496.berny@dwami.com> <BANLkTimmZ4GDX2-K=TaNLOMUg8+C6uyWHQ@mail.gmail.com> <4D9B9875.60400@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D9B9875.60400@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-04-2011 01:32, Edward Shishkin wrote:
> On 04/05/2011 09:36 PM, Giuseppe Argentieri wrote:
>> Hi
>>
>> I've also the same problem with nautilus 2.32 (kernel 2.6.38.2)
>>
>> Cheers,
>>
>> Giuseppe
>>
>>
>> 2011/4/4 berny=AE<berny@dwami.com>
>>>
>>> Dear Edward, I tried the new patch for the 2.6.38 but the bug is
>>> still there so no file copy using
>>> kde file managers,
>=20
> Hello.
>=20
> I still have problems with reproducing this issue.
>=20
> Copy of files built of tails (<16K) and extents via
> splice(2) works fine for me. Unfortunately I don't
> have kde and a time to install it in the near future.
> Is it reproducible with gnome managers?
>=20
> Thanks,
> Edward.
>=20
>=20
>  files are still empty till unmount.
>>>
>>> Thanks, Paolo
>>
>>
>> --=20
>>
>> Giuseppe Argentieri<joe.silver@gmail.com>
>> --=20
>> To unsubscribe from this list: send the line "unsubscribe
>> reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
> --=20
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
As we already discussed in ML, this is already an issue for GNOME since
2.30, and I'm using a patched (a patch that doesn't use splice for
reiser4 targets) version of glib to workaround this problem.
- --=20
Sincerely,
Serkan KABA
Gentoo Developer
Java/GNOME developer
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk2b7aoACgkQRh6X64ivZaJ00QCePjUDCPk1gOTvN/umBok2pkYT
NtYAn0puWyCncRdoTpyawbOFQm+r2WTI
=3DHA2E
-----END PGP SIGNATURE-----
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
