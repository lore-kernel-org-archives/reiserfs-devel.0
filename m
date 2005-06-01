From: Adrian Ulrich <reiser4@blinkenlights.ch>
Subject: Re: reiser4 on large block devices
Date: Wed, 1 Jun 2005 19:56:05 +0200
Message-ID: <20050601195605.4d77ad11.reiser4@blinkenlights.ch>
References: <20050531184241.GJ30437@lbl.gov>
	<200506011642.33434.vitaly@namesys.com>
	<20050601172703.GL30437@lbl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24269-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050601172703.GL30437@lbl.gov>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


> ReiserFS: sda3: warning: sh-2021: reiserfs_fill_super: can not find
> reiserfs on sda3

Ehrm, This sounds like Reiser3,
does your kernel support Reiser4? Maybe you should use modprobe?



-- 
 We're working on it, slowly but surely...or not-so-surely in the spots
we're not so sure...               -- Larry Wall
