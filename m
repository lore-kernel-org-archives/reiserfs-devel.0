From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: reiser4 for 2.6.10 and reiser4 update for 2.6.10-rc3-mm1
Date: Fri, 31 Dec 2004 00:36:01 +0100
Message-ID: <41D490E1.2000808@free.fr>
References: <41B4A035.2020509@namesys.com> <1104430148.7086.11.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig3449B93A0225A599AD95927B"
Return-path: <reiserfs-list-return-22986-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1104430148.7086.11.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Vladimir Saveliev <vs@namesys.com>
Cc: "reiserfs-dev@namesys.com" <reiserfs-dev@namesys.com>, reiserfs-list@namesys.com, grev@namesys.com

--------------enig3449B93A0225A599AD95927B
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


Hello,

I applied reiser4-update-for-2.6.10-rc3-mm1-2.gz on top of my 
2.6.10-rc3-mm1 tree and then tried to compile :

linux-2.6$ make
[...]
  Building modules, stage 2.
  MODPOST
*** Warning: "find_get_pages" [fs/reiser4/reiser4.ko] undefined!
*** Warning: "find_get_pages_tag" [fs/reiser4/reiser4.ko] undefined!
  LD [M]  fs/reiser4/reiser4.ko

linux-2.6$ grep REISER4 .config
CONFIG_REISER4_FS=m
# CONFIG_REISER4_CHECK is not set

The following patch fixed it :

--- linux-2.6/mm/filemap.c~	2004-12-13 22:15:33.074988832 +0100
+++ linux-2.6/mm/filemap.c	2004-12-31 00:20:21.760733816 +0100
@@ -636,6 +636,7 @@ unsigned find_get_pages(struct address_s
 	read_unlock_irq(&mapping->tree_lock);
 	return ret;
 }
+EXPORT_SYMBOL(find_get_pages);
 
 /*
  * Like find_get_pages, except we only return pages which are tagged with
@@ -657,6 +658,7 @@ unsigned find_get_pages_tag(struct addre
 	read_unlock_irq(&mapping->tree_lock);
 	return ret;
 }
+EXPORT_SYMBOL(find_get_pages_tag);
 
 /*
  * Same as grab_cache_page, but do not wait if the page is unavailable.


~~
laurent


--------------enig3449B93A0225A599AD95927B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFB1JDtUqUFrirTu6IRAnKyAKCaQUNHLfd0pgF/2QRHpZLTSZyAXQCfVsIf
qEmUgNwAPyrtlK+pbaNOkJY=
=fajq
-----END PGP SIGNATURE-----

--------------enig3449B93A0225A599AD95927B--
