From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Mon, 9 Aug 2004 21:59:35 +0400
Message-ID: <20040809175934.GI9811@backtop.namesys.com>
References: <4116BEED.8050804@namesys.com> <20040809024233.2557A15D98@mail03.powweb.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20098-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040809024233.2557A15D98@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Dabbs <david@dabbs.net>
Cc: 'Hans Reiser' <reiser@namesys.com>, 'ReiserFS List' <reiserfs-list@namesys.com>

On Sun, Aug 08, 2004 at 09:38:29PM -0500, David Dabbs wrote:
> 
> 
> One other somewhat related FYI. In the recent fibration discussion you
> thought it would probably be good to make FIBRATION_EXT_1 the default
> fibration plugin instead of FIBRATION_DOT_O, but dot-O is still the default:
> 
> 	[PSET_FIBRATION] = {
> 		.type = REISER4_FIBRATION_PLUGIN_TYPE,
> 		.id   = FIBRATION_DOT_O
> 	},

mkfs.reiser4 sets the fs-wide default fibration plugin.

> David
> 

-- 
Alex.
