From: =?iso-8859-1?Q?Oscar_Garc=EDa?= <ogarcia@atlasit.com>
Subject: Re: Problem with ReiserFS + NFS + Convolo (more)
Date: Sat, 14 Jun 2003 14:55:22 +0200
Message-ID: <006901c33274$38a57af0$1501a8c0@int.atlassolutions.net>
References: <006101c33273$5a065c60$1501a8c0@int.atlassolutions.net> <20030614125058.GA447@namesys.com>
Reply-To: =?iso-8859-1?Q?Oscar_Garc=EDa?= <ogarcia@atlasit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14544-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com, eramos@atlasit.com

Hi,

I think the previous errors where corruptions on the filesystem due to the
sudden restart of the system...

I'll tell you how it evolves :-)

----- Original Message ----- 
From: "Oleg Drokin" <green@namesys.com>
To: "Oscar Garc?a" <ogarcia@atlasit.com>
Cc: <reiserfs-list@namesys.com>; <eramos@atlasit.com>
Sent: Saturday, June 14, 2003 2:50 PM
Subject: Re: Problem with ReiserFS + NFS + Convolo (more)


> Hello!
>
> On Sat, Jun 14, 2003 at 02:49:08PM +0200, Oscar Garc?a wrote:
>
> > Following the previous email, I also got this errors (some time ago).
The side effects (uptime, processes blocking, no service) are exactly the
same, as well as the setup. Are they related to the the last one?
>
> No, this is something different.
> Let us know if you see something after your update to 2.4.20
> (also it would be good if you do reiserfsck --check (use latest reiserfsck
version)
> after kernel upgrade to rule out stale corruptions).
>
> Bye,
>     Oleg
>

