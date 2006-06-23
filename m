From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Subject: Re: [BUG] nikita-1481, nikita-717 and nikita-373 here and there
Date: Fri, 23 Jun 2006 12:11:28 +0200
Message-ID: <op.tblfxehpd4os1z@localhost>
References: <449B2D1D.9000507@iki.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28845-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <449B2D1D.9000507@iki.fi>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: Jussi Judin <jjudin+reiser@iki.fi>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Dnia Fri, 23 Jun 2006 01:51:57 +0200, Jussi Judin <jjudin+reiser@iki.fi> =20
napisa=B3:

> I was using some Debian patched 2.6.16 kernel and reiser4-2.6.16-1 patch =
=20
> for that and suddenly got the error messages attached. The java program  =

> in those error messages is doing a huge amount of writes all the time =20
> and probably in many threads at the same time.
>

I'm using 2.6.16 + reiser4-2.6.16-4 patch and I just got those errors =20
while running emerge --sync on gentoo:

reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9583)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[rsync(9588)]: traverse_tree (fs/reiser4/search.c:690)[nikita-1481]:
WARNING: Too many iterations: 128
reiser4[rsync(9588)]: traverse_tree (fs/reiser4/search.c:690)[nikita-1481]:
WARNING: Too many iterations: 256
reiser4[rsync(9588)]: traverse_tree (fs/reiser4/search.c:690)[nikita-1481]:
WARNING: Too many iterations: 512
reiser4[rsync(9588)]: traverse_tree (fs/reiser4/search.c:690)[nikita-1481]:
WARNING: Too many iterations: 1024
reiser4[rsync(9588)]: traverse_tree (fs/reiser4/search.c:690)[nikita-1481]:
WARNING: Too many iterations: 2048
reiser4[rsync(9588)]: traverse_tree (fs/reiser4/search.c:690)[nikita-1481]:
WARNING: Too many iterations: 4096
reiser4[rsync(9588)]: traverse_tree (fs/reiser4/search.c:690)[nikita-1481]:
WARNING: Too many iterations: 8192
reiser4[rsync(9588)]: traverse_tree (fs/reiser4/search.c:690)[nikita-1481]:
WARNING: Too many iterations: 16384
reiser4[rsync(9588)]: traverse_tree (fs/reiser4/search.c:690)[nikita-1481]:
WARNING: Too many iterations: 32768
reiser4[rsync(9588)]: traverse_tree (fs/reiser4/search.c:690)[nikita-1481]:
WARNING: Too many iterations: 65536
reiser4[rsync(9588)]: traverse_tree (fs/reiser4/search.c:690)[nikita-1481]:
WARNING: Too many iterations: 131072
reiser4[rsync(9588)]: traverse_tree (fs/reiser4/search.c:690)[nikita-1481]:
WARNING: Too many iterations: 262144
reiser4[rsync(9588)]: traverse_tree (fs/reiser4/search.c:723)[nikita-373]:
WARNING: reiser-2018: Too many iterations. Tree corrupted, or (less =20
likely) starvation occurring.: level: 5, lock_level: 1, stop_level: 1 =20
lock_mode: write, bias: exact

After running fsck.reiser4 --fix the only corruption found was error in =20
amount of free space
