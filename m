From: "Felix E. Klee" <felix.klee.reiserfs@gmx.net>
Subject: ReiserFS on a USB memory stick?
Date: Fri, 3 Oct 2003 12:24:55 +0200
Message-ID: <20031003122455.1faa32fa.felix.klee.reiserfs@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15778-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I want to run LINUX on a 512MB USB memory stick that supports a minimum
of 100,000 rewrites. I'll mostly be running an EMACS session with
Preview-Latex where I'll be editing and compiling TeX files. Note that I
don't care if the stick fails after 3 months, but it should last about
that long.

Is ReiserFS a suitable file system for that kind of application or are
there better systems? Are there some ways to tune caching so that data
isn't written to the stick as often as it could?

BTW, I already found JFFS2 but it seems to be made for direct access to
flash hardware, while a USB memory stick emulates a hard disk or floppy
super drive.

Felix

-- 
To contact me off list don't reply but send mail to
    felix DOT klee AT inka DOT de
Otherwise your email to me might get automatically deleted!
