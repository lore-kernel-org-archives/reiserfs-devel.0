From: "Samuel Leuthold" <sam@asgard.ch>
Subject: bread: Cannot read a block # 57311287.
Date: Mon, 3 Nov 2003 19:17:14 +0100
Message-ID: <000d01c3a236$b857c780$7801a8c0@asuncion>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000E_01C3A23F.1A1C2F80"
Return-path: <reiserfs-list-return-15965-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_000E_01C3A23F.1A1C2F80
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello

When i would like to access to a specific path i get different errors. So i
run reiserfsck and get the following response:

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.2

Will check consistency of the filesystem on /dev/video_vg/video_lv
Will fix what can be fixed w/o --rebuild-tree
Will put log info to '/tmp/reiser.log'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --fix-fixable started at Mon Nov  3 20:03:42 2003
###########
Replaying journal..
No transactions found
Checking S+tree../  3 (of   3)                          
bread: Cannot read a block # 57311287.



Aborted (core dumped)
--------------------------------------


I have three ide devices in an LVM. On this LVM is the faulty reiser
partition. I think that the failure is only on one specific disk because i
can access the old data on the other two drives. Does anyone know how to
have the "old" two disks save and the new repaired? I couldn't backup the
data because it is about 300GB but the data on the failure disk doesn't
matter.

Thank you for your help

Samuel 



------=_NextPart_000_000E_01C3A23F.1A1C2F80--


