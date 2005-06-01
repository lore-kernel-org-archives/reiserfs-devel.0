From: Aaron Porter <atporter@lbl.gov>
Subject: Re: reiser4 on large block devices
Date: Wed, 1 Jun 2005 10:27:03 -0700
Message-ID: <20050601172703.GL30437@lbl.gov>
References: <20050531184241.GJ30437@lbl.gov> <200506011642.33434.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24267-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200506011642.33434.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

On Wed, Jun 01, 2005 at 04:42:33PM +0400, Vitaly Fertman wrote:

> would you try this patch for libaal-1.0.4?

	mkreiser4 completes without errors now, but attempting to mount
the filesystem gives:

ReiserFS: sda3: warning: sh-2021: reiserfs_fill_super: can not find reiserfs on sda3

