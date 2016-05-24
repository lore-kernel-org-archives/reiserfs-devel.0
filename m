From: Georgios Tsalikis <georgios@tsalikis.net>
Subject: Two Reiser4 FSs in the same HDD cause head seek panic?
Date: Tue, 24 May 2016 11:58:53 +0300
Message-ID: <ni15m1$hf6$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

I happened to format a rootfs partition and another one for /home with 
Reiser4. It proved to be a disaster. Apart from the slow boot times 
(expected from this drive) even after reaching a functional GUI the 
disk kept doing I/O  like crazy. When /home became Btrfs the issue 
ceased. My other computer that uses an entire drive formatted with 
Reiser4 is nice and silent as well.

