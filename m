From: Vijayan Prabhakaran <pvijayan@gmail.com>
Subject: Journaling mode
Date: Wed, 11 Aug 2004 12:26:47 -0500
Message-ID: <d68fdf7d04081110265ea9db94@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20198-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I'm new to Reiserfs. I think this question might have been answered
before but I couldn't find it.

I'd like to run Reiserfs with different journaling modes
(data/ordered/writeback). Are these different journaling modes
supported only in Linux 2.6 or are they available in Linux 2.4 ?

In Linux 2.4.27, I created a reiserfs and tried to mount using the
option '-o data=journal'. But it failed to mount.

Any help is appreciated.

thanks,
Vijayan
