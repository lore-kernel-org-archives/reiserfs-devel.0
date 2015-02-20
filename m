From: <doiggl@velocitynet.com.au>
Subject: Re: help wanted add-node41.patch fails to apply to reiser4progs version 1.0.9
Date: Fri, 20 Feb 2015 12:02:11 +1100
Message-ID: <c889d4bb783dfeb04663b277628e126f@mail.velocitynet.com.au>
References: <a6ad8c02cd6dcddc95b2d7e25d42f35c@mail.velocitynet.com.au> <CAM12Q5R3HCPNjL+wnX6wqXfbCM9F1n_cLLD2rGQcGLgM8Soxew@mail.gmail.com> <cb14e1389131b5cb6ed38b89ed0bf005@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <cb14e1389131b5cb6ed38b89ed0bf005@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Need to figure out the next bit in relation to autoreconf.

shows in buildlog as:
[   83s] + autoreconf
[   85s] aclocal: warning: autoconf input should be named 'configure.ac',
not 'configure.in'
[   85s] configure.in:196: warning: macro 'AM_ENABLE_SHARED' not found in
library
[   85s] configure.in:313: warning: macro 'AM_PROG_LIBTOOL' not found in
library

[1]
asked here:
http://lists.opensuse.org/opensuse-packaging/2015-02/msg00069.html

reply here:
http://lists.opensuse.org/opensuse-packaging/2015-02/msg00071.html

--Glenn
