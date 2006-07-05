From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Tue, 04 Jul 2006 19:37:34 -0700
Message-ID: <44AB25EE.8030702@namesys.com>
References: <1151602916.32453.40.camel@ipso.snappymail.ca>	 <1151608355.6335.79.camel@tribesman.namesys.com>	 <1151612146.11510.4.camel@ipso.snappymail.ca>	 <44A55271.7050501@namesys.com>  <44A55591.6060500@suse.com> <1152059846.30139.11.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28907-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1152059846.30139.11.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Mike Benoit <ipso@snappymail.ca>, "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

Mike Benoit wrote:

>Hi Jeff,
>
> I just tried the patch you suggested and it didn't make a difference.
>The load still spikes as soon as the free space falls below ~10%.
>
>
Jeff, please audit your code for what happens when all the bitmap blocks
reach 90% full.  Could you discuss your design and code in that regard
for our benefit?

Mike, thanks so much for going to this much effort.  It is rather likely
this is a problem affecting many users.

Hans

