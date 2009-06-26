From: <doiggl@velocitynet.com.au>
Subject: reiser4.spec query in opensuse buildservice
Date: Fri, 26 Jun 2009 12:46:45 +1000
Message-ID: <d4603b7979e1bb9e9c0e0b96e0fe1713@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org

Hello
I have some questions about reiser4.spec for package reiser4-kmp package in
the opensuse buildservice 

Since the following has been released, does anything require changing in
the reiser4.spec i.e from .29 to .30. 
  reiser4-for-2.6.30.patch.bz2  

The last changelog entry says "Updated against 2.6.30-rc8" does that need
to reflect just 2.6.30
If so, can you update the reiser4.spec please.

Is the _rc8_ name part in compiled file
reiser4-kmp-debug-0.1_2.6.30_rc8_6-28.2.x86_64.rpm still required ?

sources:
https://build.opensuse.org/package/view_file?file=reiser4.spec&package=reiser4-kmp&project=drivers%3Afilesystems
http://reiser4.wiki.kernel.org/index.php/Main_Page
http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/reiser4-for-2.6.30.patch.bz2
http://download.opensuse.org/repositories/drivers:/filesystems/openSUSE_Factory/x86_64/reiser4-kmp-debug-0.1_2.6.30_rc8_6-28.2.x86_64.rpm

Thankyou Glenn

