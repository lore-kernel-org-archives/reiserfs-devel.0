From: David T Hollis <dhollis@davehollis.com>
Subject: RPM spec file for libaal
Date: Thu, 28 Aug 2003 12:55:47 -0400
Message-ID: <3F4E3413.30108@davehollis.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060309020908050503090701"
Return-path: <reiserfs-list-return-15471-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs List <reiserfs-list@namesys.com>

--------------060309020908050503090701
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This can be included in the libaal package to allow users to build it 
with rpmbuild -ta libaal-XXXXX.tar.gz.  If there is desire, I could 
produce a patch that would allow configure to embed the proper version 
in the spec file to help automate future releases.

--------------060309020908050503090701
Content-Type: text/plain;
 name="libaal.spec"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libaal.spec"

%define file_version 20030826
%define enable_debug 1

Name: libaal
Version: 0.4.9
Release: 1
Epoch:   1
Summary: Abstraction library for ReiserFS utilities
License: GPL
Group: Development/Libraries
URL: http://www.namesys.com/
Source: libaal-%{file_version}.tar.gz
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root

%description
This is a library that provides application abstraction mechanism.
It include device abstraction, libc independence code, etc.

%package devel
Summary: Headers and static libraries for developing with libaal.
Group: Development/Libraries

%description devel
This package includes the headers and static libraries for developing
with the libaal library.

%prep
%setup -q

%build
BUILD_OPTS="--enable-stand-alone"
%if %{enable_debug}
BUILD_OPTS="$BUILD_OPTS	--enable-debug"
%endif

%configure \
%if %{enable_debug}
	--enable-debug \
%endif
	--enable-stand-alone
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
%{_libdir}/libaal-0.4.so.*
%{_libdir}/libaal-alone.so.*

%files devel
%defattr(-,root,root)
%{_libdir}/libaal.so
%{_libdir}/libaal.*a
%{_libdir}/libaal-alone.so
%{_libdir}/libaal-alone.*a
%dir %{_includedir}/aal
%{_includedir}/aal/*
%{_datadir}/aclocal/libaal.m4

%changelog
* Wed Aug 27 2003 David T Hollis <dhollis@davehollis.com>
- RPM package created

--------------060309020908050503090701--

