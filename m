From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: Hard disk crash and solution
Date: 26 Jan 2003 14:42:59 -0500
Message-ID: <b11do3$74q$1@satsuki.furryterror.org>
References: <IKENJBHCILNPNAGHKCHFOEDMCCAA.Art@chello.nl>
Return-path: <reiserfs-list-return-12490-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <IKENJBHCILNPNAGHKCHFOEDMCCAA.Art@chello.nl>,
Niek <Art@chello.nl> wrote:
>Title: IBM DTLA 307045 Hard disk crash
>
>I bought this disk (46 GB) about two years ago. One of the best they
>claimed.
[...]
>What is the fucking MBTF of these drives?? Is it close to one year like I
>experienced?

My employer used a total of 13 of these drives (various sizes, but all the
same family) for RAID arrays.  We originally purchased 10, and replaced
the first 3 to die under IBM warranty.  After the first 3, we started
replacing dead disks with some other brand of drive.  In the end 9 of the
IBM drives died.  Some days two or three disks would fail at a time.
We didn't bother waiting for the last 4, but presumably they would have
died if we hadn't replaced all of them.  We took the rest of them apart
to use as cubicle wall decorations, shaving mirrors, etc.

Even worse, for about 6 hours before some of them died, they randomly
flipped a few bits here and there in the data, which made RAID 
redundancy useless.

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
