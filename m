From: Oleg Drokin <green@namesys.com>
Subject: Re: Quotas aand 2.5.x
Date: Wed, 15 Jan 2003 12:46:29 +0300
Message-ID: <20030115124629.A30051@namesys.com>
References: <20030114182217.4fa8f2f8.philippe.gramoulle@mmania.com> <20030114203842.A18999@namesys.com> <3E2451B0.1020905@namesys.com> <20030115104306.51404b4c.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12354-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030115104306.51404b4c.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe Gramoull? <philippe.gramoulle@mmania.com>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, mason@namesys.com

Hello!

On Wed, Jan 15, 2003 at 10:43:06AM +0100, Philippe Gramoull? wrote:

> Actually, right now, we still have that nasty bug every time we run quotacheck that prenvent us from enabling them on several filerservers which is a big problem right now (that's on 2.4.x)

Have you tried 2.4. without Chris' datalogging patched, but with original short
overflow fix?

Bye,
    Oleg
