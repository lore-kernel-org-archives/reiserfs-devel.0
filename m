From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: SOLVED: snapshot 2004.03.26 + linux 2.6.5 = build error
Date: Mon, 5 Apr 2004 16:47:38 +0300
Message-ID: <200404051647.38637.rmeijer@internet.gr>
References: <20040404161030.GA21978@raptus.homelinux.org> <200404051540.58430.rmeijer@internet.gr> <16497.21749.932806.34057@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17722-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16497.21749.932806.34057@laputa.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Monday 05 April 2004 15:45, Nikita Danilov wrote:

> Try this:
>
> ----------------------------------------------------------------------
> ===== as_ops.c 1.69 vs edited =====
[...]
> ===== plugin/item/tail.c 1.167 vs edited =====
[...]
> ----------------------------------------------------------------------

This patch worked indeed. I formatted and mounted a Reiser4 partition under 
kernel 2.6.5.


Thanks,

Ray
