From: janfengler@web.de
Subject: fsck.reiser4
Date: Thu, 25 Dec 2003 15:42:28 +0100
Sender: janfengler@web.de
Message-ID: <200312251542.28769.janfengler@web.de>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_Udv6/IDy+pLvMlK"
Return-path: <reiserfs-list-return-16400-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

--Boundary-00=_Udv6/IDy+pLvMlK
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

i have an Problem using fsck.reiser4:
I've copied my whole system to an newly formatted Reiser4-partition. Just 
after unmounting i ran fsck.reiser4. There where lots of fixable minor 
corruptions so i used fsck.reiser4 again submitting --fix to it. After the 
Run it told me that it has found an corruption correctable using the 
"--fix"-option. Therefore i ran it again, but it seems that fsck.reiser4 
isn't able to correct it. It tells me after every run to run it again with 
the "--fix"-option to correct the problem, wasting my time and doing nothing 
else. 

Thanks for your attention
	Jan Fengler

P.S.: I am using the latest snapshot (23.12.2003) with the patched 
reiserfstools 0.4.20 on an 2.6.0-athlon-smp kernel with the 
"preemtible"-option turned on.

--Boundary-00=_Udv6/IDy+pLvMlK
Content-Type: text/x-log;
  charset="us-ascii";
  name="fsck.reiser4.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="fsck.reiser4.log"

Error: Directory [10f69:526f6c6c656e73:11000], plugin [dir40], node [488903], item [1], unit [31]: entry has wrong offset 
[11000:0(NAME):141442644202d20:4b6c696e67656e74:8d218009dff]. Should be []. 

--Boundary-00=_Udv6/IDy+pLvMlK--

