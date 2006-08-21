From: Marcos Dione <mdione@grulic.org.ar>
Subject: problem with reiser3
Date: Mon, 21 Aug 2006 19:24:21 -0300
Message-ID: <20060821222421.GC14067@grulic.org.ar>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29640-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: mdione@grulic.org.ar

    hi all. I'm having problems checking a reiser3 filesystem.
reiserfsck says: 

bread: Cannot read the block (27887610): (Input/output error).

    I passed badblocks over the partition and found 61 bad sectors
(which I know is bad), then run reiserfsck -B with the bad blocks file
and got the same, but also this:

create_badblock_bitmap: block number (111550463) points out of fs size (39072080).

    any hints?
