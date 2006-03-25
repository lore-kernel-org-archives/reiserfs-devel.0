From: Scott Dugas <dugass@rpi.edu>
Subject: rebuild-tree aborted
Date: Sat, 25 Mar 2006 15:57:39 -0500
Message-ID: <4425AEC3.5010100@rpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28343-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I have tried reiserfsck --rebuild-tree 11 times. Each time the pass 0 
finishes successfully, but has been improving (more or less) each time. 
Pass 1 fails. it fails on one of three different blocks each time 
(2785605, 9671269, or 48169048), but with different amounts left to 
scan. It returns the error:

The problem has occurred looks like a hardware problem (perhaps
memory). Send us the bug report only if the second run dies at
the same place with the same block number.

build_the_tree: Nothing but leaves are expected. Block 9671269 - unknown


I'm using reiserfsck 3.6.19 with gentoo kernel sources 2.6.14-r5. This 
is on an external drive (/dev/sda1).

is there any way to fix this?

--Scott
