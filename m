From: "JP Howard" <jh_lists@fastmail.fm>
Subject: Writeback cache, SCSI, and ReiserFS
Date: Wed, 16 Oct 2002 05:33:12 UT
Message-ID: <20021016053312.CCE9A1AEC187@server5.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11711-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>
Cc: Rob Mueller <robm@fastmail.fm>

Here's a little program to test fsync() performance--if you run it with
the parameter '1' it does 10000 write/fsync combinations, with the
parameter '0' it does 10000 writes, followed by a single fsync:
----
int main(int argc, char **argv) {
  int i, fd, mode;
  mode = atoi(argv[1]);
  fd = open("/some/path", O_CREAT | O_RDWR);
  for (i=0; i<10000; i++) {
    if (i%10 == 0)
      lseek(fd, 0, SEEK_SET);
    write(fd, buf, 8192);
    if (mode == 1) {
      fsync(fd);
    }
  }
  fsync(fd);
}
----

Now, according to our RAID controller (MegaRAID Series 475), we have
writeback cache turned on. Therefore, I would have thought that the above
program would run at the same speed regardless of using parameter '1' vs
'0', since fsync should return immediately when using a writeback cache.

But, it doesn't--it's about 30x slower when doing all the fsyncs.

Now, I don't know where to look. Is this a filesystem issue (I've tested
with both ReiserFS and Ext3 with the same results), a kernel issue, or a
hardware issue? We're very keen to get good fsync performance, because
Cyrus is full of them. (Yes, I know Reiser v4 will have proper
transactions, but I'm looking for a short-term solution to this
particular issue!)

Curiously, scsiinfo says that write cache is *not* turned on, despite
what the BIOS and "megamgr" (the controller's management software) says:
----
# scsiinfo -c /dev/sda

Data from Caching Page
----------------------
Write Cache                        0
Read Cache                         1
Prefetch units                     0
<...>
----

Has anyone dealt with this issue before? Are we correct that fsync()
should return immediately when using writeback cache? Any ideas on where
to look for a solution?

Apologies if this is not a ReiserFS issue--I don't really know where we
should be focussing our attention to resolve this.
