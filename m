From: "Eduardo Costa" <eduardo.costa@tvglobo.com.br>
Subject: ReiserFS data corruption
Date: Thu, 26 Aug 2004 20:24:58 -0300
Message-ID: <C6F91EE5365B7945A52921F774841CC80BA8FB75@JB-W2K-EXC-P01.corp.tvglobo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20840-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

  We are currently working with an I/O intensive application (in the =
order of 60 MB/s for writing and 40 MB/s for reading), using RAID 5 and =
ReiserFS as filesystem. Our host is a dual processed Xeon (2.8GHz) =
running Suse Linux 9.1 with 2.6.4 kernel. The rpm version of reiserfs =
package is 3.6.13.

  As our system began to run, we noticed that some files copied to our =
storage (the one with Reiser and RAID 5) were different from the =
originals. Those differences are random: some files present this =
problem, some don't. The corrupted files have the same size as the =
original ones, but differ at some small blocks of data, around 4KB each, =
with zeroed bytes.

  We have run a test in which we used two SCSI drives, no RAID, one with =
ReiserFS and other with Ext3, to determine if the problem was indeed =
with the filesystem. We did not had a single case o data corruption with =
Ext3, opposed to the ReiserFS drive, which presented the same problem.

  Does anyone has any ideas of what this can be?=20

  Regards,
  Eduardo Costa
