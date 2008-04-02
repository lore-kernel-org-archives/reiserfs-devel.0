From: Ric Wheeler <ric@emc.com>
Subject: Re: bad block management
Date: Wed, 02 Apr 2008 09:31:00 -0400
Message-ID: <47F38A94.9000803@emc.com>
References: <002c01c894b3$c757b550$c755a8c0@jyotis>
Reply-To: ric@emc.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <002c01c894b3$c757b550$c755a8c0@jyotis>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jyotiv@tataelxsi.co.in
Cc: 'Edward Shishkin' <edward.shishkin@gmail.com>, 'Jeff Mahoney' <jeffm@suse.com>, 'Christian Kujau' <lists@nerdbynature.de>, reiserfs-devel@vger.kernel.org


jyotiv wrote:
> ok, i agree with u.
> Can I know why reiserfs is handling bag blocks?
> 
> Rgrds,
> Kgp
> 

Bad block handling in UNIX file systems is a really, really old feature (dating 
back to the 70's). I assume that reiserfs, when it was originally written still 
had some exposure to older drives of that era and assumed is was a useful 
feature to add.

Personally, I would not put this kind of feature into any new file system being 
written today ;-)

ric
