From: John Dalbec <jpdalbec@ysu.edu>
Subject: Patch to the reiserfsprogs-3.6.8 .spec file
Date: Wed, 25 Jun 2003 11:26:14 -0400
Message-ID: <3EF9BF16.7090909@ysu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14697-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>

This patch allows the reiserfsprogs RPM to be built as non-root without 
the doc files being owned by the build user and group.

--- redhat/SPECS/reiserfsprogs.spec	Wed Jun 25 11:06:19 2003
+++ redhat/JPD.SPECS/reiserfsprogs.spec	Wed Jun 25 11:12:58 2003
@@ -81,4 +81,5 @@
  %clean
    %{__rm} -rf $RPM_BUILD_ROOT
  %files -f %{buildroot}/rpm-filelist
+%defattr(-,root,root)
  %doc README


