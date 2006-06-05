From: =?UTF-8?B?RnJpZWRlciBCw7xyemVsZQ==?= <linux-stuff@arcor.de>
Subject: Re: reiser4 for 2.6.16 (version 3)
Date: Tue, 06 Jun 2006 01:15:25 +0200
Message-ID: <4484BB0D.60507@arcor.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28739-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: reiserfs-list@namesys.com

Vladimir V. Saveliev wrote:
> Hello
>
> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.16/reiser4-for-2.6.16-3.patch.gz 
> contains the most recent reiser4 code which is considered stable 
> inside Namesys.
> This code is supposed to be in mm kernel next to 2.6.17-rc4-mm3.
>
> Please try it. Any feedback is welcome.
>
>
>   
Hi,

so far reiser4-for-2.6.16-[3|4].patch.gz runs great here, but I've 
recongised that when building a java-project with netbeans I got this 
output in the netbeans message-window:


init:
�����������
���������
������������������������������������������������
--snip--


instead of what I was used to see before with 
reiser4-for-2.6.16-2.patch.gz:

init:
deps-jar:
compile:
To run this application from the command line without Ant, try:
--snip--


This seems very weird to me. I can't imagine that this could be issued 
by the filesystem so I just build "clean" kernels with the "working and 
non-working" patch. But problem still persist.

system info:
(default-linux/x86/2005.1, gcc-4.1.0, glibc-2.3.6-r4, 2.6.16 i686)
=================================================================
System uname: 2.6.16 i686 AMD Athlon(tm) XP 2100+
Gentoo Base System version 1.6.14

Sun JDK 1.5.0.05 [sun-jdk-1.5]
netbeans-5.0


thx

Frieder

