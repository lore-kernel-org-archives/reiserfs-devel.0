From: Gorazd Golob <gorazdg@noviforum.si>
Subject: Re: need opinions from sysadmins on where reiser4progs should install
Date: Sun, 13 Nov 2005 16:37:03 +0100 (CET)
Message-ID: <Pine.LNX.4.61.0511131634070.8075@dacun.noviforum.si>
References: <4376E891.6070506@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26923-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4376E891.6070506@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>


re!

I guess that according to LSB it's the only way - to install it into 
/usr/local/sbin - because it's additional installed software and does not 
come with default distribution.
If reiser4progs is package included in distribution then it should be 
installed /sbin or /usr/sbin.

that's my opinion - lsb is covering that topic as I know.

gorazd



On Sat, 12 Nov 2005, Hans Reiser wrote:

> currently it installs mkfs.reiser4 and such in /usr/local/sbin
>
> This is not found by default paths for most roots, and seems unlikely to
> be where I would want it to go if I was sysadmin....  I would never
> install mkfs.anything unless I wanted it in /sbin.....  but then I am
> not a professional....
>
> What do the sysadmins on the list think?
>
> Hans
>
>
>
