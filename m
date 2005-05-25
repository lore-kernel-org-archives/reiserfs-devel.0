From: Andrew James Wade <ajwade@cpe00095b3131a0-cm0011ae8cd564.cpe.net.cable.rogers.com>
Subject: Unexpected reset corrupted Reiser4 filesystem
Date: Tue, 24 May 2005 23:38:32 -0400
Message-ID: <200505242338.32420.ajwade@cpe00095b3131a0-cm0011ae8cd564.cpe.net.cable.rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24135-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

One of my Reiser4 filesystems was corrupted by a power glitch.
fsck fixed the corruption, but my understanding is that an
unexpected reset should not have corrupted the filesystem. I
have an image of the corrupted filesystem, is it of any use to
anyone?

Details:
kernel: 2.6.12-rc4-mm2
fsck.reiser4: 1.0.4
I was installing oracle, when the power flickered. I was
unable to delete oracle's directory due to what was reported
as I/O errors. fsck revealed a corrupted filesystem (FSCK:
Node (13142228), item (77), unit (0): Points to the block
(12981542) which is in the tree already. The whole subtree
is skipped.) I have an image of the partition at this point,
and dd reported no errors while copying. The image is
unfortunately a bit large to upload (70 GB), but I am happy
to run diagnostic tools against it.

Andrew Wade
