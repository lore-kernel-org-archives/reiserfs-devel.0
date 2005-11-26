From: "Christian" <evilninja@gmx.net>
Subject: Re: reiser3 in cryptoloop
Date: Sat, 26 Nov 2005 23:39:23 +0100 (CET)
Message-ID: <24356.195.126.66.126.1133044763.squirrel@housecafe.dyndns.org>
References: <fe11eda90511240754k2ae211e8j9d1be51c43465171@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-27148-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <fe11eda90511240754k2ae211e8j9d1be51c43465171@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Martin Sarsale <martin@malditainternet.com>
Cc: reiserfs-list@namesys.com

On Thu, November 24, 2005 16:54, Martin Sarsale wrote:
> Every 2 or 3 days, I receive an email from pdumpfs saying
> "pdumpfs: File exists - /opt/backup/2005/11/04"


can you reproduce this without the (crypto)loop setup? e.g. setting up a
bogus directory and make snapshots over some days and watch, if you get
these errors too. that way one could rule out any interference with the
loopdevice.

if you can, please use a current kernel too.

thank you,
Christian.
-- 
make bzImage, not war

