From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [PATCH] reiserfs v3 fixes and features
Date: Thu, 15 Apr 2004 16:12:36 +0400
Message-ID: <16510.31796.137286.428042@laputa.namesys.com>
References: <1081274618.30828.30.camel@watt.suse.com>
	<1081989006.27614.110.camel@watt.suse.com>
	<874qrmkl43.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17962-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <874qrmkl43.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Hubert Chan writes:
 > On 2.6.5, it still fails:
 > 
 > ...
 >   CC      fs/reiserfs/bitmap.o
 > In file included from fs/reiserfs/bitmap.c:8:
 > include/linux/reiserfs_fs.h: In function `reiserfs_transaction_running':
 > include/linux/reiserfs_fs.h:1752: error: structure has no member named `journal_info'
 > make[3]: *** [fs/reiserfs/bitmap.o] Error 1

Err.. clash with the reiser4 patch, surely.

 > make[2]: *** [fs/reiserfs] Error 2
 > make[1]: *** [fs] Error 2
 > 
 > (all patches applied, except for reiserfs-group-alloc-8 and
 > reiserfs-search_reada-5)

Nikita.

 > 
 > -- 
 > Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
 > PGP/GnuPG key: 1024D/124B61FA
 > Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
 > Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.
 > 
