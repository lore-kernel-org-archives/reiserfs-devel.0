From: <doiggl@velocitynet.com.au>
Subject: conclusion These are the steps I used to backup accessible files in reiser4 [meta-data damaged] volume. [sdb]
Date: Sun, 26 Feb 2017 13:12:25 +1100
Message-ID: <fbdc1aabb72e47a0ed57629cb3e52938@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

 
Hello
These are the steps I used to backup accessible files in reiser4
[meta-data damaged] volume. [sdb]
--Glenn

## commands used
on another  disk with free space

mount reiser4 volume [metadata damaged]
# time  mount /dev/sdb /media/disk

real    1m49.991s
user    0m0.012s
sys     0m1.872s


generate file listing

# cd /media/disk2
# find /media/disk/. -print > sdb-file-list.txt

-2017

# wc -l sdb-file-list.txt
76494 sdb-file-list.txt

76,494

backup accessible files
# tar -c -v -z -T sdb-file-list.txt -f r4files-sdb.tgz

check tgz file
# tar -tzf /media/disk2/r4files-sdb.tgz | tee
/home/r4/sdb/check-r4files-sdb.log

# ll r4files-sdb.tgz
-rw-r--r-- 1 root root 116148741254 Feb 26 02:15 r4files-sdb.tgz

116,148,741,254

allowed 'tar' to deal with any 'File removed before we read it' problems

--Glenn

sample of problem:
tar: /media/disk/./linux/articles/How To Send an Email With Attachment and
Body from Linux_files/f2ae34f81eb7452e6a601cf3a0e4ae8a.png: File removed
before we read it
tar: /media/disk/./linux/articles/How To Send an Email With Attachment and
Body from Linux_files/f6c636e74e911a9ef246110bfe726dfc.png: File removed
before we read it
tar: /media/disk/./linux/articles/How To Send an Email With Attachment and
Body from Linux_files/vim-101-hacks-468x60.png: File removed before we read
it
/media/disk/./linux/articles/Linux _ UNIX: Encrypt Backup Tape Using Tar 
and OpenSSL_files/
/media/disk/./linux/articles/quick-guide-to-linux-partition-schemes_files/


