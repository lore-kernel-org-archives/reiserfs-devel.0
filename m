From: "Bostjan Skufca @ domenca.com" <bostjan.skufca@domenca.com>
Subject: Re: kernel 2.4.27 reiserfs quotas patch
Date: Tue, 24 Aug 2004 10:46:01 +0200
Message-ID: <200408241046.01649.bostjan.skufca@domenca.com>
References: <cgd0l9$6o0$1@sea.gmane.org> <cgddnf$btk$1@sea.gmane.org> <20040824001923.0b9b282f.lists@mjh.name>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20473-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040824001923.0b9b282f.lists@mjh.name>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On machines where I do not want kernel modules enabled I solved the build=20
problem by modifying file "fs/reiserfs/journal.c". Just comment out the fir=
st=20
line of code like this:

//#define EXPORT_SYMTAB

Works for me without problems...=20

Christian: What is all about that fsync() bug? Is it serious? Are there any=
=20
special conditions to be met to actually see the results of it?

Regards,
Bostjan


On Tuesday 24 of August 2004 00:19, Milan Holz=E4pfel wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On Mon, 23 Aug 2004 13:39:27 -0500
>
> "Jeff Meyer" <jeffm@andersonlabs.com> wrote:
> > Problem fixed!!! You need to enable loadable module support selected in
> > the kernel.  Sorry!!!
>
> I'd rather say that it's a bug that these patches require kernel modules
> enabled... you just need to remove a #include line and it compiles fine
> without modules enabled.  (At least the time I came to it, but I think
> it were these 2.4.25 patches.  I also think I mailed the maintainer,
> probably Jeff, about it but I never got a reply IIRC, and I didn't care
> about it any more because I rarely use kernels without modules.)
>
> Regards,
> Milan
>
>
> - --
>
>                    Milan Holz=E4pfel alias jagdfalke alias jag
>
> Meine eMail-Adresse ist hier zu              You can find my eMail-address
>                       finden:                here:
> Kontaktinfos sowie                                   Contact infos as well
> as =D6ff GnuPG-Schl=FCssel    <URL:http://con.mjh.name/>    GnuPG Public =
Key
> GnuPG Fingerabdruck     4C8A 5FAF 5D32 6125 89D1     GnuPG Fingerprint 0C=
E5
> DB0C AF4F 6583 7966
>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
>
> iD8DBQFBKm1r2wyvT2WDeWYRAvpFAKDnqPsdY33jT4IQpV2MjPJOzP7WowCfT5A9
> nqQMIpJdewJnWG5iKHKwdNs=3D
> =3DaJV2
> -----END PGP SIGNATURE-----

