From: David T Hollis <dhollis@davehollis.com>
Subject: RPM spec file for reiser4progs
Date: Thu, 28 Aug 2003 12:59:04 -0400
Message-ID: <3F4E34D8.3010605@davehollis.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000603080904030804080609"
Return-path: <reiserfs-list-return-15473-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs List <reiserfs-list@namesys.com>

--------------000603080904030804080609
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This is an RPM spec file to allow reiser4progs to be easily built.  The 
patch currently included will most likely not be needed by further 
revisions.  It fixes three warnings that GCC 3.3.1 aborted on and at the 
same time fixes a pointer bug. 

This file can be included in the distribution tar balls to allow people 
to build a package using rpmbuild -ta reiser4progs-XXXXXX.tar.gz.


--------------000603080904030804080609
Content-Type: text/plain;
 name="reiser4progs.spec"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4progs.spec"

%define file_version 20030826
%define enable_debug 1

%define _sbindir /sbin

Name: reiser4progs
Version: 0.4.12
Release: 1
Summary: Utilities for reiser4 filesystems
License: GPL
Group: System Environment/Base
URL: http://www.namesys.com/
Source: reiser4progs-%{file_version}.tar.gz
Patch0: reiser4progs-init-warnings.patch
BuildRequires: libaal-devel
BuildRequires: e2fsprogs-devel >= 1.34
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root

%description
Utilities for manipulating reiser4 filesystems.

%package devel
Summary: Development libraries and headers for developing reiser4 tools.
Group: Development/Libraries

%description devel
Development libraries and headers for developing reiser4 tools.

%prep
%setup -q
%patch0

%build
%configure \
%if %{enable_debug}
	--enable-debug \
%else
	--disable-debug \
%endif
	--enable-stand-alone \
	--disable-collisions-handling \
	--disable-plugins-check \
	--disable-fnv1-hash \
	--disable-rupasov-hash \
	--disable-tea-hash
make

%install
rm -rf $RPM_BUILD_ROOT
%makeinstall

%clean
rm -rf $RPM_BUILD_ROOT

%post -p /sbin/ldconfig

%postun -p /sbin/ldconfig

%files
%defattr(-,root,root)
%doc AUTHORS BUGS COPYING CREDITS INSTALL NEWS README THANKS TODO
%{_libdir}/libreiser4-0.4.so.*
%{_libdir}/libreiser4-alone-0.4.so.*
%{_libdir}/librepair-0.4.so.*
%{_sbindir}/cpfs.reiser4
%{_sbindir}/debugfs.reiser4
%{_sbindir}/fsck.reiser4
%{_sbindir}/make_reiser4
%{_sbindir}/measurefs.reiser4
%{_sbindir}/mkfs.reiser4
%{_sbindir}/resizefs.reiser4
%{_mandir}/man8/*.gz

%files devel
%{_includedir}/aux/*.h
%dir %{_includedir}/reiser4
%{_includedir}/reiser4/*.h
%{_includedir}/repair/*.h
%{_datadir}/aclocal/libreiser4.m4
%{_libdir}/libreiser4.*a
%{_libdir}/libreiser4-alone.*a
%{_libdir}/librepair.*a

%changelog
* Wed Aug 27 2003 David T Hollis <dhollis@davehollis.com>
- RPM package created

--------------000603080904030804080609
Content-Type: text/plain;
 name="reiser4progs-init-warnings.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4progs-init-warnings.patch"

--- plugin/format/format40/format40.c.orig	2003-08-27 18:06:18.672957280 -0400
+++ plugin/format/format40/format40.c	2003-08-27 18:09:30.305824656 -0400
@@ -220,7 +220,7 @@
 static errno_t callback_clobber_block(void *entity, blk_t start,
 				      count_t width, void *data) 
 {
-	blk_t blk;
+	blk_t blk=0;
 	errno_t res;
 	aal_block_t block;
 	format40_t *format;
--- librepair/filter.c.orig	2003-08-27 18:20:20.693950632 -0400
+++ librepair/filter.c	2003-08-27 18:21:05.918075520 -0400
@@ -560,7 +560,7 @@
 errno_t repair_filter(repair_filter_t *fd) {
 	repair_progress_t progress;
 	reiser4_fs_t *fs;
-	errno_t res;
+	errno_t res = 0;
 
 	aal_assert("vpf-536", fd != NULL);
 	aal_assert("vpf-814", fd->repair != NULL);
--- plugin/object/obj40/obj40_repair.c.orig	2003-08-28 09:41:40.585421760 -0400
+++ plugin/object/obj40/obj40_repair.c	2003-08-28 09:42:00.243433288 -0400
@@ -40,6 +40,8 @@
 	errno_t res;
 
 	aal_assert("vpf-1200", obj != NULL);
+
+	info = &obj->info;
 	
 	if (!info->start.plug) {
 		if (!obj->core->tree_ops.valid(info->tree, &info->start))

--------------000603080904030804080609--

