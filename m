From: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Fri, 31 Dec 2004 00:14:21 +0100
Message-ID: <m3brcbqsz6.fsf@merlin.emma.line.org>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>
	<m38y7gx8kq.fsf@merlin.emma.line.org>
	<20041230235911.4911a20c.hihone@bigpond.net.au>
	<m3sm5nj2ef.fsf@merlin.emma.line.org>
	<87is6jpvdu.fsf@quasar.esben-stien.name>
	<20041230174732.GB5206@favonius>
	<234966540.20041230192607@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22984-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <234966540.20041230192607@tnonline.net> (spam@tnonline.net's
	message of "Thu, 30 Dec 2004 19:26:07 +0100")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spam <spam@tnonline.net>
Cc: reiserfs-list@namesys.com

Spam <spam@tnonline.net> writes:

>   In any case. Undelete has been since ages on many platforms. It IS a
>   useful feature. Accidents CAN happen for many reasons and in some
>   cases you may need to recover data.
>
>   Besides, a deletion does not fully remove the data, but just unlinks
>   it. In Reiser where there is tailing etc for small files this can be
>   a problem. Either the little file might not be able to be recovered
>   (shouldn't the data still exist, even if it is tailed), or the user
>   need to use a non-tailing policy?

A working undelete can either hog disk space or die the moment some
large write comes in. And if you're at that point, make it a versioning
file system - but then don't complain about space efficiency.

>   well, overwritten data is not so easy to get back. But from what I
>   understand in Linux, is that many applications actually write
>   another file and then unlinks the old file? If that is the case then
>   it may even be possible to get back some overwritten files!

I see enough applications to just overwrite an output file. 

This whole discussion doesn't belong here until someone talks about
implementing a whole versioning system for reiser4.

-- 
Matthias Andree
