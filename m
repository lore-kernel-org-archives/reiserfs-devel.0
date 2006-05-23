From: Hans Reiser <reiser@namesys.com>
Subject: [PATCH] updated reiser4 - reduced cpu usage for writes by writing
 more than 4k at a time (has implications for generic write code and eventually
 for the IO layer)
Date: Tue, 23 May 2006 13:14:54 -0700
Message-ID: <44736D3E.8090808@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751225AbWEWUPA@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>
Cc: Linux Kernel Mailing List <Linux-Kernel@Vger.Kernel.ORG>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>, Nate Diller <ndiller@namesys.com>

ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.17-rc4-mm1/reiser4-for-2.6.17-rc4-mm1-2.patch.gz

The referenced patch replaces all reiser4 patches to mm.  It revises the
existing reiser4 code to do a good job for writes that are larger than
4k at a time by assiduously adhering to the principle that things that
need to be done once per write should be done once per write, not once
per 4k.  That statement is a slight simplification: there are times when
due to the limited size of RAM you want to do some things once per
WRITE_GRANULARITY, where WRITE_GRANULARITY is a #define that defines
some moderate number of pages to write at once.  This code empirically
proves that the generic code design which passes 4k at a time to the
underlying FS can be improved.  Performance results show that the new
code consumes  40% less CPU when doing "dd bs=1MB ....." (your hardware,
and whether the data is in cache, may vary this result).  Note that this
has only a small effect on elapsed time for most hardware.

The planned future(as discussed with akpm previously):  we will ship
very soon (testing it now) an improved reiser4 read code that does reads
in more than little 4k chunks.  Then we will revise the generic code to
allow an FS to receive the writes and reads in whole increments.  How
best to revise the generic code is still being discussed.  Nate is
discussing doing it in some way that improves code symmetry in the io
scheduler layer as well, if there is interest by others in it maybe a
thread can start on that topic, or maybe it can wait for him+zam to make
a patch.

Note for users: this patch also contains numerous important bug fixes.
