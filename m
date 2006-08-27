From: Brice Arnould <un_brice@vleu.net>
Subject: Possible bug with FIBMAP
Date: Sun, 27 Aug 2006 10:57:12 +0200
Message-ID: <200608271057.12684.un_brice@vleu.net>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_o5V8E5ZZol3Klwu"
Return-path: <reiserfs-list-return-29698-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Boundary-00=_o5V8E5ZZol3Klwu
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi

Two users of a hack I wrote told me that
http://vleu.net/shake/fb_r4.c (also attached with the mail)
returned "FIBMAP=-22, FIGETBSZ=4096"
on some of their files on reiser4 filesystems.

Does this value of "-22" have a special meaning (would be strange), or is it a 
bug in Reiser4 ?
I can ask them for more details, if you want.

Thanks
Brice

--Boundary-00=_o5V8E5ZZol3Klwu
Content-Type: text/plain;
  charset="us-ascii";
  name="fb_r4.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="fb_r4.c"

/*
 * Non released test software, distributed under GPL-2 licence by
 * Brice Arnould (c) 2006
 * You shouldn't use it.
 */
#include <stdio.h>
#include <assert.h>		// assert()
#include <errno.h>		// errno
#include <error.h>		// error()
#include <sys/ioctl.h>		// ioctl()
#include <linux/fs.h>		// FIBMAP, FIGETBSZ
#include <sys/types.h>		// open()
#include <sys/stat.h>		// open()
#include <fcntl.h>		// open()

int
main (int argc, char **argv)
{
  int fd, blocksize, block = 0;
  if (1 != argc)
    error (1, 0, "usage : %s FILE", argv[0]);
  fd = open (argv[1], O_RDONLY);
  assert (0 < fd);
  if (-1 == ioctl (fd, FIGETBSZ, &blocksize)
      || -1 == ioctl (fd, FIBMAP, &block))
    error (1, 0, "ioctl() failed, are you root ?\n");
  printf ("FIBMAP=%i, FIGETBSZ=%i\n", block, blocksize);
  close (fd);
}

--Boundary-00=_o5V8E5ZZol3Klwu--
