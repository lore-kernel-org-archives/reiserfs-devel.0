From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiserfs v3 patches updated
Date: Sat, 10 Apr 2004 18:53:55 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <871xmve96k.fsf@uhoreg.ca>
References: <1081210239.4994.69.camel@watt.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17842-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Using stock 2.6.5, plus Reiser4 patches (which probably shouldn't make a
difference), plus Chris' patches (applied everything from series.linus):

...
  CC      fs/reiserfs/bitmap.o
In file included from fs/reiserfs/bitmap.c:8:
include/linux/reiserfs_fs.h: In function `reiserfs_transaction_running':
include/linux/reiserfs_fs.h:1761: error: structure has no member named `journal_info'
make[3]: *** [fs/reiserfs/bitmap.o] Error 1
make[2]: *** [fs/reiserfs] Error 2
make[1]: *** [fs] Error 2

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

