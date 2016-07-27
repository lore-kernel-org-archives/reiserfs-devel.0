From: Georgios Tsalikis <georgios@tsalikis.net>
Subject: Reiser4 extremely slow at deleting.
Date: Wed, 27 Jul 2016 20:51:19 +0300
Message-ID: <nnasaq$lpq$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

It is almost always like this. For example a directory with 2.5GB of 
large files takes about 2 minutes. Right now i am deleting a large 
directory with small files, I didn't keep the numbers before running, 
but they are many directories with source code. Could it be 
fragmentation? And how could I mitigate it? Thanks


