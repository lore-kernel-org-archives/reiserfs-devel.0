From: Christophe Saout <christophe@saout.de>
Subject: Re: raid0 and rfs4
Date: Tue, 13 Jan 2004 12:34:02 +0100
Message-ID: <1073993642.6832.1.camel@leto.cs.pocnet.net>
References: <1073970028.20855.18.camel@www.vox.net>
	 <16387.51811.609993.908345@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16473-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16387.51811.609993.908345@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: reiserfs-list@namesys.com

Am Di, den 13.01.2004 schrieb Nikita Danilov um 11:37:

> Hmm, probably raid is not happy that reiser4 sends so large bios to it.

You must call the queue->merge_bvec_fn to ask how big you can make your
bio.


