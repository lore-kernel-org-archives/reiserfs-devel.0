From: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Subject: Re: BUG: Replaying ReiserFS log causes hard lockup
Date: Thu, 25 Mar 2004 19:51:58 +0100
Message-ID: <m3lllohi9d.fsf@merlin.emma.line.org>
References: <20040325204836.07bcf910.a.nielsen@optushome.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17473-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040325204836.07bcf910.a.nielsen@optushome.com.au> (Adam
 Nielsen's message of "Thu, 25 Mar 2004 20:48:36 +1000")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adam Nielsen <a.nielsen@optushome.com.au>
Cc: reiserfs-list@namesys.com

Adam Nielsen <a.nielsen@optushome.com.au> writes:

> The drive itself is a Western Digital SATA drive, connected via an
> onboard Silicon Image 3512A (which uses the under-development sil3112
> (I think) driver, so I guess there's a chance it could be the driver's
> fault, however I have not had any problems at all before this.)  The
> board itself is a Gigabyte GA-7N400 Pro 2 (rev 2.0) with an nForce 2
> chipset.

CMD/Silicon Image hardware, at least the SATA stuff, is said to be utter
crap, with hardware bugs that require workaround and all that. Get the
latest 2.6 kernel you can fish (-bk variants included) and retry in the
hope the more recent kernel already has the needed workaround.

Better yet, ditch SATA, buy SCSI, that will actually work and perform
well. Linux SATA support hasn't quite made it from the cradle.

-- 
Matthias Andree

Encrypt your mail: my GnuPG key ID is 0x052E7D95
