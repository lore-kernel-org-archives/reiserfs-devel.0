From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions -- oooh!
Date: Fri, 20 Jun 2003 16:14:31 +0200
Message-ID: <3EF316C7.7010209@g-house.de>
References: <3EF07AFB.8060303@g-house.de> <20030618152626.GA17240@namesys.com> <3EF0A8E8.2000209@g-house.de> <20030619054535.GA23852@namesys.com> <3EF20728.2080905@g-house.de> <3EF2F315.2080306@g-house.de> <20030620122946.GA24875@namesys.com>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14643-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030620122946.GA24875@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Oleg Drokin schrieb:
>>lila:~# cp -a /lib/ /var/cache/apt-proxy/temp/ | wc -l
>>    329
>>lila:~#
> 
> Was /var/cache/apt-proxy/temp/ empty before copying?

yes.

> "diff -r" will emit "only in PATH" message for each file present only
> in one compared dir, so if you have some extra files at the destination,
> thisis kind of expected.

yes, i know. see, the severity is really as strong as it seems. there 
are no "only in path" msg, but "file1 and file1 differ" messages.


> Ok, I am looking into this.
> In fact this "non-matching blocks" stuff is not dangerous to actual data.

are you sure? when even "diff" says that the files are different, the 
data is wrong in some way.

under /lib are modeuls, inserting them is fine. however, the copied 
files (modules) gaive only a segfault!

Thanks,
Christian.

> I am interested in what will happen if you'd do a cp -a/diff -r on a
> freshly formatted reiserfs, will there be any differences?
> (and send me output of diff in this case.)

will do later.



