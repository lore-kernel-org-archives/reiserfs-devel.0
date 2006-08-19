From: Devils-Hawk <devilshawk@aon.at>
Subject: [vs-1288]: during qemu disk io
Date: Sat, 19 Aug 2006 19:19:32 +0200
Message-ID: <44E74824.6070600@aon.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29632-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

While qemu was writing to qemu disk-image file, i got:

reiser4 panicked cowardly: reiser4[qemu(8534)]:
init_coord_extension_extent
(fs/reiser4/plugin/item/extent_file_ops.c:1667)[vs-1288]:
Kernel panic - not syncing: reiser4[qemu(8534)]:
init_coord_extension_extent
(fs/reiser4/plugin/item/extent_file_ops.c:1667)[vs-1288]:

gentoo-sources 2.6.17-r5 ( vanilla 2.6.17.8 + gentoo patchset ) with
reiser4-for-2.6.17-3.patch applied.

If you need more information, please feel free to ask and i'll try to
provide it.

Cheers DevH


