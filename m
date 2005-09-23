From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: Reiser4 hang -- bad sectors on disk
Date: Fri, 23 Sep 2005 11:50:54 +0300
Message-ID: <200509231150.54137.rmeijer@internet.gr>
References: <200509221245.39730.rmeijer@internet.gr> <200509230942.03727.rmeijer@internet.gr> <4333BE65.6070009@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26255-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4333BE65.6070009@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Friday 23 September 2005 11:35, Vladimir V. Saveliev wrote:

Hi Vladimir,

> Ray, you might want to try to mount reiser4 with -o
> onerror=remount-ro This may help to avoid some of oopses

I'll try this.

> You need new hard drive.

I already have one (an old 80GB) but the broken one is 200GB and less 
than 1 year old :(


Thanks,

Ray
