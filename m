From: Hans Reiser <reiser@namesys.com>
Subject: status of reiser4 today
Date: Mon, 28 Jun 2004 11:12:24 -0700
Message-ID: <40E05F88.3010700@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010801040108030209030906"
Return-path: <reiserfs-list-return-19434-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--------------010801040108030209030906
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



--------------010801040108030209030906
Content-Type: message/rfc822;
 name="[CVS] reiserfs"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="[CVS] reiserfs"

Return-Path: <reiserfs-dev-return-21735-Reiser=namesys.com@namesys.com>
Delivered-To: Reiser@namesys.com
Received: (qmail 12056 invoked by uid 501); 28 Jun 2004 16:04:14 -0000
Mailing-List: contact reiserfs-dev-help@namesys.com; run by ezmlm
Precedence: bulk
X-No-Archive: yes
list-help: <mailto:reiserfs-dev-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-dev-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-dev@namesys.com>
X-Mailing-List: reiserfs-dev@namesys.com
Delivered-To: mailing list reiserfs-dev@namesys.com
Received: (qmail 12021 invoked by uid 512); 28 Jun 2004 16:04:13 -0000
Message-ID: <20040628160413.12020.qmail@thebsh.namesys.com>
From: vs@thebsh.namesys.com
Date: Mon, 28 Jun 2004 20:04:13  ()
Subject: [CVS] reiserfs
To: reiserfs-dev@namesys.com
Reply-To: vs@thebsh.namesys.com

CVSROOT:	/home/CVS
Module name:	reiserfs
Repository:	reiserfs/daily-reports/vs/
Changes by:	vs@thebsh.namesys.com.(none)	04/06/28 20:04:13

Modified files:
	reiserfs/daily-reports/vs/: 
		2004.06	1.20 -> 1.21

--------------[ DIFF ]----------------------------
Index: reiserfs/daily-reports/vs/2004.06
diff -u reiserfs/daily-reports/vs/2004.06:1.20 reiserfs/daily-reports/vs/2004.06:1.21
--- reiserfs/daily-reports/vs/2004.06:1.20	Fri Jun 25 21:24:19 2004
+++ reiserfs/daily-reports/vs/2004.06	Mon Jun 28 20:04:03 2004
@@ -207,3 +207,16 @@
 	upgrading to 2.6.7-mm2
 	documanting compile options 
 END 2004.06.25:21.24 Fri TOTAL=5:54
+BEG 2004.06.28:10.35 Mon
+	more stress tests before release
+	upgrading to 2.6.7-mm3
+END 2004.06.28:14.25 Mon TOTAL=3:50
+BEG 2004.06.28:15.35 Mon
+	completed all the preparations for release
+	checking various mount options
+	stressed reiser4 with multithread test:
+		reiser4 lockedup
+		trying to find whewre it deadlocked
+		nothing yet found because kgdb seems to be broken in 2.6.7-mm3
+	sigh, release is delayed 
+END 2004.06.28:20.03 Mon TOTAL=4:28

--------------[ END DIFF ]------------------------


Log message:
	vs's daily report for 28 june 2004




--------------010801040108030209030906--
