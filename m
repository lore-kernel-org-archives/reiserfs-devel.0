From: Steven Cole <elenstev@mesatop.com>
Subject: Reiser4 shows Type: UNKNOWN with stat -f mountpoint
Date: Thu, 01 Apr 2004 15:57:11 -0700
Message-ID: <1080860231.2206.18.camel@spc0.esa.lanl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17657-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs List <reiserfs-list@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>

I noticed that stat -f returns UNKNOWN for Type for a reiser4
filesystem, while working OK* with other filesystems.  The version
of stat used is 5.0.  If this is the fault of the stat command and not
reiser4, sorry for the noise.

[steven@spc2 testing-2.6]$ df -T
Filesystem    Type   1K-blocks      Used Available Use% Mounted on
/dev/sda1     ext3      798476    156840    601076  21% /
/dev/sda8     ext3     7147260   5570588   1213608  83% /home
none         tmpfs      257456         0    257456   0% /dev/shm
/dev/sda6     ext3     4024188   1874192   1945572  50% /usr
/dev/sda7     ext3      806368    131756    633648  18% /var
/dev/sda9  reiser4     3930680    302468   3628212   8% /r4_testing

[steven@spc2 testing-2.6]$ stat -f /var
  File: "/var"
    ID: 0        Namelen: 255     Type: ext2/ext3
Blocks: Total: 201592     Free: 168653     Available: 158412     Size: 4096
Inodes: Total: 102592     Free: 101008

[steven@spc2 testing-2.6]$ stat -f /r4_testing
  File: "/r4_testing"
    ID: 0        Namelen: 3976    Type: UNKNOWN (0x52345362)
Blocks: Total: 982670     Free: 907053     Available: 907053     Size: 4096
Inodes: Total: 0          Free: 0

*well, sort of OK.  Vfat systems are reported as 'vfat' by df -T, but as
'msdos' by stat -f: 
/dev/hda5     vfat    1.9G  920M  963M  49% /win_d
[steven@spc0 steven]$ stat -f /win_d
  File: "/win_d"
    ID: 0        Namelen: 260     Type: msdos

Steven

