From: David T Hollis <dhollis@davehollis.com>
Subject: [PATCHES] Fix libaal and reiser4progs RPM spec files to include
	proper library files
Date: Thu, 19 Aug 2004 11:44:46 -0400
Message-ID: <1092930286.3938.4.camel@dhollis-lnx.kpmg.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-sFgxDDWGZPkZmcpNwkTZ"
Return-path: <reiserfs-list-return-20405-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--=-sFgxDDWGZPkZmcpNwkTZ
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Now that versions 1.0.0 of libaal and reiser4progs are out, the RPM spec
files needed to be updated to reflect the change in the libraries
versions.  The attached patches fix the spec files so that the packages
will build successfully.  With these changes, future library version
changes shouldn't break the RPM build.

-- 
David T Hollis <dhollis@davehollis.com>

--=-sFgxDDWGZPkZmcpNwkTZ
Content-Disposition: attachment; filename=libaal.spec.diff
Content-Type: text/x-patch; name=libaal.spec.diff; charset=UTF-8
Content-Transfer-Encoding: 7bit

--- libaal.spec.orig	2004-08-19 11:31:28.305085552 -0400
+++ libaal.spec	2004-08-19 11:31:57.026719200 -0400
@@ -53,7 +53,7 @@
 %files
 %defattr(-,root,root)
 %doc AUTHORS BUGS COPYING CREDITS INSTALL NEWS README THANKS TODO
-%{_libdir}/libaal-0.5.so.*
+%{_libdir}/libaal-*.so.*
 %{_libdir}/libaal-alone.so.*
 
 %files devel

--=-sFgxDDWGZPkZmcpNwkTZ
Content-Disposition: attachment; filename=reiser4progs.spec.diff
Content-Type: text/x-patch; name=reiser4progs.spec.diff; charset=UTF-8
Content-Transfer-Encoding: 7bit

--- reiser4progs.spec.orig	2004-08-19 11:35:09.966387912 -0400
+++ reiser4progs.spec	2004-08-19 11:41:30.686509656 -0400
@@ -55,9 +55,9 @@
 %files
 %defattr(-,root,root)
 %doc AUTHORS BUGS COPYING CREDITS INSTALL NEWS README THANKS TODO
-%{_libdir}/libreiser4-0.5.so.*
-%{_libdir}/libreiser4-alone-0.5.so.*
-%{_libdir}/librepair-0.5.so.*
+%{_libdir}/libreiser4-*.so.*
+%{_libdir}/libreiser4-alone-*.so.*
+%{_libdir}/librepair-*.so.*
 %{_sbindir}/cpfs.reiser4
 %{_sbindir}/debugfs.reiser4
 %{_sbindir}/fsck.reiser4

--=-sFgxDDWGZPkZmcpNwkTZ--

