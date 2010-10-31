From: Volker Armin Hemmann <volkerarmin@googlemail.com>
Subject: Re: Bug with KDE 4.5 and reiser4 2.6.34
Date: Sun, 31 Oct 2010 15:02:34 +0100
Message-ID: <201010311502.34199.volkerarmin@googlemail.com>
References: <201010310406.07767.volkerarmin@googlemail.com> <201010311408.34589.volkerarmin@googlemail.com> <4CCD721F.3010908@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=JwHQlSBO1BQjTXVUzsW5ccNMS9dh+nVdngXvJJ5aXrw=;
        b=hL4l2+a+UmBNAkWD80e/qW5YO5G489Eyfvb4GVgIMJb4s+OB+I9jNy+jrK2kL2aEkQ
         6Ce/vKOMlLzrt+SwJmxyRnPZ9EQd/5hdE5ty/oQhMK+Aa5w+7kuY7cLKRAQ3+6E3gVVA
         h8m6vp6L+301Hm6wn5cq34O6TA47tqZReI9AU=
In-Reply-To: <4CCD721F.3010908@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

On Sunday 31 October 2010, you wrote:
> Volker Armin Hemmann wrote:
> > On Sunday 31 October 2010, you wrote:
> >> could you provide fsck output?
> >=20
> > sure, here it is:
> >=20
> > *******************************************************************
> > This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> > *******************************************************************
> >=20
> > Fscking the /dev/sda1 block device.
> > Will check the consistency of the Reiser4 SuperBlock.
> > Will build the Reiser4 FileSystem.
> > Continue?
> > (Yes/No): Y
> > ***** fsck.reiser4 started at Sun Oct 31 13:42:25 2010
> > Reiser4 fs was detected on /dev/sda1.
> > Master super block (16):
> > magic:          ReIsEr4
> > blksize:        4096
> > format:         0x0 (format40)
> > uuid:           9d3a5406-15b9-4a95-95e3-256d1571408d
> > label:          <none>
> >=20
> > Format super block (17):
> > plugin:         format40
> > description:    Disk-format plugin.
> > version:        0
> > magic:          ReIsEr40FoRmAt
> > mkfs id:        0x154b6487
> > flushes:        0
> > blocks:         15630416
> > free blocks:    4275401
> > root block:     7434018
> > tail policy:    0x2 (smart)
> > next oid:       0xd30db
> > file count:     712485
> > tree height:    5
> > key policy:     LARGE
> >=20
> >=20
> > CHECKING THE STORAGE TREE
> >=20
> >         Read nodes 3162120
> >         Nodes left in the tree 3162120
> >        =20
> >                 Leaves of them 3125028, Twigs of them 36573
> >        =20
> >         Time interval: Sun Oct 31 13:42:25 2010 - Sun Oct 31 13:43:=
39
> >         2010
> >=20
> > CHECKING EXTENT REGIONS.
> >=20
> >         Read twigs 36573
> >         Time interval: Sun Oct 31 13:43:39 2010 - Sun Oct 31 13:44:=
01
> >         2010
> >=20
> > LOOKING FOR UNCONNECTED NODES
> >=20
> >         Read nodes 0
> >         Good nodes 0
> >        =20
> >                 Leaves of them 0, Twigs of them 0
> >        =20
> >         Time interval: Sun Oct 31 13:44:02 2010 - Sun Oct 31 13:44:=
02
> >         2010
> >=20
> > CHECKING EXTENT REGIONS.
> >=20
> >         Read twigs 0
> >         Time interval: Sun Oct 31 13:44:02 2010 - Sun Oct 31 13:44:=
02
> >         2010
> >=20
> > INSERTING UNCONNECTED NODES
> >=20
> >         Twigs: read 0, inserted 0, by item 0, empty 0
> >         Leaves: read 0, inserted 0, by item 0
> >         Time interval: Sun Oct 31 13:44:02 2010 - Sun Oct 31 13:44:=
02
> >         2010
> >=20
> > CHECKING THE SEMANTIC TREE
> >=20
> >         Found 712485 objects.
> >         Lost&found 8 objects.
> >         Time interval: Sun Oct 31 13:44:02 2010 - Sun Oct 31 13:53:=
58
> >         2010
> >=20
> > CLEANING UP THE STORAGE TREE
>=20
> Ah,
> it was you, who didn't provide me access
> to investigate unexpected fsck aborts?...
>=20
> Edward.

I put -L fsck.log which was empty and piped to stout.log which was the =
stuff I=20
sent you.
I was the one who already had problems with fsck not fixing problems. T=
he good=20
news: this is a different partition, so if you need metadata I could se=
nd it to=20
you.

Gl=FCck Auf,
Volker
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
