From: Mathieu Segaud <matt@minas-morgul.org>
Subject: 2.6.10-rc2-mm1: oops when accessing reiser4 fs's (maybe fix provided)
Date: Tue, 16 Nov 2004 19:53:30 +0100
Message-ID: <874qjptyl1.fsf@barad-dur.crans.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22390-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-kernel@vger.kernel.org, akpm@osdl.org


I tried 2.6.10-rc2-mm1 and the last reiser4 updates gave some (many many)
oopses flooding my screen :).
I tried reverting reiser4-fix-deadlock.patch and oopses are gone.

I tried this one because thru the quick traces on my screen, I saw a reference
to get_current_context.
The speed of the traces and the unasibility of the box prevented me from
making differences between "real" oopses and BUG_ON(), sorry for that...

If you want some traces I can provide them ASAP (e.g. tomorrow)

Best,

-- 
"I am getting pretty good at running diff and patch now."

	- Jeff Merkey

