From: Oleg Drokin <green@namesys.com>
Subject: Re: How to build a big file server
Date: Thu, 5 Jun 2003 12:46:43 +0400
Message-ID: <20030605084643.GA5869@namesys.com>
References: <1054800852.1997.15.camel@wusel.schnulli.de> <20030605083301.GB4849@vestdata.no>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14411-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030605083301.GB4849@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ragnar Kj?rstad <reiserfs@ragnark.vestdata.no>
Cc: Heinz-Josef Claes <hjclaes@web.de>, reiserfs-list@namesys.com

Hello!

On Thu, Jun 05, 2003 at 10:33:01AM +0200, Ragnar Kj?rstad wrote:
 
> My guess is that the writes to the journal _would_ be a problem, and
> that writing them to a seperate (RAID1)-device would help significantly.

And with journal on battery-backed RAM it would be even faster ;)

Bye,
    Oleg
