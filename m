From: "Burnes, James" <james.burnes@gwl.com>
Subject: RE: ReiserFS to Reiser4 Migration
Date: Tue, 22 Feb 2005 12:34:24 -0700
Message-ID: <DC09DB522D858648AC430F0DBC51F6320800C3@its-exmail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Can Sar <csar@stanford.edu>, reiserfs-list@namesys.com

Can,

I don't believe there is such a utility, nor would it be particularly
useful in serious environments.  Here is why:

1. In-place file system conversion is complex, extremely time consuming,
hard on your drive and error prone.  Just think about the algorithms
required.  What would happen in the event of a power failure? During
partition or filesystem resizing?
2. You would never attempt this type of operation on important data
without backing it up first.
3. If you've already backed up your data, why would you want to convert
in-place?  Just wipe the drive, reformat as reiser4 and do a restore.
4. If you haven't backed up 1TB of data, is it because the data is
easily available somewhere else (goto step 3)?
5. If you haven't backed up and the 1TB of data is not replaceable,
please turn the system over to a real system administrator while you
still can.

BTW: I started responding by writing the high-level pseudo-code for
in-place conversion, but it quickly became obvious that an efficient
implementation of that algorithm was not trivial.

BBTW: Maybe even a better idea.  Purchase a hard drive equal in size to
your current one.  Install it, initialize it under LVM, format it with
reiser4 and copy your old filesystem over to reiser4.  Run CRC checks on
the old and new files as a sanity check.  Wipe the old drive, initialize
it under LVM, and format it with reiser4 also.  Tell LVM to create a
mirrored pair with the other drive.  Sit back as you get RAID 1
protection for your hundreds of gigabytes.  Don't forget to snapshot and
backup your new RAID system periodically.

Exercise left to the reader: Without looking up the known algorithms on
the net, design a highly efficient and safe in-place converter that will
work for any two arbitrary filesystems.  Assume the destination
filesystem is growable and the source filesystem is shrinkable.

My apologies to the Reiser engineers if this all seems trivial.

j.burnes



 =20
> -----Original Message-----
> From: Can Sar [mailto:csar@stanford.edu]
> Sent: Monday, February 21, 2005 3:15 PM
> To: reiserfs-list@namesys.com
> Subject: ReiserFS to Reiser4 Migration
>=20
> Hi,
>=20
> I've desperately been looking for a tool to migrate from ReiserFS to
> Reiser4 with no luck, I searched on the web for several hours but only
> found instructions to back up to another device and then mkfs on the
> old ReiserFS partition. Are these sources really right or is there
such
> a tool somewhere? What if I want to upgrade a volume of a Terabyte in
> size, would I really need to find a backup volume with that much
space?
> Is such a program in the works then?
>=20
> Thank you very much for your help,
> Can Sar

