From: Oleg Drokin <green@namesys.com>
Subject: Re: "reiserfs_rename: could not remove old name"
Date: Tue, 23 Jul 2002 09:23:14 +0400
Message-ID: <20020723092314.A4567@namesys.com>
References: <3D3C2960.9050503@broadnet-mediascape.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11075-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3D3C2960.9050503@broadnet-mediascape.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Olaf Zaplinski <o.zaplinski@broadnet-mediascape.de>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jul 22, 2002 at 05:48:48PM +0200, Olaf Zaplinski wrote:

> "ReiserFS version 3.5.35(w/quota support)" patch for 2.2.21
> Does somebody know what this means?

It means opeartion of removing directory item containing old name
have failed for some reason. (it was made as "hidden" first, though).
You may schedule reiserfsck run some time in the future to kill that
stale name and ensure that FS is in correct state.

Bye, 
    Oleg
