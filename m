From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-2.6.28
Date: Sat, 27 Dec 2008 02:53:05 +0300
Message-ID: <49556E61.4010606@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

Hello everyone.

Changes since reiser4-for-2.6.27:

. adjust to the new aops;
. use d_obtain_alias instead of d_alloc_anon (Jeff Chua);
. remove simple_prepare_write usage (Laurent Riffard).

Find at
http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/

Thanks,
Edward.
