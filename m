From: Oleg Drokin <green@namesys.com>
Subject: datalogging and quota patches port to 2.4.21-pre6
Date: Thu, 20 Mar 2003 18:13:01 +0300
Message-ID: <20030320181301.A7170@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13303-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com, mason@suse.com

Hello!

   Ok, so I ported Chris' patches to 2.4.21-pre6 (should appear on your
   kernel.org mirror soon, have appeared in bk already).

   Patches are at
   ftp://namesys.com/pub/reiserfs-for-2.4/testing/data-logging-and-quota-2.4.21-pre6
   They are intend to replace similar named patches from Chris' ftp directory at
   ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21

   Also if you want to try these patches with 2.4.21-pre5-ac3,
   you only need to apply my 2.4.21-pre6 versions of 05-2.4.21-pre6-data-logging-36.diff.gz
   and 08-2.4.21-pre6-reiserfs-quota-26.diff.gz (but I have not tried this configuration yet).

   Enjoy.

Bye,
    Oleg
