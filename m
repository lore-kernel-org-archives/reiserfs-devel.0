From: Sebastian Kaps <seb-keyword-reiserfs.0462a0@toyland.sauerland.de>
Subject: Re: kernel: journal-1777: buffer 16 bad state  PREPARED  LOCKED
	!DIRTY  JDIRTY_WAIT
Date: Wed, 24 Mar 2004 10:42:51 +0100
Message-ID: <m3isgu7f8k.fsf@toyland.sauerland.de>
References: <m3hdwf96bm.fsf@toyland.sauerland.de>
	<1080047422.11061.610.camel@watt.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17427-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1080047422.11061.610.camel@watt.suse.com> (Chris Mason's
	message of "Tue, 23 Mar 2004 08:10:22 -0500")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi Chris!


> I've been trying to track this one down.  I think it is a harmless race
> between writepage and the journal code, I'm adapting that printk to
> ignore it.

Ok, than it's safe for me to ignore it? Good.

-- 
Ciao, Sebastian
