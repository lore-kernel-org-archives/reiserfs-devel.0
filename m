From: "Suman Puthana" <suman@broadware.com>
Subject: problem with overwriting large files
Date: Mon, 21 Jul 2003 08:30:19 -0700
Message-ID: <DAEMLNOMDHGLGENEIALPGELLCAAA.suman@broadware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14982-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

We have an application where-in we write video data at a pretty quick rate
to files (approx. 64K chunks every 25-50 ms or so), and we use the reiserfs
file system to do this. These files can grow to any amount of size based on
how long the user wants to archive the data - say an hour or a day etc..

We do not see any problem when we are writing into empty space(using the
"write" call in a C program) as the file is extending( the "write" operation
takes less than 3 ms), but for a certain part of the application we need to
over-write these files and we find that the "write" operation is taking
about 200-300 ms every few minutes, sometimes every few seconds depending on
the system load.

To be more specific, if the user wants the last 1 hour of data always, after
one hour the application starts overwriting data fom the beginning of the
existing file which has now grown to a few GB's. The chunks of data are not
necessarily in blocks( they may be sizes like 65868 etc..). And the
application is such that we cannot clear this file off - we HAVE to write
over existing data.

Given this situation, we have a few questions:

1.) Given that the "writes" take less than 3 ms when we are writing into
empty space, it does not seem like a hard-disk problem. It seems more to do
with the way the file system manages the "writes" into the system. Are there
any reiserfs/kernel parameters that we can tweak while mounting  the disk or
using the mkreiserfs or resierfstune tools, that can help in making
"re-writes" faster? For example, the journal-size, the max-transaction-size,
the block size etc.

2.) If there are any parameters we can change to improve the "re-write"
time, what do we set them to?

3.) Would writing in file system blocks(4096 bytes?) or multiples of blocks
help this situation?  From some basic tests it doesn't seem to help by much.
From the file system performance point of view, is it better to write
sixteen 4K chunks or one 64K chunk?

4.)If this is not something that can be fixed by tweaking the configuration
of the file system today, what else can be done? Or is it something that can
be worked on by modifying the reiserfs or linux kernel code? Are there disks
or storage configurations, which help in making "re-writes" faster, that you
would recommend?

Ideally we would like to support this on filesystems with reiserfs 3.x.0j
upto reiserfs 3.6.4 on all  linux kernels > 2.4.7.

Any inputs to help resolve this issue quickly would be greatly appreciated.
The 25$ for the support would be mailed out tomorrow to the address provided
in the website.

Thanks in advance,
Suman Puthana

SoftWare Engineer,
BroadWare Technologies
www.broadware.com
Ph(O):408-342-2641

