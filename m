From: Aaron Porter <atporter@lbl.gov>
Subject: Re: reiser4 on large block devices
Date: Wed, 1 Jun 2005 13:17:11 -0700
Message-ID: <20050601201711.GM30437@lbl.gov>
References: <20050531184241.GJ30437@lbl.gov> <200506011642.33434.vitaly@namesys.com> <20050601172703.GL30437@lbl.gov> <20050601195605.4d77ad11.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24273-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20050601195605.4d77ad11.reiser4@blinkenlights.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Ulrich <reiser4@blinkenlights.ch>
Cc: reiserfs-list@namesys.com

On Wed, Jun 01, 2005 at 07:56:05PM +0200, Adrian Ulrich wrote:
> 
> > ReiserFS: sda3: warning: sh-2021: reiserfs_fill_super: can not find
> > reiserfs on sda3
> 
> Ehrm, This sounds like Reiser3,
> does your kernel support Reiser4? Maybe you should use modprobe?

	You would be correct. I had assumed 2.6.11.* defaulted to reiser4.
Everything seems to be working now.
