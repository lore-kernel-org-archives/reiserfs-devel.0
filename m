From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: file as a directory
Date: Mon, 22 Nov 2004 20:05:25 +0100 (MET)
Message-ID: <Pine.LNX.4.53.0411222002380.21595@yvahk01.tjqt.qr>
References: <2c59f00304112205546349e88e@mail.gmail.com>
 <200411221759.iAMHx7QJ005491@turing-police.cc.vt.edu> <41A23566.6080903@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-22511-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41A23566.6080903@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Hans Reiser <reiser@namesys.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

>>(Hint - "file as directory" broke a number of programs that didn't
>>expect that a file *could* be a directory, when run on a reiser4
>>filesystem...)
>
>It broke extraordinarily few.

(The fewer the better.)

That's good news, and frankly, I did not expect anything else. That's because
either programs definitely know that "it" is a file/directory because they just
mkdir'ed or so, or they implement correct error checks, e.g. the user just
created a directory and we check back (i.e. race protection).

What I am worried about is the opendir() libc call, which AFAIK does this:
  fd = open("directory", myflags | O_DIRECTORY)

OTOH, I'm not worried, because it should be the user's duty to check whether
directory really is one or not. Anything else is sloppy programming.
(Exception: taking argv[xx] from the user)


Cheers,
Jan Engelhardt
-- 
Gesellschaft für Wissenschaftliche Datenverarbeitung
Am Fassberg, 37077 Göttingen, www.gwdg.de
