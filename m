From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: reiserfs + notail
Date: Wed, 7 Apr 2004 13:07:05 +0200
Message-ID: <200404071307.05885.Dieter.Nuetzel@hamburg.de>
References: <4073DEEF.3030906@mweb.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17780-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4073DEEF.3030906@mweb.co.za>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Cami <camis@mweb.co.za>

Am Mittwoch, 7. April 2004 12:58 schrieb Cami:
> Hi All,
>
> Can anyone tell me if mounting a reiserfs parition notail
> will improve disk writes/performance or space?
> Whats the advantages and disadvantages of notail?

tails
* save space (group little files into blocks)
* should speed things up

So in reality (Reiser 3.x.x) ;-)

notail

* speed things up
* but waste some space

Reiser4 show both benefits.

Greetings,
	Dieter
