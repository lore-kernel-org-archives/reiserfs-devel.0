From: Vitaly Fertman <vitaly@namesys.com>
Subject: reiserfsprogs 3.6.6-pre1 release
Date: Tue, 1 Apr 2003 21:24:14 +0400
Message-ID: <200304012124.14927.vitaly@namesys.com>
References: <200303251108.11938.Dieter.Nuetzel@hamburg.de> <200303251903.34660.Dieter.Nuetzel@hamburg.de> <004f01c2f7af$60cb9f50$6400a8c0@twister>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-13514-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <004f01c2f7af$60cb9f50$6400a8c0@twister>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>


Hi all, 

the new pre release includes:
- speedup on semantic rebuild pass.
- improved leaves recovery on pass0 of rebuild-tree. 

Bugs were fixed:
- "flush_buffers: device is not specified" in reiserfsck on boot.
- reiserfstune is able to rebuild a journal if the currect journal is not 
available or broken.
- reiserfstune update journal parameters correctly while tuning a journal.

The bugfix for "flush_buffers: device is not specified" is available also
as a patch here: 
ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.5-flush_buffers-bug.patch
Probably 3.6.6 will be released with this only bug fixed.

-- 

Thanks,
Vitaly Fertman
