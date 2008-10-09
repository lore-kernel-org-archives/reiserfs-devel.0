From: doiggl@velocitynet.com.au
Subject: Question: Reiser4 and 2.6.27x kernel
Date: Thu, 9 Oct 2008 21:40:49 +1000 (EST)
Message-ID: <11024.202.168.22.19.1223552449.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello
A question for Jeff.

Q1. Is there a Reiser4 module(reiser4.ko) available for the 2.6.27-rc*
kernel ?, or will there be one made available for 2.6.27x kernel ?

I was looking for one at
http://download.opensuse.org/repositories/drivers:/filesystems/openSUSE_Factory/x86_64/

I tried to install the current version but failed.

# rpm -ivhU reiser4-kmp-default-0.1_2.6.26_11.4-22.11.x86_64.rpm
warning: reiser4-kmp-default-0.1_2.6.26_11.4-22.11.x86_64.rpm: Header V3
DSA signature: NOKEY, key ID 74de2879
error: Failed dependencies:
        kernel(default:vmlinux) = 214a1cfb3969f710 is needed by
reiser4-kmp-default-0.1_2.6.26_11.4-22.11.x86_64

# uname -a
Linux linux.site 2.6.27-rc7-12-default #1 SMP 2008-09-29 23:39:54 +0200
x86_64 x86_64 x86_64 GNU/Linux



