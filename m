From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Bootcd-based LIVE Reiser4 rescue/recovery/installation ISO
Date: Wed, 16 Jul 2014 12:09:18 -0700
Message-ID: <CAM12Q5RXUt3dGc+UNtiESe+dAuCPLKt0t_VS+qpr7pc4jh7b+w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Debian Live <debian-live@lists.debian.org>, debian-cloud <debian-cloud@lists.debian.org>

Niltze!

I uploaded to SF a bootcd-based live ISO made from a small 20GB pure
Reiser4 partition in my dev machine.

I patched a recent Linux kernel 3.15.2 as explained in Metztli IT's
blog < http://www.metztli-it.com/blog/index.php/aG2?blog=4 >, patched
legacy Grub97, and installed utilities gparted and testdisk.

Since Debian bootcd < https://packages.debian.org/sid/bootcd > may
also install a GNU/Linux system, I surmise that an (Reiser4)
installation is also possible, please read man and configuration files
under /etc/bootcd/

I tested ISO image under VirtualBox 4.3.12 and here is a snapshot: <
https://pbs.twimg.com/media/BsoJVE3CQAENw-t.png:large >

If interested in giving it a spin, please download at:

< https://sourceforge.net/projects/xonecuiltzin/ >


Best Professional Regards.


-- 
Jose R R
http://www.metztli-it.com
---------------------------------------------------------------------------------------------
NEW Apache OpenOffice 4.1.0! Download for GNU/Linux, Mac OS, Windows.
---------------------------------------------------------------------------------------------
Daylight Saving Time in USA & Canada ends: Sunday, November 02, 2014
---------------------------------------------------------------------------------------------
