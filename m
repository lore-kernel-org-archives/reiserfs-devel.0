From: =?UTF-8?B?U3TDqXBoYW5lIEpvdXJkb2lz?= <kwisatz@rubis.org>
Subject: [Fwd: Re: Data being corrupted on reiserfs 3.6]
Date: Mon, 16 Jan 2006 21:03:15 +0100
Message-ID: <43CBFC03.7040603@rubis.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030504020900080909070702"
Return-path: <reiserfs-list-return-27749-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------030504020900080909070702
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Sorry, I forgot to Cc: the list on reply.
2nd message follow.
-- 

 ///  Stephane Jourdois     /"\  ASCII RIBBON CAMPAIGN \\\
(((    Consultant securite  \ /    AGAINST HTML MAIL    )))
 \\\   24 rue Cauchy         X                         ///
  \\\  75015  Paris         / \    +33 6 8643 3085    ///


--------------030504020900080909070702
Content-Type: message/rfc822;
 name="Re: Data being corrupted on reiserfs 3.6"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="Re: Data being corrupted on reiserfs 3.6"

Message-ID: <43C98FEF.2090100@rubis.org>
Date: Sun, 15 Jan 2006 00:57:35 +0100
From: =?UTF-8?B?U3TDqXBoYW5lIEpvdXJkb2lz?= <kwisatz@rubis.org>
User-Agent: Mozilla Thunderbird 1.0.7 (X11/20051017)
X-Accept-Language: fr, en
MIME-Version: 1.0
To: Michael Barnwell <xterminate@xterminate.me.uk>
Subject: Re: Data being corrupted on reiserfs 3.6
References: <43C97E17.7030604@xterminate.me.uk>
In-Reply-To: <43C97E17.7030604@xterminate.me.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

Michael Barnwell a écrit :

> I'm experiencing data corruption when creating or copy data to my
> reiserfs 3.6 partition mounted under /home. The following extract
> gives a pretty clear indication that it's getting corrupted somewhere.
> [..]
> I'm running Debian Sarge on an Athlon XP 2200+, /dev/md2 is made up of
> four 400GB SATA hard disks on a Silicon Image 3114 controller in RAID
> 5. Dmesg is showing no errors what so ever, the RAID array has been
> stable since I installed it a couple of weeks ago and the drive was
> formatted with mkfs.reiserfs with no special options.

I experienced similar corruptions on reiserfs over software RAID5,
amd64. It has been stable for several weeks before beginning to corrupt
data, and oopsing because of reiserfs corruptions.
(fsck.reiserfs --rebuild-tree helped to power up the box for less than a
day before next oops).
I since have buyed a controller that does hardware raid5.

-- 
 ///  Stephane Jourdois     /"\  ASCII RIBBON CAMPAIGN \\\
(((    Consultant securite  \ /    AGAINST HTML MAIL    )))
 \\\   24 rue Cauchy         X                         ///
  \\\  75015  Paris         / \    +33 6 8643 3085    ///



--------------030504020900080909070702--
