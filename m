From: Georgios Tsalikis <georgios@tsalikis.net>
Subject: 2 minutes for a reiser4 filesystem to mount.
Date: Thu, 22 Oct 2015 20:38:15 +0300
Message-ID: <n0b6ql$6t4$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

The filesystem is 1.7GB large, lies in a GPT patition and is formated 
with -o node=node41 without any other override. The kernel is 4.2.3 with 
the 4.2.2 patch.
I tried the same on a 250MB partition and it mounts instantly. dmesg 
shows nothing special
Any ideas? Thanks in advance. :)

