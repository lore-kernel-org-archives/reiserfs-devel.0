From: Cliff White <cliffw@osdl.org>
Subject: Reiser4 - small test results
Date: Wed, 13 Nov 2002 12:50:26 -0800
Message-ID: <200211132050.gADKoQQ12656@mail.osdl.org>
Return-path: <reiserfs-list-return-11986-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@namesys.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, cliffw@osdl.org, wookie@osdl.org

Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
--------
Quick progress note, i've made some. 
Have succeeding in building the latest snapshot against 2.5.47.
Am doing some initial small tests (LTP disktest code) on IDE disk,
 then will move
tests to SCSI RAID array. 

First results are..interesting. Reads are fast, writes are slow.
However, these first tests are very small and somewhat contrived,
so i am not posting numbers yet.

Results detail is at: http://www.osdl.org/archive/cliffw/reiser/index.html

cliffw

