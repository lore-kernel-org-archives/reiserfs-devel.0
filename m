From: Grant Miner <mine0057@mrs.umn.edu>
Subject: Autoconf error
Date: Mon, 28 Jul 2003 11:54:27 -0500
Message-ID: <3F255543.8010409@mrs.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15097-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi!
I am trying to compile reiser4progs from bk; I run 'prepare' and get 
this output

$ ./prepare
Running aclocal...
Running autoheader...
Running autoconf...
configure.in:44: error: possibly undefined macro: dnl
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.in:48: error: possibly undefined macro: AC_CHECK_LIB
configure.in:49: error: possibly undefined macro: AC_MSG_ERROR
configure.in:54: error: possibly undefined macro: AC_CHECK_HEADER
configure.in:58: error: possibly undefined macro: AC_MSG_CHECKING
configure.in:60: error: possibly undefined macro: AC_TRY_LINK_FUNC
configure.in:61: error: possibly undefined macro: AC_MSG_RESULT
configure.in:73: error: possibly undefined macro: AC_TRY_RUN

then run configure and get:

$ ./configure
checking build system type... i686-pc-linux
checking host system type... i686-pc-linux
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking whether make sets $(MAKE)... yes
checking for working aclocal-1.4... found
checking for working autoconf... found
checking for working automake-1.4... found
checking for working autoheader... found
checking for working makeinfo... found
./configure: line 1827: syntax error near unexpected token `;;'
./configure: line 1827: `        ;;'


$ autoconf --version
autoconf (GNU Autoconf) 2.57

any ideas?


