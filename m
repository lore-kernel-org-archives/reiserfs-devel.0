From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions
Date: Fri, 27 Jun 2003 14:18:34 +0200
Message-ID: <3EFC361A.4030009@g-house.de>
References: <20030624131904.GA460@namesys.com> <3EF86928.7080504@g-house.de> <20030624151940.GC21845@namesys.com> <3EF888B2.4000900@g-house.de> <3EF8EFF0.6020207@g-house.de> <20030625054031.GA11576@namesys.com> <3EF9A0F6.4030401@g-house.de> <3EF9E939.1050501@g-house.de> <20030626092608.GA12252@namesys.com> <3EFAE933.6040206@g-house.de> <20030627092821.GA29715@namesys.com>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14727-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030627092821.GA29715@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Oleg Drokin schrieb:
> Well, there is really a pattern.
> Each 4k of data you copy us placed in its own 8k page (the rest 4k are freed).
> But I really cannot see how that may happen! It simply cannot, I'd say.

i put some more info about this alpha on the very same web-address, 
alpha machines differ much, maybe it's just this kind of alpha (Avanti) 
showing this behaviour...

> Would you mind to try 2.5.72 with the following patch, and copy some file under
> 128k in size to some reiserfs filesystem and see if any warnings were
> produced. (if they are, show me what were those warnings).
> Also check that files are still corrupted.

yes, of course.

Thanks,
Christian.

