From: David Masover <ninja@slaphack.com>
Subject: Re: reiserfs and IDE write cache
Date: Fri, 18 Aug 2006 10:45:04 -0500
Message-ID: <44E5E080.5040603@slaphack.com>
References: <200608180922.23867.fjcabello@visual-tools.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29627-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608180922.23867.fjcabello@visual-tools.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Francisco Javier Cabello <fjcabello@visual-tools.com>
Cc: reiserfs-list@namesys.com

Francisco Javier Cabello wrote:
> Hello,
> I have been 'googling' and I have found a lot of people warning about the 
> problems with IDE write cache and journaling filesystems. 

These problems exist with ANY filesystem, journaling or not.  They also 
exist with no filesystem at all.

> Should I disable write cache in my systems using reiserfs3+2.4.25?

I'm not sure if it will help.  At least with IDE drives, I often cannot 
get the write cache disabled -- it's as if it ignores hdparm.

So, like Toby says, get a UPS.  Or get a laptop instead, if that makes 
any sense.
