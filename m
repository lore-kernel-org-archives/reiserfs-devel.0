From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: [PATCH] Re:
 http://www.namesys.com/snapshots/2004.07.13-internal.testing/
Date: Tue, 13 Jul 2004 12:54:01 +0200
Message-ID: <20040713125401.1ac99b7f@philou.gramoulle.local>
References: <200406150022.34578.vitaly@namesys.com>
	<200407131427.58912.vitaly@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="Multipart=_Tue__13_Jul_2004_12_54_01_+0200_mHzGquLY3OeqcN2/"
Return-path: <reiserfs-list-return-19595-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407131427.58912.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Multipart=_Tue__13_Jul_2004_12_54_01_+0200_mHzGquLY3OeqcN2/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Hello Vitally,

I needed the following patch in order to compile reiser4progs-0.5.6 correctly.

Thanks,

Philippe

On Tue, 13 Jul 2004 14:27:58 +0400
Vitaly Fertman <vitaly@namesys.com> wrote:

  | Hello All,
  | 
  | This snapshot contains updated reiser4progs-0.5.6 and libaal-0.5.3.
  | Grub patch is the same.
  | 
  | It includes many bug fixes against the previous snapshot, also 
  | improved gauges and user wanrnings and some speedups.
  | 
  | and again, it should be used with the last auto reiser4 snapshots 
  | only as the latest 'stable' reiser4 snapshot (2004.03.26) does not 
  | support plugin sets in StatDatas.
  | 
  | -- 
  | Thanks,
  | Vitaly Fertman
  | 
  | 

--Multipart=_Tue__13_Jul_2004_12_54_01_+0200_mHzGquLY3OeqcN2/
Content-Type: text/plain;
 name="gauge.c.diff"
Content-Disposition: attachment;
 filename="gauge.c.diff"
Content-Transfer-Encoding: 7bit

--- gauge.c.orig	2004-07-13 12:51:10.000000000 +0200
+++ gauge.c	2004-07-13 12:50:00.000000000 +0200
@@ -4,7 +4,7 @@
    gauge.c -- common for all progs gauge metods. */
 
 #ifndef ENABLE_STAND_ALONE
-#include <aal/aal.h>
+#include <aal/libaal.h>
 #include <aux/gauge.h>
 
 aal_gauge_handler_t aux_gauge_handlers[GT_LAST];


--Multipart=_Tue__13_Jul_2004_12_54_01_+0200_mHzGquLY3OeqcN2/--
