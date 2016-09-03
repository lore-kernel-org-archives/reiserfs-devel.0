From: <doiggl@velocitynet.com.au>
Subject: libaal and reiser4progs-1.1.0 # ./configure
Date: Sat, 03 Sep 2016 19:43:03 +1000
Message-ID: <786e5ff8ba849a53dab5447eecdc7537@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org


Whats missing/broken ?
--Glenn

-installed


# rpm -qa |grep -i libaal |sort
libaal-1_0-6-1.0.6-106.1.x86_64
libaal-devel-1.0.6-106.1.x86_64
libaal-devel-1.0.6-106.1.x86_64
libaal-devel-1.0.6-106.1.x86_64
libaal-devel-static-1.0.6-106.1.x86_64
libaal-minimal0-1.0.6-106.1.x86_64

/tmp/reiser4progs-1.1.0 # ./configure
.
.
checking for _FILE_OFFSET_BITS value needed for large files... no
configure: WARNING: Can't detect right _FILE_OFFSET_BITS. Will be forced
to 64bit.
checking size of off_t... 8
checking for aal_device_open in -laal... yes
checking aal/libaal.h usability... yes
checking aal/libaal.h presence... yes
checking for aal/libaal.h... yes
checking for libaal version = 1.0.6... no
#
