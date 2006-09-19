From: Jindrich Makovicka <makovick@gmail.com>
Subject: reiser4 - slow copying to USB drive
Date: Tue, 19 Sep 2006 09:42:23 +0200
Message-ID: <20060919094223.1acb63e5@holly>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29935-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

I encountered another problem which seems to be related to flushing:
When there runs an application which does very little but contiguous
writes (like bittorrent client), copying from disk to a thumb drive
fills the memory with the data to be written to fat32 fs, and it
seems that the memory pressure causes the reiser4 writes to be flushed
immediately, which results in a huge slowdown. In my case the thumb
drive is able to write about 10MB/s, but after a while, when the RAM
fills up, the speed drops to 3MB/s, because the hard drive is busy
writing.

Regards,
-- 
Jindrich Makovicka
