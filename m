From: lardel@interia.pl
Subject: 2.6.23-rc1-mm1: reiser4 compressed and zero length file
Date: Fri, 27 Jul 2007 21:40:39 +0200
Message-ID: <200707272140.39114.lardel@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Hi,
A filesystem created by:
mkfs.reiser4 -o create=ccreg40 /dev/sda8
can't read zero length files:
# touch test
# cat test
cat: test: Invalid argument

Uncompressed filesystems are ok. vanilla with 2.6.22 patch is fine too.

Regards,
Rafal

----------------------------------------------------------------------
Piekne kobiety wsrod samych swin!
Obejrzyj

>>>http://link.interia.pl/f1b18

