From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [LOCKDEP linux-2.6.27-rc7] reiserfs circular locking
Date: Wed, 24 Sep 2008 22:14:25 +0100
Message-ID: <20080924221425.3b4939ba@lxorguk.ukuu.org.uk>
References: <4807377b0809241139x18ea8ce4x7dbc66ba680be3e7@mail.gmail.com>
	<48DA8D27.5080908@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <48DA8D27.5080908@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Jesse Brandeburg <jesse.brandeburg@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, arjan@linux.intel.com, reiserfs-devel@vger.kernel.org, peterz@infradead.org

> I have a reiserfs patch set that should address this. I haven't
> submitted it recently because I'm chasing down a reiserfs bug report
> that may or may not be related to the patch set.
> 
> You can grab the patch set out of an opensuse kernel src rpm.

Jeff: See also bugzilla.kernel.org #9136 which seems to match

BTW - does anyone have a view where the existing reiserfs bugs should be
assigned as they are currently assigned to namesys...

Alan

