From: Andrea Gelmini <andrea.gelmini@gmail.com>
Subject: Bug (?) with 2.6.15-mm4
Date: Mon, 16 Jan 2006 19:22:41 +0100
Message-ID: <20060116182241.GA5121@gelma.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27747-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: akpm@osdl.org

Hi all,
	a few line, without logs and in depth info, to describe a problem
	(if it's not already known, I will do a real bug report).
	
	Well, I've got a Satellite P20, with /dev/md1 crypto-loopbacked
	with /dev/loop0 (losetup -e aes), and /dev/loop0 mount on / with
	reiser4.
	With
Linux cogno 2.6.15-mm2 #1 PREEMPT Sun Jan 8 14:27:42 CET 2006 i686 GNU/Linux
	everything works fine since the day I compiled it.
	Same config, but -mm4, I've got freeze. Sometimes after minutes,
	sometimes after hours.
	After last crash I booted from a rescue partition. Mounting
	partition where system was writing gives no warning, but checking
	it with fsck.reiser4 (Debian testing, package reiser4progs version 1.0.5-1)
	two inconsistency were founded (and fixed).

Thanks a lot for your time and your work,
gelma

