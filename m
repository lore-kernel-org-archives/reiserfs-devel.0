From: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Subject: reiser4 corruption
Date: Sat, 4 Sep 2004 20:07:36 +0200
Message-ID: <2f4958ff04090411072d5c767d@mail.gmail.com>
Reply-To: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21465-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi folks

I have some issues with KDE compilation on my computer.
I decided to give it a try (and test), and switched over /home
partition on one of my laptops to reiserfs v4. I am using debian
testing (knoppix installation) + 2.6.9-mm1.

Recently I had some issues compiling KDE (acctually in linking) that
might have source in fs corruption. SO I decided to run fsck.reiser4.
Logged output is attached. Tell me please if it's any help, or if
something else should be done.
I don't have anything in logs, FS wasn't compiled with debug options.

I'll run --build-fs on it now. When it's finished, I'll remove KDE
sources, suck them again from CVS, and try to rebuild. And fsck again.
We'll see if it's reproducable.

thanks.

-- 
GJ
