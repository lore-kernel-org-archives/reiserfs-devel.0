From: <doiggl@velocitynet.com.au>
Subject: How do you apply these patches  to kernel source code
Date: Mon, 12 May 2014 20:52:27 +1000
Message-ID: <1f2566482eb2fb37209738f0d84467b1@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
How do you apply these patches [1] to kernel source code ?.
So far I have applied this patch [2] to the kernel source code.

Do I save each as a txt .patch file and apply with command
# patch < patch.file

I using linux-3.14.tar.xz
--Thanks Glenn


[1]
[PATCHv3 1/5] reiser4: discard support: make space_allocator's
check_blocks() 
.
.
[PATCHv3 5/5] reiser4: discard support: downgrade all reiser4_log() to
reiser4_debug().

http://www.spinics.net/lists/reiserfs-devel/msg03886.html

[2]
reiser4-for-3.14.1.patch

