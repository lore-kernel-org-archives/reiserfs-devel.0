From: "Rodolfo Sikora" <sikora@inova.com.br>
Subject: Is there a way to change root inode from -1 to what ever it will    work?
Date: 10 Aug 2004 17:35:30 -0300
Message-ID: <20040810203531.16942.qmail@qmail-local.inova.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----------=_1092170130-11238-1"
Content-Transfer-Encoding: binary
Return-path: <reiserfs-list-return-20152-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------------=_1092170130-11238-1
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: binary

Hi,

I had problems with my software raid:

cebola:~# mdadm --detail /dev/md0
/dev/md0:
        Version : 00.90.01
  Creation Time : Wed May 19 01:07:53 2004
     Raid Level : raid5
     Array Size : 175790976 (167.65 GiB 180.01 GB)
    Device Size : 58596992 (55.88 GiB 60.00 GB)
   Raid Devices : 4
  Total Devices : 3
Preferred Minor : 0
    Persistence : Superblock is persistent

    Update Time : Tue Aug 10 16:21:23 2004
          State : clean, no-errors
 Active Devices : 3
Working Devices : 3
 Failed Devices : 0
  Spare Devices : 0

         Layout : left-symmetric
     Chunk Size : 4K

    Number   Major   Minor   RaidDevice State
       0       8       65        0      active sync   /dev/sde1
       1       0        0       -1      removed
       2       8       97        2      active sync   /dev/sdg1
       3       8      113        3      active sync   /dev/sdh1
           UUID : 7cceaa8d:4014fc0d:c48efe80:ddb856d4
         Events : 0.722114

anyway the raid went ok and my /dev/md0 with reiser was ok until I decided to fix few corrupted data (files with weird permission denied).

I run --fix-fixable and it asked me to run --rebuild-tree.
I run rebuild-tree twice (is takes about 4 hours) and bot time on pass 3 it stops saying "aborted". What is this?

I'm running the latest (I hope) reiserfsck version (3.6.17).

All I found is that reiserfsck turns root inode to -1 and only change it back after a successful repair.

I know I have intact data inside, unless reiserfsch messed it, so my question is: "Is there anything I could do to be able to mount it again?"

I do have backup but it's not so updated.

Thank you for any help.



Rodolfo Sikora - Desenvolvimento e Opera������o
Departamento de Opera������es e Tecnologia
Inova Tecnologias - http://www.inova.com.br



****************************************************
*Velop* - administra������o, controle e monitoramento da 
sua comunica������o na Internet.
http://www.inova.com.br
------------=_1092170130-11238-1--
