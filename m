From: Esben Stien <b0ef@esben-stien.name>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 20:29:26 +0100
Message-ID: <87is6jmvop.fsf@quasar.esben-stien.name>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>
	<m38y7gx8kq.fsf@merlin.emma.line.org>
	<20041230235911.4911a20c.hihone@bigpond.net.au>
	<m3sm5nj2ef.fsf@merlin.emma.line.org>
	<87is6jpvdu.fsf@quasar.esben-stien.name>
	<20041230174732.GB5206@favonius>
	<87zmzvoeeo.fsf@quasar.esben-stien.name>
	<20041230183046.GD5206@favonius>
	<87d5wroc9a.fsf@quasar.esben-stien.name>
	<20041230192111.GF5206@favonius>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22975-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041230192111.GF5206@favonius> (sander@humilis.net's message
 of "Thu, 30 Dec 2004 20:21:11 +0100")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sander@humilis.net
Cc: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>, hihone@bigpond.net.au, reiserfs-list@namesys.com

Sander <sander@humilis.net> writes:

> I did recover data that way several times back when I didn't do backups.
> The problem is though that one file does not occupy one spot on the
> harddisk. It might be spread all over the place. While the data might
> still be there (on an idle disk), you miss the much needed pointers to
> the data.

I'm not talking about grep here. I'm talking about a reiser tool to
scan the partition for metadata and use this to recover the file by
putting it back in the tree.

Methods like grep is an absolute last resort, if, like in this case,
there is no tool that does the job.

-- 
Esben Stien is b0ef@esben-stien.name
http://www.esben-stien.name
irc://irc.esben-stien.name/%23contact
[sip|iax]:b0ef@esben-stien.name
