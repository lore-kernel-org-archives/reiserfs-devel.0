From: Tobias Burnus <tobias.burnus@physik.fu-berlin.de>
Subject: labels and uuids setting/showing
Date: Tue, 14 Oct 2003 22:06:18 +0200
Sender: Tobias Burnus <tburnus@physik.fu-berlin.de>
Message-ID: <20031014200618.GA10022@physik.fu-berlin.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15837-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

I know that reiserfstune can set UUIDs and labels on a not-mounted
reiser file system.

But how can I (a) show the current UUID and label of a
(mounted/not-mounted) reiser3? And how can I set the label and/or the
UUID without u(n)mounting? reiserfstune currently complains that it
cannot rebuild the tree on a mounted system.

Tobias
