From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: On plugins, on-disk formatting and such
Date: Mon, 12 Apr 2004 17:30:06 +0400
Message-ID: <20040412133006.GA1579@backtop.namesys.com>
References: <20040410100701.GE5229@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17864-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040410100701.GE5229@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus =?koi8-r?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

On Sat, Apr 10, 2004 at 01:07:01PM +0300, Markus T=F6rnqvist wrote:
> First off I'd like to thank the Namesys guys for their excellent work,
> the latest snapshot has been very stable for me, so stable in fact
> that my life is boring because of it ;)
>=20
> I have like a ton of questions so I'll just put them in this mail and
> see which points get replied to. Hopefully all ;)
>=20
> 1) The xattrs issue never got any replies, although I gathered that it
>    would be possible to map xattr calls to the Reiser4 API.
>    Is this fact or fiction? What will the Reiser4 API look like, apart
>    from control files?

xattrs are possible but we have no plans to use them. =20
2 APIs are: pseudo files and reiser4 syscall.

>=20
> 2) Is metadata stored anywhere? If I want to organize all my libs in one
>    fibre, I make it so, I reboot and do I then have to reset the fibration
>    for the directory? Is it possible to have persistency here? Wouldn't
>    a wrong fibration type make the files inaccessible?
>    Is this addressed in the Reiser4 API somehow?

reiser4 is able to store plugin sets (list of plugin ids for the object) as=
=20
a part of the object's stat data.

>=20
> 3) How big are the chances that the on-disk layout will still change?
>    On IRC I've got the impression that the chance is next to none,
>    and I thank you for that!
>    Still, a lot of people are hesitant to try Reiser4 because of this
>    fear. Doing an mkfs is not a small thing and some assurance would
>    surely bring along community testing support.
>=20
> 4) http://thebsh.namesys.com/snapshots/2004.03.26/READ.ME
>    4.1) I have used Reiser4 as my rootfs for a long, long time.
>         Why does the READ.ME say I can't do it?-) I just never mount
>         it read-only, so I don't have to remount it read-write and it
>         just works. Is there something amiss here?
>   =20
>    4.2) What exactly does it mean that CONFIG_REISER4_COPY_ON_CAPTURE
>         is stabler than before? Is it soon safe to configure in?
>         Is it possible for me to test it on only one filesystem or
>         do I risk rootfs (and home directory) stability by trying it
>         out? If I compile it in, what's the best way of testing it?

we still see fs errors if COC enable. they are rare now, but COC is not sta=
ble
yet.

>=20
> 5) If I wanted to write an fs plugin, I gathered that I would not have
>    to mkfs again. Should this not require some persistency in metadata?
>    I also gathered that Hans Reiser is against loadable kernel modules
>    that are in essence filesystem plugins. Is this because a stray
>    rmmod might cause breakage or something else?
>    One of the good things for me in Linux is that I can use honest
>    modules to try something, rmmod, recompile, insmod and I don't
>    think this is any different.
>=20
> 6) I understood there are some NFS issues still left, what other issues
>    are there? Is it possible to have some TODO list on the web so
>    people could guess at what's going on? (BTW, Nikita, that doesn't
>    mean I won't bug you in the future ;)
>=20
> 7) http://namesys.com/benchmarks.html#slow.2004.03.26
>    That is awesome. Could someone give a brief, or rather human-readable,
>    explanation on why Reiser4 refuses to slow down under those loads?
>    Not that I'd find those benchmarks hard to swollow per se, I did
>    see Reiser4 perform superior for myself.
>    But what is the secret? Atomic transactions?

I think it is a feature of delayed block allocation.=20

>=20
> Thanks again for the good work and I hope this brings along some discussi=
on
> more interesting than the metas/ thread!

>=20
> --=20
> mjt
>=20

--=20
Alex.
