From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: FIFO files
Date: Wed, 18 Jun 2003 13:40:06 +0200
Message-ID: <3EF04F96.7030406@gmx.net>
References: <20030617162127.GA14124@chepelov.org> <3EEF40B3.6000300@gmx.net> <3EEF42B6.1000409@namesys.com> <3EEF4929.20503@gmx.net> <20030618061721.GA15283@namesys.com> <20030618102057.GA22264@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14601-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030618102057.GA22264@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-15?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Cc: Oleg Drokin <green@namesys.com>, Hans Reiser <reiser@namesys.com>, Cyrille Chepelov <cyrille@chepelov.org>, reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

It might be more appropriate to continue discussing this at linux-fsdevel=
=2E

Ragnar Kj=F8rstad wrote:
> On Wed, Jun 18, 2003 at 10:17:21AM +0400, Oleg Drokin wrote:
>=20
>>Hello!
>>
>>On Tue, Jun 17, 2003 at 07:00:25PM +0200, Carl-Daniel Hailfinger wrote:=

>>
>>>Yes, but if I understood Cyrille correctly, her/his(?) needs should be=

>>>completely satisfied by sparse files.
>>>One process can append records at the end, and one other process can r=
ead
>>>records from the beginning of the file, marking the read data empty. T=
he
>>
>>Hm, I am sorry, but this part is unclear.
>>I do not remember any API to create holes in existing files in place of=
 already
>>present data.
>=20
>=20
> There isn't one.
>=20
> XFS uses an ioctl to punch holes, dm_punch_hole, but it's prototype is
> specific to XDSM.
>=20
> Once multiple filesystems implement the same functionality it makes sen=
se=20
> to have a common interface - maybe a new entry in struct
> inode_operations, and a corresponding systemcall?
>=20
> Something like:
> int punch_hole(const char *path, off_t offset, size_t len);
> int fpunch_hole(int fd, off_t offset, size_t len);

make_hole or zap_range would be alternative names.


> The reader of the file would have to punch the holes after reading the
> data. IMHO punch_hole should not "move" the contents of the file, so th=
e
> data is still available at the same offsets. If one rather would like
> the data to be available at the beginning of the file at all times
> something else is needed, maybe:
>=20
> int truncate_start(const char *path, off_t offset);
> int ftruncate_start(int fd, off_t offset);
>=20
> that truncates the beginning of the file, moving the data from pos
> offset to pos 0.
>=20
>=20
> But punch_hole is much more generic, and could be useful in cases like
> HSM and others. Basicly I think punch_hole is just something missing
> from the linux VFS - logically it should be there. It should be
> relatively easy to implement on all filesystems supporting sparse files=
,
> as the end result is the same.
>=20
> Truncate_start is another beast. One some filesystems like ext2/3 it
> would not be possible to implement it effectively for large files, and
> there are problems with offsets that are not multiple of the blocksize.=



Regards,
Carl-Daniel

