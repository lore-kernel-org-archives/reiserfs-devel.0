From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: 12 Feb 2003 22:42:39 -0500
Message-ID: <b2f47f$oms$1@satsuki.furryterror.org>
References: <200302121515.46953.russell@coker.com.au> <11104354750.20030212144219@tnonline.net> <200302121515.46953.russell@coker.com.au> <46110589437.20030212162613@tnonline.net>
Return-path: <reiserfs-list-return-12737-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <46110589437.20030212162613@tnonline.net>,
Anders Widman  <andewid@tnonline.net> wrote:
>The  others  want to make Linux a viable option for "normal" users and
>want Linux to be able to replace Windows or Mac OS. The only way I see
>that happen is if Linux starts to get more userfriendly and safe.

Last time I checked, Windows and Mac OS come to a near total halt when
they see a disk error while doing a write on non-removable media, unless
the application goes to extraordinary lengths to handle the error itself.

Frankly, I used to mount my ext3 filesystems on servers with
'errors=panic', causing a reboot at the very first sign of trouble (past
tense as I now use reiserfs which doesn't like that option ;-).
The sooner the server goes out of production and starts running fsck,
the sooner it will finish running fsck and come back into production
(or, in the worst case, the sooner an admin person will start pulling
out backup tapes and ordering replacement disks).


-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
