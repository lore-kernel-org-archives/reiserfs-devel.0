From: Sebastian Kaps <seb-keyword-reiserfs.0462a0@toyland.sauerland.de>
Subject: kernel: journal-1777: buffer 16 bad state  PREPARED  LOCKED !DIRTY 
	JDIRTY_WAIT
Date: Tue, 23 Mar 2004 12:00:13 +0100
Message-ID: <m3hdwf96bm.fsf@toyland.sauerland.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17406-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi!

I've found a few of these messages in my logs:
,----
| kernel: journal-1777: buffer 16 bad state  PREPARED  LOCKED !DIRTY  JDIRTY_WAIT
`----
What does it mean?

I'm running Linux 2.6.4 w/ Chris' data=ordered patches on a P4-2.6, Asus
P4P800 and Samsung SP1614C S-ATA drive.

-- 
Ciao, Sebastian
