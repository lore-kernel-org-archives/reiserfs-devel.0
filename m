From: Oleg Drokin <green@namesys.com>
Subject: Re: Hard disk crash and solution
Date: Thu, 6 Feb 2003 13:21:29 +0300
Message-ID: <20030206132129.A19968@namesys.com>
References: <IKENJBHCILNPNAGHKCHFOEDMCCAA.Art@chello.nl> <b11do3$74q$1@satsuki.furryterror.org> <b11do3$74q$1@satsuki.furryterror.org> <3E37B9DC.20103@namesys.com> <b1sjc6$uf9$1@satsuki.furryterror.org> <3E423155.7080107@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12660-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E423155.7080107@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

Hello!

On Thu, Feb 06, 2003 at 12:56:37PM +0300, Hans Reiser wrote:

> Oleg, please see if you can construct a faq entry warning against the 
> particular known bad hard drives.

Hmm...
Something like

Q: Are there any recomendation pro or against any particular hard drive manufacturers
for using with reiserfs?

A: There is basically no preference, general "the faster the drive is and less seek time
is better" rule applies as always. On the other side almost every harddrives manufacturer
have a "widely known" broken series of harddrives. The most recent example is
IBM's "Deskstar" series disks, especially DTLA models produced in Hungary 200-2001. These 
are known to fail very often. Also other Deskstar drives are seems to be not very good
choice. IBM released a note that deskstar drives should not run for more then 8 hours/day
on average. These drives are also known to be very sensitive to temperature conditions
and known to fail on overheat. There is class action lawsuit against IBM on that drives
series in progress. 

Bye,
    Oleg
