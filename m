From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: A WISH: Reiser4 patch for 2.6.14
Date: Fri, 11 Nov 2005 16:00:40 -0600
Message-ID: <1131746440.14171.41.camel@gentoo>
References: <1131353326.4553.4.camel@localhost.localdomain>
	 <436F7ED5.1060106@namesys.com>
	 <1131385665.4553.13.camel@localhost.localdomain>
	 <4374C7EE.20001@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-2KDA+KFKi3dMY6D/JDks"
Return-path: <reiserfs-list-return-26870-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4374C7EE.20001@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Yusuf Iskenderoglu <enygma@dreadnought.hadiko.de>, ReiserFS Mailing List <reiserfs-list@namesys.com>, Reiserfs-dev <reiserfs-dev@namesys.com>

--=-2KDA+KFKi3dMY6D/JDks
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

It looks good so far on amd64, but I haven't had the chance to stress
test it yet.

I remember Hans mentioning wanting to eliminate warnings, so I attached
a trivial patch for an ISO C90 mixed code/declarations warning.

On Fri, 2005-11-11 at 19:33 +0300, Vladimir V. Saveliev wrote:
> Hello
> 
> Yusuf Iskenderoglu wrote:
> > Okay, thanks for the information. I will continue waiting.
> > 
> 
> Well, here is the first attempt to relelase reiser4 for 2.6.14. Please try to
> use it.
> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.14/reiser4-for-2.6.14-1.patch.gz
> 
> 
> Consider it as an experimental thing. Note, it will probably not compile as a
> module. Adding a line to mm/page-writeback.c the following line
> 
> EXPORT_SYMBOL(clear_page_dirty_for_io);
> 
> after clear_page_dirty_for_io()'s definition should fix that, though.
> 
> 
> 
> > On Mon, 2005-11-07 at 19:20 +0300, Vladimir V. Saveliev wrote:
> >>Hello
> >>
> >>Yusuf Iskenderoglu wrote:
> >>>Hello,
> >>>
> >>>I am not having a support issue, just a wish.
> >>>It always takes many weeks until you put a patch for the reiser4
> >>>filesystem for the most actual Linux version into your ftp server.
> >>>In this case, 2.6.14 is already released for one week now, and there is
> >>>still no patch available.
> >>>
> >>>I am not interested in patching the kernel with stuff from other/older
> >>>patches.
> >>>I just wish you be up-to-date
> >>>
> >>>Creating a patch for the actual kernel version simply cannot take you
> >>>more than 1 Minute.
> >>>
> >>Sorry for delay with that. Code got big changes recently, we would like to test
> >>it a bit.
> > 
> > 
> > 
> 
-- 
Jake Maciejewski <maciejej@msoe.edu>

--=-2KDA+KFKi3dMY6D/JDks
Content-Disposition: attachment; filename=reiser4-cryptcompress-warning.patch
Content-Type: text/x-patch; name=reiser4-cryptcompress-warning.patch; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

--- cryptcompress.c.orig	2005-11-11 12:38:34.447766000 -0600
+++ cryptcompress.c	2005-11-11 12:39:22.066742000 -0600
@@ -505,6 +505,8 @@
 
 int open_cryptcompress(struct inode * inode, struct file * file)
 {
+	struct inode * parent;
+
 	assert("edward-1394", inode != NULL);
 	assert("edward-1395", file != NULL);
 	assert("edward-1396", file != NULL);
@@ -514,7 +516,6 @@
 	assert("edward-698",
 	       inode_file_plugin(inode) ==
 	       file_plugin_by_id(CRC_FILE_PLUGIN_ID));
-	struct inode * parent;
 	if (!need_cipher(inode))
 		/* the file is not to be ciphered */
 		return 0;

--=-2KDA+KFKi3dMY6D/JDks--

