From: Hans Reiser <reiser@namesys.com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 12:08:13 -0800
Message-ID: <41D4602D.2050609@namesys.com>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>	<m38y7gx8kq.fsf@merlin.emma.line.org>	<20041230235911.4911a20c.hihone@bigpond.net.au>	<m3sm5nj2ef.fsf@merlin.emma.line.org> <87is6jpvdu.fsf@quasar.esben-stien.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22976-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87is6jpvdu.fsf@quasar.esben-stien.name>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Esben Stien <b0ef@esben-stien.name>
Cc: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>, hihone@bigpond.net.au, reiserfs-list@namesys.com

Esben Stien wrote:

>
>I really don't like that there is no undelete feature in reiserfs -
>it's not planned for reiserfs-4 either.
>
Blame Linus for that.  I would put it in, but he thinks it belongs in 
userspace.  I may still put it in someday and just not tell him.;-)  
I'll just let the users know about it and not him.;-)

> I see desperate users all the
>time trying to get back what they mistakenly removed. It shouldn't be
>hard with reiserfs either. There should be a selection of what files
>to restore, so we can avoid the file merging problem with rebuilding
>the tree from leaf nodes.
>  
>

