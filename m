From: <doiggl@velocitynet.com.au>
Subject: fsck.reiser4 query
Date: Tue, 28 Jun 2011 12:31:03 +1000
Message-ID: <99758203da18f9de8e42eadebeadc4a8@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
I have some questions.

1. Is there any possibility of speeding up the command proocess #
fsck.reiser4 --build-fs /dev/xxx 
Could the metadata be loaded into ram and processed their or is the
process entirly disk bound by I/O ?
2. Also will there a reiser4-for-2.6.39.patch in the future ?
Thanks Glenn
