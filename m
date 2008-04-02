From: Ric Wheeler <ric@emc.com>
Subject: Re: bad block management
Date: Wed, 02 Apr 2008 06:43:58 -0400
Message-ID: <47F3636E.9070003@emc.com>
References: <000801c8947d$0a28fba0$c755a8c0@jyotis>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <000801c8947d$0a28fba0$c755a8c0@jyotis>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jyotiv@tataelxsi.co.in
Cc: 'Edward Shishkin' <edward.shishkin@gmail.com>, 'Jeff Mahoney' <jeffm@suse.com>, 'Christian Kujau' <lists@nerdbynature.de>, reiserfs-devel@vger.kernel.org


jyotiv wrote:
> Thanks a lot.
> 
> Modern disk drives manages the bad blocks(sectors).
> 
> We are keeping in mind that hard drive, the  user is using may not be
> modern.
> In such case this bad block management at file system level is help ful.
> 
> And for modern hard drives it is helpful only after reserved sector for
> remapping are exhasted.
> 
> 
> UDF what we have implemented is for hard disk with high capacity.
> Thank you every body.
> 
> Rgrds,
> Kgp
> 

I think that you will not see many drives still running that don't 
handle bad block remapping.

Best of luck!

Ric
