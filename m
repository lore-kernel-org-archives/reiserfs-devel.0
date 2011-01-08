From: Sebastian Hyrwall <sh@keff.org>
Subject: Negative blocks in rebuild-tree
Date: Sat, 08 Jan 2011 14:31:54 +0100
Message-ID: <4D28674A.60603@keff.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Hi

I am getting a negative block-number with reiserfsck when doing 
--rebuild-tree -S (or without -S). This causes a segmentation fault 
later (pass 2) in the check because it tries to read a "non-existant 
block". My rebuild takes 3 days and i didn't copy the stdout-info the 
first time so I will post some more info as soon as it becomes available.

Pass 0:
####### Pass 0 #######
The whole partition (-710934672 blocks) is to be scanned
Skipping 117586 blocks (super block, journal, bitmaps) -711052258 blocks 
will be read

Does anyone have any idea on how to fix this?

On a 64-bit system.

Sincerely,
Sebastian H
