From: Matthias Andree <matthias.andree@gmx.de>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Fri, 31 Dec 2004 09:36:35 +0100
Message-ID: <20041231083635.GB7218@merlin.emma.line.org>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local> <m38y7gx8kq.fsf@merlin.emma.line.org> <20041230235911.4911a20c.hihone@bigpond.net.au> <m3sm5nj2ef.fsf@merlin.emma.line.org> <87is6jpvdu.fsf@quasar.esben-stien.name> <20041230174732.GB5206@favonius> <234966540.20041230192607@tnonline.net> <m3brcbqsz6.fsf@merlin.emma.line.org> <41D4D188.4070904@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22998-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <41D4D188.4070904@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

On Thu, 30 Dec 2004, Hans Reiser wrote:

> >A working undelete can either hog disk space or die the moment some
> >large write comes in. And if you're at that point, make it a versioning
> >file system
> >
> Well, yes, it should be one.....
> 
> darpa is paying for views, add in a little versioning and.....

If the "view" is something between a transactional view in a SQL
database and a device-mapper snapshot, then yes, it might be close
enough. There's however always the problem of capacity conflicts, and
there may need to be a switch that prefers "keep older versions" over
"discard older versions" so that the admin with - by your leave - idiot
users has a chance to save his users' a**e*.

> >- but then don't complain about space efficiency.
>
> This is an area where apple was smarter than Unix.  Having a trash can 
> is what real users need, more than they need performance..

Does Apple's trash can help against files that get overwritten in situ?
If not, it's insufficient to fix another common failure. My Mom is
"prone" (is that word applicable to human behavior?) to open a file
(say, a half year schedule of the local community), edit it, without
saving it under a new name - by the time she's completed her edit, she
has forgotten to rename it and boom, old file dead. Next week she wants
it back...

> I would however auto-empty the trash can when space got low....

That isn't desired. See above.

> Well, it hasn't been coded solely because we haven't gotten around to it 
> what with all else that needs doing and still needs doing.  Remind me 
> about this in a year.:)

Save this mail to a file and have atd mail it to you. Or use a calendar :)

-- 
Matthias Andree
