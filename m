From: Chris Dukes <pakrat@www.uk.linux.org>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 18:49:36 +0000
Message-ID: <20041230184936.GA18173@ZenIV.linux.org.uk>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local> <m38y7gx8kq.fsf@merlin.emma.line.org> <20041230235911.4911a20c.hihone@bigpond.net.au> <m3sm5nj2ef.fsf@merlin.emma.line.org> <87is6jpvdu.fsf@quasar.esben-stien.name> <20041230174732.GB5206@favonius> <87zmzvoeeo.fsf@quasar.esben-stien.name> <20041230183046.GD5206@favonius> <87d5wroc9a.fsf@quasar.esben-stien.name>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22970-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <87d5wroc9a.fsf@quasar.esben-stien.name>
Sender: <pakrat@ftp.linux.org.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Esben Stien <b0ef@esben-stien.name>
Cc: sander@humilis.net, Matthias Andree <ma@dt.e-technik.uni-dortmund.de>, hihone@bigpond.net.au, reiserfs-list@namesys.com

On Thu, Dec 30, 2004 at 07:46:09PM +0100, Esben Stien wrote:
> 
> It would be too expensive to do all this backup'ing in userspace. When
> a file gets deleted, a proper procedure to retrieve it would be to
> umount the filesystem, scan it for the data which was removed and then
> put it back in the tree again. It's not like reiserfs overwrites this
> data, it's still there, so why should there be an artificial barrier
> to getting this data back?.

You're using the wrong tool for the job.
For what you're asking for you want Plan 9 and its
wormfs.

Thanks for playing.  

-- 
Chris Dukes
Warning: Do not use the reflow toaster oven to prepare foods after
it has been used for solder paste reflow. 
http://www.stencilsunlimited.com/stencil_article_page5.htm
