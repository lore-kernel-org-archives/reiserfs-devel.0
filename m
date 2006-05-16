From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: [FYI]: Two compiler warnings in fs/reiser4/plugin/object.c
	with gcc-4.1.0
Date: Tue, 16 May 2006 13:35:24 +0400
Message-ID: <1147772124.6316.22.camel@tribesman.namesys.com>
References: <20060515130450.GB8977@zeus.uziel.local>
	 <20060515145323.GC8977@zeus.uziel.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28627-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060515145323.GC8977@zeus.uziel.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Christian Trefzer <ctrefzer@gmx.de>
Cc: reiserfs-list@namesys.com

Hello

On Mon, 2006-05-15 at 16:53 +0200, Christian Trefzer wrote:
> fs/reiser4/plugin/object.c:120: Warnung: Initialisierung von inkompatiblem Zeigertyp
> fs/reiser4/plugin/object.c:320: Warnung: Initialisierung von inkompatiblem Zeigertyp
> 
> (in english: Warning: initialization from incompatible pointer type)
> 

What versions of linux and reiser4 do you compile?

> file_plugin file_plugins[LAST_FILE_PLUGIN_ID] = {
> 	[UNIX_FILE_PLUGIN_ID] = {
> <snip>
> 		.as_ops = {
> 			.writepage = reiser4_writepage,
> 			.readpage = readpage_unix_file,
> 			.sync_page = block_sync_page,
> 			.writepages = writepages_unix_file,
> 			.set_page_dirty = reiser4_set_page_dirty,
> 			.readpages = reiser4_readpages,
> 			.prepare_write = prepare_write_unix_file,
> 			.commit_write =	commit_write_unix_file,
> 			.bmap = bmap_unix_file,
> 120:		.invalidatepage = reiser4_invalidatepage,
> 			.releasepage = reiser4_releasepage
> 		},
> <snip>
> 	[CRC_FILE_PLUGIN_ID] = {
> <snip>
> 		.as_ops = {
> 			.writepage = reiser4_writepage,
> 			.readpage = readpage_cryptcompress,
> 			.sync_page = block_sync_page,
> 			.writepages = writepages_cryptcompress,
> 			.set_page_dirty = reiser4_set_page_dirty,
> 			.readpages = reiser4_readpages,
> 			.prepare_write = prepare_write_common,
> 320:		.invalidatepage = reiser4_invalidatepage,
> 			.releasepage = reiser4_releasepage
> 		},
> 
> Another warning mentions _possibly_ uninitialized use of a variable:
> 
> fs/reiser4/plugin/space/bitmap.c: In Funktion »load_and_lock_bnode«:
> fs/reiser4/plugin/space/bitmap.c:817: Warnung: »cjnode« könnte in dieser Funktion uninitialisiert verwendet werden
> (»cjnode« could be used uninitialized in this function)
> 
> Kind regards,
> Chris

