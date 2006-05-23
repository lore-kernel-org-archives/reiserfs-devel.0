From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: quicker mount
Date: Tue, 23 May 2006 20:07:22 +0400
Message-ID: <1148400442.6343.16.camel@tribesman.namesys.com>
References: <20060427143635.GA5949@gelma.net> <4450D85E.50109@suse.com>
	 <4450DBDB.5060209@dermichi.com> <4450E63C.5080306@suse.com>
	 <445671EA.5050305@suse.com> <4456D65D.1050607@suse.com>
	 <20060523144319.GA25889@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28666-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060523144319.GA25889@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Vier <tmv@comcast.net>
Cc: Jeff Mahoney <jeffm@suse.com>, reiserfs-list@namesys.com

Hello

On Tue, 2006-05-23 at 10:43 -0400, Tom Vier wrote:
> What about reiserfs4? I just tried a 250gig raid1 and it r4 takes even
> longer than 3. Is it also preloading all bitmaps? No other fs that i've
> tried takes so long to mount.
> 
reiser4 has mount option for that.
please try mount -o dont_load_bitmap

