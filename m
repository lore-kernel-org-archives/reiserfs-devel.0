From: Oleg Drokin <green@namesys.com>
Subject: Re: rebuild-tree hangs
Date: Mon, 14 Apr 2003 09:22:18 +0400
Message-ID: <20030414092218.A27531@namesys.com>
References: <20030411015312.GA20912@coloppl> <200304111356.18574.vitaly@namesys.com> <20030411121321.2a3686b2.philippe.gramoulle@mmania.com> <200304111620.27377.vitaly@namesys.com> <20030411161443.6ebc8b71.philippe.gramoulle@mmania.com> <3E998ADA.2080502@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13656-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E998ADA.2080502@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Philippe Gramoull? <philippe.gramoulle@mmania.com>, Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

Hello!

On Sun, Apr 13, 2003 at 08:05:46PM +0400, Hans Reiser wrote:

> >Personally, i always build reiserfsck statically for the reasons i 
> >mentioned above but i'm sure
> >there are other environments that would require the smallest tools.
> Most people boot from CDROMS now, so Philippe's suggestion seems like a 
> good one to me.

We agreed with Vitaly that he will implement "--build-fsck-statucally" kind of configure 
switch for those who want static fack. Aternatively we can change it to build always
static fsck, unless "--build-fsck-dynamically" kind of configure switch is supplied.

Bye,
    Oleg
