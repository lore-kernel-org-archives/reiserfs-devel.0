From: David Masover <ninja@slaphack.com>
Subject: Re: what if I touch a reiser4 partition and ...
Date: Sat, 27 Aug 2005 02:04:12 -0500
Message-ID: <4310106C.2060401@slaphack.com>
References: <2b973fa605082622442afd3040@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25657-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2b973fa605082622442afd3040@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Miguel_Ernesto_P=E9rez_Cabrera?= <solohayuno@gmail.com>
Cc: reiserfs-list@namesys.com

Miguel Ernesto P=E9rez Cabrera wrote:
> Hello, group.
>=20
> I was wondering If after a sfdisk resize of a disk, and leaving the
> reiser4 partitition unchanged, Is it posible to remount the reiser4
> partition?
>=20
> I'm not sure, but for what I see, the answer is no... but I would like
> to be desagree with this. Please!
>=20
> This was how my disk looks like before resizing...
> Disk /dev/hdd: 238216 cylinders, 16 heads, 63 sectors/track
> Units =3D cylinders of 516096 bytes, blocks of 1024 bytes, counting from 0
>=20
>    Device Boot Start     End   #cyls    #blocks   Id  System
> /dev/hdd1   *      0+   2080    2081-   1048823+  83  Linux
> /dev/hdd2          0       -       0          0    0  Empty
> /dev/hdd3          0       -       0          0    0  Empty
> /dev/hdd4       2081  238215  236135  119012040   85  Linux extended
> /dev/hdd5       2081+  85301   83221-  41943383+  83  Linux
> /dev/hdd6      85302+ 120670   35369-  17825975+  83  Linux
> /dev/hdd7     120671+ 122261    1591-    801863+  82  Linux swap / Solaris
> /dev/hdd8     122262+ 123712    1451-    731303+  83  Linux
> /dev/hdd9     123713+ 154920   31208-  15728831+  83  Linux
> /dev/hdd10    154921+ 238215   83295-  41980679+  83  Linux
>=20
> I was looking a way to delete hdd6, hdd8, hdd9 and hdd10, put hdd7
> (swap) at the end and increment hdd5 just before swap partition.
>=20
> but after doing this, and mounting the reiser4 partition, I just get
> an empty filesystem :s, why?
>=20
> All I have done is to change partition size with sfdisk and run
> mkfs.reiser4 on hdd1 hdd5 and run fsck on both. Do I lose my data? or
> it still missing arround there?

Um, when you run mkfs.reiser4, it makes a new filesystem.  New.  As in
empty.  As in format.  The DOS/NT "FORMAT" command is the equivalent of
"mkfs.msdos", "mkfs.vfat", and/or "mkfs.ntfs".

mkfs =3D=3D format

You wanted to keep your data from hdd5, right?  There is a fsck option
that might help now, if you haven't touched the disk much, but you've
done just about the equivalent of an "rm -rf /".

I hope you didn't have anything on hdd6, 7, 8, 9, or 10, because
deleting them all and resizing hdd5 would not automatically cause hdd5's
filesystem to have the contents of all the other partitions.  If you
need stuff from there, better restore your old partition table and hope
that none of them have been touched much -- I'm not sure if you'll have
to fsck or just backup very carefully.

And last I checked, reiser4 doesn't have a resizer -- not even a way to
grow the FS.  So your correct course of action would probably have been
to back everything up, resize hdd5, mkfs, and then restore.  If you
didn't have a lot of data, you could probably have made the new swap
device, made a filesystem on it, copied hdd5 to that, resized/formatted
hdd5, copied stuff back from the temporary swap partition, change its
partition type to 82 (swap), and mkswap.

But then, if the data is important, you really should have a full backup
solution anyway.  As far as I can tell, your hdd5 is 40 gigs.  100 blank
DVDs are around 20-30 USD now, and a burner is maybe $50.  It would be a
long and tedious process, but that could back up 40 gigs and have a few
discs left over -- and then you'd at least have one backup.  Or, you
could probably actually get a 40 gig drive for the same price.

I know you've heard the lecture before, and it's little comfort now, but
backup is cheap.  Data recovery services are expensive.  And data loss
is unacceptible.
