From: "Sonke Ruempler" <ruempler@topconcepts.com>
Subject: Re: reiserfs bug
Date: Thu, 28 Nov 2002 09:50:55 +0100
Message-ID: <077201c296bb$43b4ac40$6600a8c0@topconcepts.net>
References: <072801c296b8$2cb01000$6600a8c0@topconcepts.net> <20021128114755.A2724@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12064-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

> There should be another message in your logs prior to above,
> can you please tell us what was that message?

Nov 28 09:00:12 blah kernel: reiserfs: checking transaction log (device
08:01) ...
Nov 28 09:00:15 blah kernel: reiserfs: replayed 19 transactions in 3 seconds
Nov 28 09:00:15 blah kernel: Using r5 hash to sort names
Nov 28 09:00:15 blah kernel: ReiserFS version 3.6.25
Nov 28 09:00:51 blah kernel: smb_proc_readdir_long:
name=\topconcepts.net\www\pub\doc\_php_manual_ger\www.php.net\SEARC~-N.PHP\*
, result=-2, rcls=1, err=2
Nov 28 09:00:51 blah kernel: smb_proc_readdir_long:
name=\topconcepts.net\www\pub\doc\_php_manual_ger\www.php.net\SOURC~W#.PHP\*
, result=-2, rcls=1, err=2
Nov 28 09:05:15 blah kernel: SCSI disk error : host 2 channel 0 id 1 lun 0
return code = 10000
Nov 28 09:05:15 blah kernel:  I/O error: dev 08:11, sector 283064
Nov 28 09:05:15 blah kernel: SCSI disk error : host 2 channel 0 id 1 lun 0
return code = 10000
Nov 28 09:05:15 blah kernel:  I/O error: dev 08:11, sector 283064
Nov 28 09:05:15 blah kernel: zam-7001: io error in reiserfs_find_entry
Nov 28 09:05:15 blah kernel: SCSI disk error : host 2 channel 0 id 1 lun 0
return code = 10000
Nov 28 09:05:15 blah kernel:  I/O error: dev 08:11, sector 283064
Nov 28 09:05:15 blah kernel: vs-13050: reiserfs_update_sd: i/o failure
occurred trying to update [2 58464 0x0 SD] stat dataSCSI disk error : host 2
channel 0 id 1 lun 0 return code = 10000
Nov 28 09:05:15 blah kernel:  I/O error: dev 08:11, sector 283064
Nov 28 09:05:20 blah kernel: vs-13050: reiserfs_update_sd: i/o failure
occurred trying to update [2 58464 0x0 SD] stat dataSCSI disk error : host 2
channel 0 id 1 lun 0 return code = 10000
Nov 28 09:05:20 blah kernel:  I/O error: dev 08:11, sector 11496
Nov 28 09:05:20 blah kernel: SCSI disk error : host 2 channel 0 id 1 lun 0
return code = 10000
Nov 28 09:05:20 blah kernel:  I/O error: dev 08:11, sector 11504
Nov 28 09:05:20 blah kernel: journal-601, buffer write failed
Nov 28 09:05:20 blah kernel: kernel BUG at prints.c:334!
Nov 28 09:05:20 blah kernel: invalid operand: 0000
Nov 28 09:05:20 blah kernel: CPU:    0

[...]

If you need more logs, just mail me.

