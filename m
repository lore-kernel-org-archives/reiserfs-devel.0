From: Voicu Liviu <liviu.voicu@huji.ac.il>
Subject: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 00:11:14 +0200
Message-ID: <200302280011.14488.liviu.voicu@huji.ac.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12958-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi guys,

I have beed working on my gentoo using ext3 for all partitions so then I have 
heard that ReiserFS is much better/faster and indeed it is BUT since I 
switched to ReiserFS I can't do:
Code:
# nice -n -20 emerge some_app_name

The idea is I can do this BUT can't do any thing else...notice to your self 
that I never had this problem while using ext3.

While I have used ext3 I could do "nice -n -10 emerge some_app" and also use 
xfree+xfce4 without problems but with ReiserFS if I do use value less than 0 
for "nice" then the cpu jumps to 100% usage and blocks me out from doing 
something else :-(

Any clue what is going on?
Maybe ReiserFS uses the cpu harder?

(
I have to fix the CPU usage icon_sad.gif I makes me crazy...simple emerge 
loads the CPU to 90 ~ 95%
)

INFO:
-------
$ uname -a
Linux localhost.localhomain 2.4.20-ck3 #1 Thu Feb 27 22:09:05 IST 2003 i686 
Intel(R) Pentium(R) 4 CPU 1.50GHz GenuineIntel GNU/Linux
(default-x86-1.4, gcc-3.2.2, glibc-2.3.1-r2)

My kernel is vanilla-sources from kernel.org and with the following patches:
$ ls
001_o1_pe_ll_021215_ck_2.4.20.patch.bz2    008_vh_021217_ck_2.4.20.patch.bz2
002_aavm_021215_ck_2.4.20.patch.bz2        010_tune_021217_ck_2.4.20.patch.bz2
003_rl2_021215_ck.2.4.20.patch.bz2         011_vt_021217_ck_2.4.20.patch.bz2
005_supermount_021215_ck_2.4.20.patch.bz2  13_gcc31-compile-optimizations
007_acpi_021215_ck_2.4.20.patch.bz2

COMPILER="gcc3"
CHOST="i686-pc-linux-gnu"
CFLAGS="-march=pentium4 -O3 -pipe -fomit-frame-pointer -mfpmath=sse"
CXXFLAGS="-march=pentium4 -O3 -pipe -fomit-frame-pointer -mfpmath=sse"

Best Regards

-- 
Voicu Liviu

Hebrew University of Jerusalem
Rothberg International School
Assistant Programmer & Network Support
