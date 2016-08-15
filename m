From: <doiggl@velocitynet.com.au>
Subject: Is there some code [to run on linux r4 enabled kernel] to extract a list of filenames from the reiser4 meta-data ?
Date: Mon, 15 Aug 2016 18:07:27 +1000
Message-ID: <68505c880026eaa8f9ba2a072db17a1d@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>
Cc: intelfx@intelfx.name

Hello,
Is there some code [to run on linux reiser4 enabled kernel] to extract a
list of filenames from the reiser4 meta-data ?
Thanks
--Glenn

packed meta data 

# debugfs.reiser4 -P /dev/sdb  | gzip -9 > metadata-sdb.bz2
- metadata packed ok.
 2,049,018 KB 
 
debugfs.reiser4 1.1.0
Format release: 4.0.1
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING. 


metadata unpacked ok.

#  bunzip2  metadata-sdb.bz2
24742135567


metadata-sdb

24,742,135,567

downloadable from:
http://www.4shared.com/file/-RA17cXlba/metadata-sdb.html

