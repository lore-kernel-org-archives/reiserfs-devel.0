From: "Ingo Bormuth" <ibormuth@efil.de>
Subject: Re: Reiser4: Compilation Error on 2.6.28.1_[Scanned]
Date: Tue, 27 Jan 2009 11:02:01 +0100
Message-ID: <1233050521.11907.6.camel@localhost>
References: <1232326407.2948.7.camel@localhost> <4974F05A.7090406@gmail.com> <200901251813.50957.volkerarmin@googlemail.com>
Reply-To: <ibormuth@efil.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=-NBQp6mgWhTu4W8b/nMIi"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <200901251813.50957.volkerarmin@googlemail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Volker Armin Hemmann <volkerarmin@googlemail.com>
Cc: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.

--=-NBQp6mgWhTu4W8b/nMIi
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2009-01-25 at 18:13 +0100, Volker Armin Hemmann wrote:
> so without Ingo Bormuth's patch you can't use r4 with 2.6.28.1 and later and 
> with his patch there is a risk of deadlocks?

After Edward's reply actually I changed to use the attached mm patch
which is actually the same as what I did with additionally setting the
AOP_FLAG_NOFS flag before calling grab_cache_page_write_begin. It
applies and works nicely with vanilla 2.6.28.2 too.



-- 
Ingo Bormuth,  voicebox & telefax:  +49-(0)-12125-10226517
PGP public key 86326EC9 at http://ibormuth.efil.de/contact

--=-NBQp6mgWhTu4W8b/nMIi
Content-Disposition: attachment;
	filename="fs-symlink-write_begin-allocation-context-fix-reiser4-fix.patch";
	filename*1=ch;
	filename*0=fs-symlink-write_begin-allocation-context-fix-reiser4-fix.pat
Content-Type: text/x-patch;
	charset="UTF-8";
	name="fs-symlink-write_begin-allocation-context-fix-reiser4-fix.patch"
Content-Transfer-Encoding: 7bit

From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>

build fix.

Signed-off-by: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Cc: Nick Piggin <npiggin@suse.de>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 fs/reiser4/plugin/file/file_conversion.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff -puN fs/reiser4/plugin/file/file_conversion.c~fs-symlink-write_begin-allocation-context-fix-reiser4-fix fs/reiser4/plugin/file/file_conversion.c
--- a/fs/reiser4/plugin/file/file_conversion.c~fs-symlink-write_begin-allocation-context-fix-reiser4-fix
+++ a/fs/reiser4/plugin/file/file_conversion.c
@@ -686,7 +686,8 @@ int reiser4_write_begin_careful(struct f
 	start = pos & (PAGE_CACHE_SIZE - 1);
 	end = start + len;
 
-	page = __grab_cache_page(mapping, index);
+	page = grab_cache_page_write_begin(mapping, index,
+					   flags & AOP_FLAG_NOFS);
 	*pagep = page;
 	if (!page)
 		return -ENOMEM;
_

--=-NBQp6mgWhTu4W8b/nMIi--
