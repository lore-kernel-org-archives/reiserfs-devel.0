From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: mmotm 2009-02-10-16-35 uploaded (reiser4-quota)
Date: Wed, 11 Feb 2009 18:53:21 -0800
Message-ID: <20090211185321.138bb93a.akpm@linux-foundation.org>
References: <499305AD.4020900@oracle.com>
	<20090211171324.GC13817@duck.suse.cz>
	<20090212114737.C8EA.KOSAKI.MOTOHIRO@jp.fujitsu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090212114737.C8EA.KOSAKI.MOTOHIRO@jp.fujitsu.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Cc: Jan Kara <jack@suse.cz>, Randy Dunlap <randy.dunlap@oracle.com>, linux-kernel@vger.kernel.org, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

On Thu, 12 Feb 2009 11:49:20 +0900 (JST) KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com> wrote:

> Andrew, recently I've never seen any reiser4 activity in LKML.
> I would suggest to remove it from -mm.

A handful of people use it, and the cost of carrying it is pretty low.

Hey, at least it handles ENOSPC without going BUG().
