From: <doiggl@velocitynet.com.au>
Subject: how can I identify  un-corrupted files on r4 partition
Date: Sat, 04 Jun 2011 16:31:27 +1000
Message-ID: <16a1726a0dbbb9ffa9fe7758d2b04b81@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
How can I list out files on a reiser4 partition which are ok to copy to
another partition?
i.e the ones with NO corruption in metadata or on disk. 
The partition has a mixture of corrupted and un-corrupted files.

I plan to copy the  files off which are ok  , then reformt the disk.

How can that be done ?
Thanks Glenn
