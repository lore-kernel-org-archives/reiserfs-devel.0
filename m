From: Hans Reiser <reiser@namesys.com>
Subject: known reiser4 bugs in latest auto-snapshot
Date: Thu, 17 Jun 2004 10:25:29 -0700
Message-ID: <40D1D409.5030607@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050001080104020208070502"
Return-path: <reiserfs-list-return-19237-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>
Cc: Clifford Beshers <clifford.beshers@lindows.com>, Alexander Zarochentcev <zam@namesys.com>

--------------050001080104020208070502
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

this timesheet extract should be informative

--------------050001080104020208070502
Content-Type: message/rfc822;
 name="[CVS] reiserfs"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="[CVS] reiserfs"

Return-Path: <reiserfs-dev-return-21638-Reiser=namesys.com@namesys.com>
Delivered-To: Reiser@namesys.com
Received: (qmail 24770 invoked by uid 501); 17 Jun 2004 15:00:58 -0000
Mailing-List: contact reiserfs-dev-help@namesys.com; run by ezmlm
Precedence: bulk
X-No-Archive: yes
list-help: <mailto:reiserfs-dev-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-dev-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-dev@namesys.com>
X-Mailing-List: reiserfs-dev@namesys.com
Delivered-To: mailing list reiserfs-dev@namesys.com
Received: (qmail 24740 invoked by uid 512); 17 Jun 2004 15:00:57 -0000
Message-ID: <20040617150057.24739.qmail@thebsh.namesys.com>
From: vs@thebsh.namesys.com
Date: Thu, 17 Jun 2004 19:00:57  ()
Subject: [CVS] reiserfs
To: reiserfs-dev@namesys.com
Reply-To: vs@thebsh.namesys.com

CVSROOT:	/home/CVS
Module name:	reiserfs
Repository:	reiserfs/daily-reports/vs/
Changes by:	vs@thebsh.namesys.com.(none)	04/06/17 19:00:57

Modified files:
	reiserfs/daily-reports/vs/: 
		2004.06	1.12 -> 1.13

--------------[ DIFF ]----------------------------
Index: reiserfs/daily-reports/vs/2004.06
diff -u reiserfs/daily-reports/vs/2004.06:1.12 reiserfs/daily-reports/vs/2004.06:1.13
--- reiserfs/daily-reports/vs/2004.06:1.12	Wed Jun 16 19:03:05 2004
+++ reiserfs/daily-reports/vs/2004.06	Thu Jun 17 19:00:47 2004
@@ -118,3 +118,15 @@
 	trying to reproduce nfs + reiser4 + mozilla problem - not completed
 	trying to reproduce inode loading semaphore lockup - failed
 END 2004.06.16:19.02 Wen TOTAL=3:35
+BEG 2004.06.17:11.29 Thu
+	stressing reiser4 used as root filesystem:
+	it has problems when it is full: mmap fails (due to unability to convert tail)
+	rm to free space locked, failed to find why
+	trying to find why nfs does not work (with Grev's help)
+	investigating iozone's lockup - not completed
+END 2004.06.17:15.04 Thu TOTAL=3:35
+BEG 2004.06.17:15.33 Thu
+	code cleanup
+	fighting with nfs (to try to reproduce mozilla + reiser4 + nfs corruption problem)
+	not completed
+END 2004.06.17:19.00 Thu TOTAL=3:27

--------------[ END DIFF ]------------------------


Log message:
	vs's daily report for 17 june 2004




--------------050001080104020208070502--
