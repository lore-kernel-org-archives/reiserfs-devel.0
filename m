From: Stefan Fritsch <sfritsch@ph.tum.de>
Subject: Performance problem with reiserfs3
Date: Wed, 23 Jun 2004 10:43:09 +0200
Message-ID: <200406231043.09667.sfritsch@ph.tum.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19304-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi!

The program mp3gain (found at http://mp3gain.sf.net or in Debian sid) 
has some strange way of updating a file that causes ReiserFS to be a 
factor of 10-20 slower than XFS or EXT3 (tested with 2.6.5, 2.6.7, 
2.4.26):

------------------- ReiserFS:
$ time mp3gain -g -1 b.mp3
Applying gain change of -1 to b.mp3...

done

real    0m2.777s
user    0m0.053s
sys     0m2.712s
-------------------
------------------- XFS:
$ time mp3gain -g -1 b.mp3
Applying gain change of -1 to b.mp3...

done

real    0m0.192s
user    0m0.043s
sys     0m0.143s
-------------------

strace reveals that it does LOTS of

read(3, ""..., 131072) = 131072
_llseek(3, -98038, [33034], SEEK_CUR)   = 0
write(3, "\271\263", 2)                 = 2
_llseek(3, 0, [0], SEEK_SET)            = 0
read(3, ""..., 131072) = 131072
_llseek(3, -98031, [33041], SEEK_CUR)   = 0
write(3, "W6", 2)                       = 2
_llseek(3, 0, [0], SEEK_SET)            = 0
read(3, ""..., 131072) = 131072
_llseek(3, -98023, [33049], SEEK_CUR)   = 0
write(3, "&\314", 2)                    = 2
_llseek(3, 0, [0], SEEK_SET)            = 0

Can/should this be fixed in reiserfs? It is a _huge_ performance 
difference between reiser and xfs. Or do you consider this way of 
writing to a file just too stupid? (Mp3gain can write to a temp file 
instead, which is much faster.)


Cheers,
Stefan
-- 
