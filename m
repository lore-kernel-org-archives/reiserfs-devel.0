From: "Jesper Juhl" <jesper.juhl@gmail.com>
Subject: 2.6.18-rc3 - ReiserFS - warning: vs-8115: get_num_ver: not directory or indirect item
Date: Sun, 30 Jul 2006 15:08:32 +0200
Message-ID: <9a8748490607300608v65ce3bdcsbb47273bb82a2d6c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29268-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Hans Reiser <reiser@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

I just got a warning message with 2.6.18-rc3 that I've never seen before :

  ReiserFS: sda4: warning: vs-8115: get_num_ver: not directory or indirect item

The message showed up twice in dmesg during two parallel "make -j3"
builds of the 2.6.18-rc3 kernel source in two sepperate directories.
I've tried to reproduce it but without luck.

It would be nice if someone could tell me what the message means and
wether or not I should be worried about it.

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
