From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: Real status of ReiserFS4?
Date: Wed, 4 Oct 2017 18:53:18 +0200
Message-ID: <CADW=+3nasdYX8+-p3ZFc5Fk3gQf2mVcfdJh+p8gHOYiqg8Lt6w@mail.gmail.com>
References: <F9C551623D2CBB4C9488801D14F864C60154C6BE9F@ex-mb1.corp.adtran.com>
 <2027a1de-0aac-97f2-40f0-401e585e38ae@gmail.com> <F9C551623D2CBB4C9488801D14F864C60154C6C4FE@ex-mb1.corp.adtran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NOZ2etLEojmWb/2uEGHJeODT1UtXZjbMZO3pJxMPsXk=;
        b=AdkbGr2dtVzRp8NnMWTlpFcfn3BxVL9cYyRi9SubrnQ82Jv0OPOjDyuJHtKlyzeMlK
         Oio4Q2gqhyAWeojjRJYpVHf4rRyfkM40NB0IOXUlYuzCD6IOWHRfLgsaF7jIHE9i9hzT
         K8OLSbp8R9uAVZZL75RIRtzAbA8sbAQg7HVlzjXrauUj0VsZO371CF6a3JgnjHkbOEqA
         5u9bXbHPaP3749SbuT0H2bVUfQ3GGK7cgTEhuTPWYRVZlfL5wpzf7fHQHPK7vcnH7bA8
         jFzi2WQla7Wg1gxcJ7KVdVyGsdaCYmtLImc6NoZhSMc9m6oMssFpIbN+3zM1EiyFaWoa
         TZwQ==
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C60154C6C4FE@ex-mb1.corp.adtran.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>

On Wed, Oct 4, 2017 at 5:46 PM, ANDY KENNEDY <ANDY.KENNEDY@adtran.com> wrot=
e:
>
> > Basically, it is stable (as of the latest stuff release). However,
> > I would recommend reiser4 only for personal needs, not for production
> > (corporate use). The latter requires some work to be done in active
>
> Yeah, that was what I was told in the late 90's when I put an early
> rev of ReiserFS on a production server with a whopping 75GB of storage.
>
> Eventually, after about the 5 power loss on the system, it corrupted
> that partition.  Reiserfs-progs was able to recover it, though.  So,
> is this one of those cases where if I put it on a production system it
> will work great as long as I don't improperly drop power on it?
>
> I really like the stability of ReiserFS over everything else I've used.

I use R4 in few servers that over time had power losses. I never had
problems after it. Never a slightest error.
I had corruptions under following circumstaces and you can read about
it in the archives of this m-l:
1. OOM;
2. Years ago on disk full, but it was fixed since;
3. Kernel panic because of some drivers problems.
4. I had some problematic 10GB qcow2 WinXP image that after few years
developed an error. Dunno if it was R4 related.

Corruptions were always in the form of lost names ad paths of
files/directories, but the data in them was always there, in
lost&found.

I still exclusively use R4 with compression for everything except
video files and virtual machine images. For that I use R4 without
compression.

I would recommend you do the same as there are lot of upsides to
cryptocompress on R4 and CPU overhead is small as it's LZO
compression.

I maintaingGentoo R4 FAQ and I recommend that you read it
https://forums.gentoo.org/viewtopic-t-706171.html
>
>
> > collaboration with administrators of production systems. Reiser4 has a
>
> I own all of these systems.  Most are built from scratch.
>
> > number of open tickets/bugreports, but all of those problems are hard
> > reproducible. Every sophisticated file system has a list of such
> > issues, though.
>
> Yeah, hence the question above.
>
> >
> > It is really hard to corrupt a reiser4 partition in a way that fsck
> > will refuse to fix it. Nevertheless, I wouldn't recommend to use too
> > large partitions. The smaller partition, the larger chances, that I'll
> > take a look at it, if any problems with fsck.
>
> I have a back-up copy (actually several back-up copies).  And, this is
> data that doesn't change that much, so I can recover fairly easily.


>
>
> > Also, keep in mind that
> > intelligent compression (default mode) is not optimal for large media-
> > files (see https://reiser4.wiki.kernel.org/index.php/Reiser4_Howto for
> > details).
>
> With a 15TB drive, I'm not worried about compression.  That, IMO, would
> be a performance hit anyway.

It helps IOPS tremendously especially on small files as it packs them toget=
her.
It's not about size of IO it's about IOPS.


>
>
> >
> > Reiser4 is better in all items (performance, features, implementation,
> > maintainability, etc) than its predecessor ReiserFS(v3).

This is true.

>
> >
> > Thanks,
> > Edward.
>
> Thanks Edward!  I'll give ReiserFS4 a shot!
>
> Andy

Du=C5=A1an
>
> >
> > On 10/04/2017 12:29 AM, ANDY KENNEDY wrote:
> > > All,
> > >
> > > I've searched around on the web a bit and found various folks spoutin=
g
> > > off about Reiser4 here and there.  I am about to reinstall a system a=
nd
> > > want to choose the right filesystem.  I read some report about Reiser=
FS
> > > v3 not being multi-thread safe and that ext4 ran circles around it.  =
I
> > > was disappointed at the hanging I was getting on ext4, so switched ba=
ck
> > > to ReiserFS and got more consistent high performance.  I have a power=
-
> > > house system built with a large HW Raid 5 drive and want to reformat
> > > and repartition that sucker up.  In your opinion, what is the best
> > > filesystem to use right now?  Keeping in mind that I do low-level
> > > driver work for my company and am used to hacking around in the kerne=
l,
> > > so patching a kernel doesn't frighten me at all.
> > >
> > > It looks like Reiser4 still isn't in the mainline kernel... which is
> > > disappointing to me that we developers also allow political
> > > bureaucracy to shadow over potentially better solutions.  So, what is
> > > the sate of Reiser4 and should I go with that for my 16-core system,
> > > stick with Reiser3, or grab hold to ext4?
> > >
> > > Thanks for your opinion in advance!
> > >
> > > Andy
> > >
> > > --
> > > To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
