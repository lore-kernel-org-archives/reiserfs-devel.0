From: Ingo Bormuth <ibormuth@efil.de>
Subject: Re: Filesystem corruption
Date: Wed, 6 Jun 2007 01:20:00 +0200
Message-ID: <20070605232000.GA1283@efil.de>
References: <160382.11806.qm@web31708.mail.mud.yahoo.com> <200705301503.15105.ninja@slaphack.com> <20070531001151.GA9933@efil.de> <4661F8ED.4070001@namesys.com> <20070604025528.GA19513@efil.de> <4663DE53.6000509@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30686-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4663DE53.6000509@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On 2007-06-04 13:41, Edward Shishkin wrote:

> When performing mapping read (needed for execution, etc) reiser4
> converts small files from tails to extents and back (your /bin/sleep
> is less then 4 * blocksize, right?)

Yes, it's 15k. 

The conversion is done on disk, even when mounted read only?  I'd like
to see the logic in the code. In case you just know by heart, it' would
be nice if you could give me a little hint where to start at.

> Please, rebuild your kernel with the official patch
> [...]
> Please, report, if such data loss still takes place after upgrade.

I'll keep you informed ...

Thanks.


-- 
Ingo Bormuth, voicebox & fax: +49-(0)-12125-10226517
public key 86326EC9, http://ibormuth.efil.de/contact

