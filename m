From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: About direntries pointing to nowhere on reiserfs problem in 2.4
Date: 24 Feb 2003 22:45:18 -0500
Message-ID: <b3eose$crj$1@satsuki.furryterror.org>
References: <20030220175309.A23616@namesys.com> <b3dluc$n39$1@satsuki.furryterror.org> <b3dluc$n39$1@satsuki.furryterror.org> <200302242159.15769.vitaly@namesys.com>
Return-path: <reiserfs-list-return-12900-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <200302242159.15769.vitaly@namesys.com>,
Vitaly Fertman  <vitaly@namesys.com> wrote:
>> Reiserfsck takes 53 hours to scan everything on some of my machines,
>> which is a long time considering that I already know where all the
>> missing direntries are since they are recorded in various error log files.
>
>which version of reiserfsprogs do you use? and is this in the rebuild-tree mode?
>if it is, 3.6.5-pre1 had a speedup for pass0. 

This is 3.6.5-pre1 in --fix-fixable mode.  600 GB of data, average file size
12K.  It currently takes about 8-10 days to dump all of the data to tape.

>P.S. btw, I am going to release a new version of fsck which has some on-boot 
>time checks. Is it possible to try it on your big partitions to fugure out 
>if it takes less then a few seconds?

I could probably fit in a few short tests.

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
