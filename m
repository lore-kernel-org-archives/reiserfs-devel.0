From: Ferenc Kiraly <feri@feridot.com>
Subject: bad blocks on reiserfs filesystem
Date: Mon, 14 Jul 2003 21:11:28 +0200
Message-ID: <3F130060.7010106@feridot.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14935-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

	Hi!

I have a reiserfs root (/) partition where the first 5 blocks went bad.
I need to recover as much as possible from that partition. Is
it possible? And if so, how should I go about it?

I have tried reiserfsck with the --rebuild-sb and --rebuild-tree
options, with no luck.

Thank you,

	feri.


