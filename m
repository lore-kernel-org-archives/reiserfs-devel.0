From: Chris wakefield <c_wakefield@shaw.ca>
Subject: R4 won't mount.
Date: Tue, 20 Jan 2004 18:30:23 -0800
Message-ID: <400DE43F.4070502@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-16594-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello.
I'm trying out R4, and I'm having no luck mounting the device with the 
R4 filesystem.
I've managed to compile libaal from /FIXED/ (./configure;make;make install).
reiser4progs-0.4.20 is compiled with:
 --disable-debug --disable-fnv1-hash --disable-rupasov-hash 
--disable-tea-hash --disable-deg-hash --disable-short-keys 
--disable-specia --with-libaal=/usr/local/lib
then:  make;make install

My problem is, that after making a R4 filesystem on a partition, it 
won't mount.  I've tried various options, but still doesn't work.
I wonder if I am missing something?
I'm running debian testing on an athlon64
Can someone suggest some options or strategies?
Thank you,
Chris w.



