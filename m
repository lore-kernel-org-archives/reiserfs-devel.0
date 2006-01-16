From: =?UTF-8?B?U3TDqXBoYW5lIEpvdXJkb2lz?= <kwisatz@rubis.org>
Subject: [Fwd: Re: Data being corrupted on reiserfs 3.6]
Date: Mon, 16 Jan 2006 21:04:14 +0100
Message-ID: <43CBFC3E.2040900@rubis.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010909040501070207010402"
Return-path: <reiserfs-list-return-27750-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------010909040501070207010402
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Same excuses for forgetting CC: on first post.

-- 
 ///  Stephane Jourdois     /"\  ASCII RIBBON CAMPAIGN \\\
(((    Consultant securite  \ /    AGAINST HTML MAIL    )))
 \\\   24 rue Cauchy         X                         ///
  \\\  75015  Paris         / \    +33 6 8643 3085    ///


--------------010909040501070207010402
Content-Type: message/rfc822;
 name="Re: Data being corrupted on reiserfs 3.6"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="Re: Data being corrupted on reiserfs 3.6"

Message-ID: <43CA1E84.3060807@rubis.org>
Date: Sun, 15 Jan 2006 11:05:56 +0100
From: =?UTF-8?B?U3TDqXBoYW5lIEpvdXJkb2lz?= <kwisatz@rubis.org>
User-Agent: Mozilla Thunderbird 1.0.7 (X11/20051017)
X-Accept-Language: fr, en
MIME-Version: 1.0
To: Michael Barnwell <xterminate@xterminate.me.uk>
Subject: Re: Data being corrupted on reiserfs 3.6
References: <43C97E17.7030604@xterminate.me.uk> <43C98FEF.2090100@rubis.org> <43C9917A.4020009@xterminate.me.uk>
In-Reply-To: <43C9917A.4020009@xterminate.me.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Michael Barnwell a écrit :

> Is it just a problem with reisferfs and RAID 5 do you know? I can't
> really afford a hardware RAID 5 controller, so using ext3 maybe more
> sensible for me.

It seems to occur only with reiserfs over raid5. Other filesystems seems
to be less vulnerable.
It must be a raid5 issue, because I never had a problem using reiserfs
on a real disk.

I saw several reports like yours, I reported this myself one year ago,
and I don't know if raid guys
investigated this issue.

You could try to reproduce the problem without reiserfs, using dd on the
raid5 device without any filesystem. This for sure would tie the problem
with raid5 and could help debugging this problem. I know that reiserfs
tends to write very fast, and observed this issue only when copying
large files.

Sorry for the bad news.

-- 
 ///  Stephane Jourdois     /"\  ASCII RIBBON CAMPAIGN \\\
(((    Consultant securite  \ /    AGAINST HTML MAIL    )))
 \\\   24 rue Cauchy         X                         ///
  \\\  75015  Paris         / \    +33 6 8643 3085    ///



--------------010909040501070207010402--
