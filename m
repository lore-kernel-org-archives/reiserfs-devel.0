From: Esben Stien <b0ef@esben-stien.name>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 18:07:41 +0100
Message-ID: <87is6jpvdu.fsf@quasar.esben-stien.name>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>
	<m38y7gx8kq.fsf@merlin.emma.line.org>
	<20041230235911.4911a20c.hihone@bigpond.net.au>
	<m3sm5nj2ef.fsf@merlin.emma.line.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22955-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3sm5nj2ef.fsf@merlin.emma.line.org> (Matthias Andree's
 message of "Thu, 30 Dec 2004 15:18:00 +0100")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Cc: hihone@bigpond.net.au, reiserfs-list@namesys.com

Matthias Andree <ma@dt.e-technik.uni-dortmund.de> writes:

> All private machines I deal with are reiserfs-free as of a few hours
> ago.

What do you use instead?

I really don't like that there is no undelete feature in reiserfs -
it's not planned for reiserfs-4 either. I see desperate users all the
time trying to get back what they mistakenly removed. It shouldn't be
hard with reiserfs either. There should be a selection of what files
to restore, so we can avoid the file merging problem with rebuilding
the tree from leaf nodes.

> I have seen too many bugs in reiserfs3.

Is there a list of these current issues?

> "Who cares, not us for the past five years" is not a proper response
> to a real-world problem.

I also reacted to this response. 

A flaw in the filesystem, in my opinion, is equivalent to the space
ship crashing and all crew members die.

-- 
Esben Stien is b0ef@esben-stien.name
http://www.esben-stien.name
irc://irc.esben-stien.name/%23contact
[sip|iax]:b0ef@esben-stien.name
