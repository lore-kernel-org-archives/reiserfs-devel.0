From: Hans Reiser <reiser@namesys.com>
Subject: yeah, it was hardware error, we can ship!
Date: Wed, 04 Aug 2004 11:30:08 -0700
Message-ID: <41112B30.2050509@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19994-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>, vs <vs@thebsh.namesys.com>, David Dabbs <david@dabbs.net>

I excerpt the evidence of it:

 kernel: hda: drive_cmd: status=0x51 { DriveReady SeekComplete Error }
 kernel: hda: drive_cmd: error=0x04 { DriveStatusError }
 kernel: ide: failed opcode was: 0xef
 [powersave_proxy][2907]: WARNING: hdparm returned error 5
 kernel: hda: task_no_data_intr: status=0x51 { DriveReady SeekComplete Error
}
 kernel: hda: task_no_data_intr: error=0x04 { DriveStatusError }
 kernel: ide: failed opcode was: 0xef
 [powersave_proxy][2907]: WARNING: hdparm returned error 5
 ifup: No configuration found for sit0
 kernel: hdb: drive_cmd: status=0x51 { DriveReady SeekComplete Error }

