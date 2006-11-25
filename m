From: "Clemens Eisserer" <linuxhippy@gmail.com>
Subject: Re: Possible interference between reiser4 and usb-storage?
Date: Sat, 25 Nov 2006 10:17:14 +0100
Message-ID: <194f62550611250117j30835681o8d824812f60f5dca@mail.gmail.com>
References: <194f62550611191252l612ac827tc2f0e581d01be46a@mail.gmail.com>
	 <Pine.LNX.4.64.0611250538370.16392@sheep.housecafe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30217-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.64.0611250538370.16392@sheep.housecafe.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi again,

> ..."after some time", so right after mkfs df(1) is telling the truth?
> Does it drop to 52MB all of a sudden or does it decrease slowly? does it
> happen with other/former kernels too?
Well the cable was bad - it worked well on another computer but on
mine it lead to usb read failures.
It never drops to 52mb, it gros to a 55GB disk, this happened as soon
as I got messages about invalid fat read operations on syslog. (caused
by the usb problems)

> Does it happen without the tweak? Why are you using -O3 anyway, does it
> really make a difference?
Don't know since it works now. Well under normal circumstances I guess
-O3 does not make much difference (since kernel is much more "generic"
code instead of numbercrunching stuff) but since I use cryptocompress
at least reiser4 is crunching numbers ;)

lg Clemens

PS: I am really impressed about the stability of reiser4 - I never
ever had a single problem. However performance is terrible with
cryptocompress enabled:
- Drive does way too much seeks
- Directory listing is slow - a directory listing using konqueror
takes about 10s the first time I open konqueror (with 148files/folders
in it), the second time its as fast as it should.
- Writes block sometimes the system, nerving while watching video or
playing games.
- Delete operations sometimes take a lot of time (deleting a e.g.
500mb video file).

lg Clemens
