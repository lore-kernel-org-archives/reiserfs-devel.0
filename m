From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 status (correction)
Date: Fri, 21 Jul 2006 17:45:34 -0500
Message-ID: <44C1590E.7020401@slaphack.com>
References: <44BFFCB1.4020009@namesys.com> <44C043B5.3070501@slaphack.com> <44C093D2.1040703@namesys.com> <1153514509.6659.41.camel@ipso.snappymail.ca> <44C141C4.1030802@slaphack.com> <1153517853.6659.56.camel@ipso.snappymail.ca> <20060721222917.GA15944@wintermute>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29119-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060721222917.GA15944@wintermute>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Andreas_Sch=E4fer?= <gentryx@gmx.de>
Cc: reiserfs-list@namesys.com

Andreas Sch=E4fer wrote:
> On 14:37 Fri 21 Jul     , Mike Benoit wrote:
>> No Linux file system that I'm aware of has a defragmentor, but they DO
>> become fragmented, just not near as bad as FAT32 used to when MS created
>> their defragmentor.
>=20
> Forgotten ext2? ;-) Funny thing: If your ext3 got too fragmented:
> convert it back to ext2, defrag and reconvert it again to ext3. All of
> this can be done "in place", i.e. without moving the data to other
> partitions etc.

Well, I know an ext3 partition can be mounted, unchanged, as ext2.  Of=20
course, you had to cleanly unmount as ext3 first, and make sure you=20
cleanly mount/unmount as ext2 before you try to mount as ext3 again...

Question, then:  Can the ext2 defrag work on a raw ext3 partition,=20
without having to convert it first?
