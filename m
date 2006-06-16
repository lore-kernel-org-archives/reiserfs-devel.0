From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfschk --rebuild-tree was aborted, said disk was full
Date: Fri, 16 Jun 2006 16:08:27 +0400
Message-ID: <1150459707.6381.21.camel@tribesman.namesys.com>
References: <44910927.5030500@oddjob.se>
	 <1150359868.6313.23.camel@tribesman.namesys.com>
	 <44912841.3050609@oddjob.se>
	 <1150368757.6313.31.camel@tribesman.namesys.com>
	 <44926B02.1040802@oddjob.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28800-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44926B02.1040802@oddjob.se>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Johan Isacsson <johan@oddjob.se>
Cc: reiserfs-list@namesys.com

Hello

On Fri, 2006-06-16 at 10:25 +0200, Johan Isacsson wrote:
> That seemed to do the trick, I'm past pass 1 now, it's now on pass 2.
> How long is this pass supposed to take compared to pass 0 and pass 1?
> Pass 0 took about 8 hours and pass 1 maybe 4 hours.
> 
> Right now it says left 31, 0/sec, is that alright?

it is possible to imagine corruptions which make pass 2 very slow.
How does it progress?

There is a new reiserfsck version which is supposed to work faster with
such corruptions.
You may want to try it:
ftp://ftp.namesys.com/pub/tmp/reiserfsprogs-3.6.20.tar.gz

> 
> Regards,
> Johan Isacsson

