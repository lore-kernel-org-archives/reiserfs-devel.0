From: iwan@durgerlan.nl
Subject: reiser4 error?
Date: Sat, 10 Dec 2005 10:16:33 +0100 (CET)
Message-ID: <20051210091633.4B4CCE2C08C@durgerlan.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27250-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hello,

I was on #reiser4 on irc.oftc.net yesterday to ask about an error I got and
someone sugested that I send an email to this list... here is the
information:

I'm using reiser4 as off today and I've got this error in dmegs:

<4>reiser4[cp(5184)]: update_stale_dk (fs/reiser4/search.c:1363)[nikita-38210]:
WARNING: stale dk

does anyone know what that could mean?

I'm using Linux backup.unetix.nl 2.6.14.1-ARC12 #2 SMP Fri Dec 9 16:47:25 CET 2005 i686 unknown unknown GNU/Linux
with the corresponding reiser4 packages from ftp.namesys.com
the reiser4 partition is on an Areca ARC1260 RAID card:
/dev/sdb  6.1T  174G  5.9T   3% /backup

any help is appriciated.
-- 
   ,-,_|\   - UnetIX Linux Solutions
  /      \  - http://www.unetix.nl/
  \_,--\_/  - http://www.vexira.nl/
        v   - Iwan Boskamp
