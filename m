From: Tupshin Harper <tupshin@tupshin.com>
Subject: small problem configuring and installing reiser4progs
Date: Tue, 26 Aug 2003 18:11:06 -0700
Message-ID: <3F4C052A.2010200@tupshin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15447-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs List <reiserfs-list@namesys.com>

I just downloaded and installed reiser4progs-0.4.12 and libaal-0.4.9. 
This was the first install of either of these, and I ran into the 
following problem:
configured and make installed libaal-0.4.9
configure of reiser4progs ends with the following:
checking whether -falign-loops works... yes
checking for aal_device_open in -laal... yes
checking aal/aal.h usability... yes
checking aal/aal.h presence... yes
checking for aal/aal.h... yes
checking for libaal version = 0.4.9... no

It ends there, without any indication that there was a fatal error, but 
it didn't build the Makefiles. So, two problems...insufficient error 
reporting, as well as a slight problem with the process. After running 
ldconfig, configure works just fine.

-Tupshin



