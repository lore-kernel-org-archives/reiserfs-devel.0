From: Oleg Drokin <green@namesys.com>
Subject: Re: recovery of crashed reiserfs disk?
Date: Sat, 18 Jan 2003 11:51:42 +0300
Message-ID: <20030118115142.B21932@namesys.com>
References: <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12432-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030118080941.B5575@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ookhoi <ookhoi@humilis.net>
Cc: Francois-Rene Rideau <fare@tunes.org>, reiserfs-list@namesys.com

Hello!

On Sat, Jan 18, 2003 at 08:09:41AM +0100, Ookhoi wrote:

> Dunno if you got an answer already. My mail is a bit slow atm.
> I think you can copy your data to the 120GB disk, reiserfsck it, and
> mount it. 
> You can dd /dev/hdc4 with 
> dd if=/dev/hdc4 of=/largedir/largefile conv=noerror
> where /largedir is a directory on another disk.

This is only partly true.
We found that only conv=noerror produces HDD images with
bad sectors siply skipped. This is not acceptable.
You need to use dd_rescue tool that is developed at SuSE I think.

> If that doesn't work, you could try ddrescue:
> http://www.garloff.de/kurt/linux/ddrescue/

In fact don't even try plain dd ;)

Bye,
    Oleg
