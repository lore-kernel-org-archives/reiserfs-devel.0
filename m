From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: snapshot 2004.03.26 + linux 2.6.5 = build error
Date: Mon, 5 Apr 2004 16:06:41 +0300
Message-ID: <200404051606.41099.rmeijer@internet.gr>
References: <20040404161030.GA21978@raptus.homelinux.org> <200404051540.58430.rmeijer@internet.gr> <16497.21749.932806.34057@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17719-reiserfs=m.gmane.org@namesys.com>
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

> ===== as_ops.c 1.69 vs edited =====
> ===== plugin/item/tail.c 1.167 vs edited =====

Patch applied, and I got only 2 warnings:

fs/reiser4/plugin/cryptcompress.c:2269: warning: `cut_items_cryptcompress' 
defined but not used

fs/reiser4/plugin/disk_format/disk_format40.c:65: warning: 
`get_format40_formatting_policy' defined but not used

The machine will be rebooted in a little while. I'll keep you posted.


Thanks,

Ray
