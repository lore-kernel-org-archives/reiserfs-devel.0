From: Volker Armin Hemmann <volkerarmin@googlemail.com>
Subject: Re: reiser4+2.6.38.6 broken?
Date: Mon, 16 May 2011 23:12:51 +0200
Message-ID: <4520233.UGogC23bit@localhost>
References: <37304792.ap5uy0yJeJ@localhost> <1725025.DC6atdjbiy@localhost> <4DD18A02.3090304@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:from:to:subject:date:message-id:user-agent
         :in-reply-to:references:mime-version:content-transfer-encoding
         :content-type;
        bh=eiHvjpaarUJlQuxwHneJELrvVhVPUCZRlTh7POY4vJY=;
        b=t35Ri7w21qK6W3tHOnnW/i1VhhgsR6yUjlcLhHXOvymm0eA78pjQpqALvl0CQnUdnp
         q0gST5dAdT1uz/fnw43aUlTHVH14oVGLMmFAE7YFavuBwRrjU2HOqoMRv1aoQTJmVuwr
         RRBML6rreVVcoDZCOsYzwzoEKfYky3KrIbkSQ=
In-Reply-To: <4DD18A02.3090304@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

On Monday 16 May 2011 22:33:06 you wrote:
> On 05/16/2011 10:20 PM, Volker Armin Hemmann wrote:
> > On Monday 16 May 2011 22:16:11 you wrote:
> >> On 05/16/2011 09:55 PM, Volker Armin Hemmann wrote:
> >>> Hi,
> >>>=20
> >>> I have several r4 partitions, all with cryptcompress.
> >>>=20
> >>> I tried 2.6.38.x6 a few hours ago - after 3h I looked at dmesg an=
d
> >>> it
> >>> was
> >>> swamped with error messages and tracebacks. Sadly I tried to run
> >>> fsck
> >>> before saving dmesg - and the box froze completely.
> >>>=20
> >>> I am now back to 2.6.36.4. fsck is running on one of the partitio=
ns.
> >>> Meanwhile I see tons of this:
> >>>=20
> >>> [  153.379751] reiser4[kuiserver(2649)]: reiser4_inflate_cluster
> >>> (fs/reiser4/plugin/file/cryptcompress.c:1136)[edward-1460]:
> >>> [  153.379756] WARNING: Inode 2975012: disk cluster 27 looks
> >>> corrupted
> >>> [  163.301372] reiser4[kuiserver(2669)]: dc_check_checksum
> >>> (fs/reiser4/plugin/file/cryptcompress.c:969)[edward-156]:
> >>> [  163.301374] WARNING: Bad disk cluster checksum 799645291, (sho=
uld
> >>> be
> >>> 546616041) Fsck?-2)
>=20
> [...]
>=20
> >>> known problem with 2.6.38.X?
> >>=20
> >> Yes, this is known and old problem.
> >> This is not specific to compression.
> >=20
> > ok, and how serious?
>=20
> Serious for what?
> Reiser4 in the current state is not suitable
> for production file servers. For home desktop -
> may be..
>=20
>=20
>   I am going to let fsck loose as soon as the first
>=20
> > partition is done. Should I prepare for some major cf?
>=20
> I _can_ reproduce this problem.
> I don't need any extra-stuff.

and I don't expect you to.

well, fsck worked.

The partition was md1 - which means /var, which also houses portage tre=
e on my=20
setup and some other vital stuff.

The first run with --build-fs failed with an 'unknown plugin id' error=20
finishing with an 'operational error'.
Secound run with --build-fs was successfull with only some files in=20
lost+found. The important stuff seems to be there.

R4 worked for me fine for a long time. But it seems like I should migra=
te the=20
more important partitions away from it. How is reisefs doing at the mom=
ent?

Gl=FCck Auf,
Volker
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
