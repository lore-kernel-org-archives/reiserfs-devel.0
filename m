From: kiggundu@kym.net
Subject: Can Reiserfsck fix this?
Date: Thu, 21 Aug 2003 22:41:46 +0300 (EAT)
Message-ID: <Pine.LNX.4.53.0308212237320.29179@orion.kym.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15383-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Following error cropped up after I tried to resize a partition down.

-----------------------------------------------------------
serval:~ # reiserfsck /dev/hda5
reiserfsck 3.6.4 (2002 www.namesys.com)
Will read-only check consistency of the filesystem on /dev/hda5
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
###########
reiserfsck --check started at Thu Aug 21 22:37:26 2003
###########

The problem has occurred looks like a hardware problem.
Check your hard drive for badblocks.

bread: Cannot read the block (4194303).

Aborted
----------------------------------------------------------------

I am in Uganda, East Africa and so have very limited access to help or
resources.  Can the data upto that block be recovered?  if so how?

Thanks in advance

Kiggundu
