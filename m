From: Oleg Drokin <green@namesys.com>
Subject: Re: Quota
Date: Wed, 25 Jun 2003 14:28:25 +0400
Message-ID: <20030625102825.GA24561@namesys.com>
References: <59107826456.20030625182200@almakor.ru>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14694-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <59107826456.20030625182200@almakor.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SteelRat <steelrat@almakor.ru>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Jun 25, 2003 at 06:22:00PM +0800, SteelRat wrote:

> Can you help me.
> How can i set quotas to reiserfs?

Patches for recent kernels (2.4.21+) are available at
ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21
Patches for 2.4.20 are available at
ftp://namesys.com/pub/reiserfs-for-2.4/testing/quota-2.4.20

Apply the patches, recompile your kernel with quota support, upgrade your quota
tools if needed and follow directions from Quota-HOWTO.

Bye,
    Oleg
