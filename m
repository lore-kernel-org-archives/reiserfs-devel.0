From: Dushan Tcholich <dusanc@gmail.com>
Subject: Slow file attribute modification
Date: Thu, 28 Jan 2010 19:02:42 +0100
Message-ID: <a08621851001281002u309b11a7nfbfd166e108e154e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=ETIcuQ+XSJCPmWZwi/eOLcLEPsiymQbrCTArLlEt9Ug=;
        b=ZPqJAuBmA2AC/FrxtIkgx96gOiDkWKRBWlcNy6H+BjnT8cwRUiqMzkFGOTC4i5FVvJ
         EX88ADFRcuDOfSg5PqGff5O1YfNPhPXg43lvZkROv4DjY2PoM1USgp8WvrNAif8US/mW
         JkuQzRgMjcnZYHDFqsfafNP8g9RP0CrC7tgd8=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward.shishkin@gmail.com>

Hello

When discussing R4 (
http://forums.gentoo.org/viewtopic-p-6151767.html#6151767 )some users
mentioned slow fsync and this way to reproduce:

Get a directory full of directories and small files by extracting
portage to test dir
http://mirror.bih.net.ba/gentoo/snapshots/portage-20100127.tar.bz2

ls -R /mnt/media/test/ | wc -l
177073

Do a:
 time chown -R portage:portage /mnt/media/test/

Then :
 time sync

real    40m9.350s
user    0m0.000s
sys     0m4.884s

Throughput was around 80kb/s on a WD50000AAKS, no cryptocompress,
mounted with noatime, kernel 2.6.30

Is this normal, and why people tell me that ext4 and btrfs do this in
"several seconds"
Does the modification hits the platter for them or is it still in buffers?

Thanks

Dushan
