From: Jeremy West <jkwest@gmail.com>
Subject: Re: reiser4 and reiserfs co-existence?
Date: Wed, 10 Nov 2004 01:04:44 -0500
Message-ID: <b28a886104110922046481965d@mail.gmail.com>
References: <b28a886104110808555d3f59dc@mail.gmail.com>
	 <1099933755.13138.4.camel@localhost>
	 <b28a886104110823161fe3a30d@mail.gmail.com>
	 <1099997754.1373.72.camel@tribesman.namesys.com>
	 <b28a886104110921518b5365b@mail.gmail.com>
Reply-To: Jeremy West <jkwest@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22339-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b28a886104110921518b5365b@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

Here is an error for you all.  From my /var/log/everything log.

-----------------------
Nov 10 00:30:01 [/usr/sbin/cron] (root) CMD (test -x /usr/sbin/run-crons && /usr
/sbin/run-crons )
                - Last output repeated 2 times -
Nov 10 00:50:58 [kernel] reiser4[g++(10858)]: check_dkeys (fs/reiser4/search.c:1
084)[vs-1199]
-----------------------

This happened while I was compiling a kernel, compiling kdeedu, and I
was listening to music through alsa.  While I was listening to music,
I restarted alsa.  The compiles both died, and one of them created a
zombie process.

Here is the output in one console as it was compiling kdeedu.  After I
noticed the build processes had stopped (by using "top" command), I
tried "ctrl-c" to kill the kdeedu compile.  Here is the last bit. 
This runaway build spawned the "zombie" proces.

---------------------
g++ -DHAVE_CONFIG_H -I. -I. -I../.. -I../.. -I/usr/kde/3.3/include
-I/usr/qt/3/include -I/usr/X11R6/include   -DQT_THREAD_SUPPORT 
-D_REENTRANT  -Wnon-virtual-dtor -Wno-long-long -Wundef -ansi
-D_XOPEN_SOURCE=500 -D_BSD_SOURCE -Wcast-align -Wconversion
-Wchar-subscripts -Wall -W -Wpointer-arith -Wwrite-strings -DNDEBUG
-DNO_DEBUG -O2 -O2 -march=athlon-xp -fomit-frame-pointer
-Wformat-security -Wmissing-format-attribute -fno-exceptions
-fno-check-new -fno-common -DQT_CLEAN_NAMESPACE -DQT_NO_ASCII_CAST
-DQT_NO_STL -DQT_NO_COMPAT -DQT_NO_TRANSLATION -D_GNU_SOURCE -c -o
ksfilereader.o ksfilereader.cpp
Caught signal 2 in pid 20302
Pid 20302 alreadly caught signal and is still cleaning up
Pid 20302 alreadly caught signal and is still cleaning up
-------------------------------
#uname -a
Linux homer1 2.6.9+reiser4 #1 Tue Nov 9 02:30:12 EST 2004 i686 AMD
Athlon(tm) XP 2600+ AuthenticAMD GNU/Linux

Jeremy West
//---------------------------
"I had a life once... now I have a computer and DSL"
