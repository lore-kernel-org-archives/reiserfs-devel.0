From: Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>
Subject: Re: New reiser4 snapshot (2003.09.12) is out
Date: Sat, 13 Sep 2003 13:50:32 +0200
Message-ID: <1063453831.1661.7.camel@teapot.felipe-alfaro.com>
References: <Pine.LNX.4.44.0309130726000.30030-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-z7ozam0iUFRE4hmd17uI"
Return-path: <reiserfs-list-return-15647-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0309130726000.30030-100000@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: Reiser FS mailing list <reiserfs-list@namesys.com>

--=-z7ozam0iUFRE4hmd17uI
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2003-09-13 at 13:27, Robert P. J. Day wrote:
> On Sat, 13 Sep 2003, Felipe Alfaro Solana wrote:
> 
> > I've downloaded libaal and reiser4progs as noted above. I applied the
> > whole reiser4.diff to 2.6.0-test5-bk3, but, when I run:
> > 
> > # mkfs.reiser4 /dev/hda4
> > # mount -t reiser4 /dev/hda4 /mnt
> > 
> > I get the following oops:
> 
> (snip)
> 
> not to beat this dead horse even further, but how did you get the
> reiser progs to build.  at least a couple of us have run into the
> same "make" error in trying to build them.

If my memory serves me well, that's the only patch needed to make it
compile.

--=-z7ozam0iUFRE4hmd17uI
Content-Disposition: attachment; filename=compile.patch
Content-Type: text/plain; name=compile.patch; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

--- libmisc/exception.c.old	2003-08-29 08:24:36.000000000 +0200
+++ libmisc/exception.c	2003-09-13 00:43:42.244676886 +0200
@@ -130,9 +130,8 @@
 aal_exception_option_t misc_exception_handler(
 	aal_exception_t *exception)		/* exception to be processed */
 {
-	int i, tty;
+	int tty;
 	void *stream = stderr;
-	aal_list_t *variant = NULL;
 	aal_exception_option_t opt = EXCEPTION_UNHANDLED;
     
 	if (misc_exception_option_count(exception->options, 0) == 1) {

--=-z7ozam0iUFRE4hmd17uI--

