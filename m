From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- how to grab the space?
Date: Fri, 01 Aug 2014 02:16:26 +0400
Message-ID: <9580367.jIyNAsIfmQ@intelfx-laptop>
References: <3405506.BC0S4TX54B@intelfx-laptop> <53DABD4E.1000905@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart9326847.BEc66WCWvH"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=Ti7RkxFS3WKjkU/Z+VU6vzMKxaOp6WCqz/dxivTZEv4=;
        b=BdgJfzSQDlQTfXQrcvlYK7S9p6fd8LFhmmyKJxPhtcQvsEucu1iRArnNj9b6dcQTiQ
         XSEBAE6SDp1SIS6ZWURzr0+v6/hL7YJvZiUlaTeQFJ03+8cm+uQEBlbMenR5B9f8wgvk
         E/TNMIALJsbVfwXVq8wIHSjEyVnIF5RW2LYHB/c8zWLQc5F55uGZLUQ+390kqQ+rqIJ0
         4RDjTbSspdOzVm3hDOVN06H6ulHCCE2FLRe9YgpSN9GUe6SH2zJQDpUOVABom2iensO5
         /iHgt6fhp0PqG5xBqKgoBhiJFKkz7e932D2zjqZe1CnOKC9BNXEHmGV/qrf0ofJ9aYJ/
         TEUQ==
In-Reply-To: <53DABD4E.1000905@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart9326847.BEc66WCWvH
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Friday 01 August 2014 at 00:03:58, Edward Shishkin wrote:=09
> grab_space() is only for processes which require disk space (includin=
g
> wandered blocks). For example ->read() modifies a superblock (atime),=

> which should be written via journal. So ->read() grab 1 block, etc.
>=20
> As to FITRIM ioctl: I don't think it needs to reserve disk space at a=
ll:=20
> it will
> issue only discard requests.
>=20
> Edward.

OK. But it still needs to allocate space (even if just to deallocate it=

shortly), which means that someone could get ENOSPC while the discard i=
s in
progress, and this ENOSPC will come from the allocator itself.

Do you have any ideas on how to do it gracefully?

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /

>=20
>=20
> On 07/31/2014 10:47 PM, Ivan Shapovalov wrote:
> > ...and here is volume 2 of my neverending question series :)
> >
> > A stub ioctl, placed as I described, seems to work and log a warnin=
g each time
> > I invoke `fstrim` on anything mounted.
> >
> > Now on to space allocation. This seems pretty easy in the first app=
roximation:
> > reiser4_alloc_blocks_bitmap() seems to do what's needed, finding th=
e nearest
> > free extent, not the biggest one. So we could just call reiser4_all=
oc_blocks()
> > plus reiser4_dealloc_blocks(BA_DEFER) repeatedly, while allocations=
 succeed.
> >
> > However, I suppose we need to grab all free space before proceeding=
. There is
> > no primitive for grabbing all free space, so we need to read block =
counters,
> > calculate amount of space to grab and then call reiser4_grab_reserv=
ed()
> > (as we want to allocate everything, including the reserved space. T=
his creates
> > two problems (as I see it):
> > - there is a race between reading block counters (under sb spinlock=
) and
> >    performing the grab (which takes the spinlock on its own);
> > - if anything will try to grab space during discarding, it will get=
 an ENOSPC,
> >    while it's better to make the process wait until discarding is c=
ompleted.
> >
> > I'm not sure whether the last problem really exists (there is BA_CA=
N_COMMIT,
> > but I don't know whether is it used consistently where possible).
> >
> > Could you explain these things?
> >
> > Thanks,
> 
--nextPart9326847.BEc66WCWvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPawDoACgkQxUKljSIMAnDhcwD8DcjsquguwliFTVa7+uKNI4aw
PkMbHngdK6Na1E3vTngBAOHi4gva2Cu7vAFI6AZla1ULmOEEUlcoUb3o0fd3A0uh
=8p4I
-----END PGP SIGNATURE-----

--nextPart9326847.BEc66WCWvH--

