From: <fourwood@cox.net>
Subject: Failures to write to Reiser3 partition
Date: Mon, 6 Oct 2003 22:47:06 -0400
Message-ID: <20031007024706.LUXX22544.lakemtao08.cox.net@smtp.central.cox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15799-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I have a 55gig Reiser3 partition with 22gigs of data on it, and ever since I did some partition reworkings (moved the data off a 25gig partition to this one, then split the old one up into / and /home), I can no longer write to this partition. I can read from it fine, and there are no errors in dmesg or when I mount it. If I write to it, the program writing (Kwrite, emacs, echo, touch, etc) hangs and can't be killed. From this point, that directory I was trying to write to on the partition is no longer readable, and still not writable. It's clearly not a permissions problem, but those are fine anyway. Does anyone have any suggestions?

