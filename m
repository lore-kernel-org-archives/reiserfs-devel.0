From: Oliver Pabst <opabst@sr-online.de>
Subject: Big Block Device does not format...
Date: Thu, 19 Feb 2004 10:39:31 +0100
Message-ID: <40348453.8020800@sr-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16851-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello list,

I try to mkreiserfs /dev/evms/userhomes and /dev/evms/userhomes is a 
drive-linked evms feature object with a sum of 18.8TB.

mkreiserfs /dev/evms/userhomes gives following result:

count_blocks: block device too large
Aborted

I am running 2.6.2-gentoo with large block devices enabled...

anyone a hint?
-- 
        Oliver Pabst   | Saarlaendischer Rundfunk
        Fachbereich IT | Funkhaus Halberg, D-66100 Saarbruecken
Tel: +49 681 602 3817 | mailto:opabst@sr-online.de
Fax: +49 681 602 3808 | mailto:opabst@sr.cn.ard.de (ARD Intern)

