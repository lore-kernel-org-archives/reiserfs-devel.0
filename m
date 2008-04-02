From: "jyotiv" <jyotiv@tataelxsi.co.in>
Subject: RE: bad block management
Date: Wed, 2 Apr 2008 16:52:03 +0530
Message-ID: <002c01c894b3$c757b550$c755a8c0@jyotis>
References: <47F3636E.9070003@emc.com>
Reply-To: <jyotiv@tataelxsi.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <47F3636E.9070003@emc.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Ric Wheeler' <ric@emc.com>
Cc: 'Edward Shishkin' <edward.shishkin@gmail.com>, 'Jeff Mahoney' <jeffm@suse.com>, 'Christian Kujau' <lists@nerdbynature.de>, reiserfs-devel@vger.kernel.org

ok, i agree with u.
Can I know why reiserfs is handling bag blocks?

Rgrds,
Kgp

-----Original Message-----
From: Ric Wheeler [mailto:ric@emc.com]
Sent: Wednesday, April 02, 2008 4:14 PM
To: jyotiv@tataelxsi.co.in
Cc: 'Edward Shishkin'; 'Jeff Mahoney'; 'Christian Kujau';
reiserfs-devel@vger.kernel.org
Subject: Re: bad block management



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

The information contained in this electronic message and any attachments to this message are intended for the exclusive use of the addressee(s) and may contain proprietary, confidential or privileged information. If you are not the intended recipient, you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately and destroy all copies of this message and any attachments contained in it.

Contact your Administrator for further information.

