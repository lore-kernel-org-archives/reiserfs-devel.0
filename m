From: Pierre Abbat <phma@webjockey.net>
Subject: Re: Proposal for keying encrypted filesystem
Date: Fri, 4 Apr 2003 09:30:29 -0500
Message-ID: <200304040930.29884.phma@webjockey.net>
References: <200303282026.23543.phma@webjockey.net> <200304031822.12677.phma@webjockey.net> <200304041401.h34E1Hli003929@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13570-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304041401.h34E1Hli003929@turing-police.cc.vt.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

On Friday 04 April 2003 09:01, Valdis.Kletnieks@vt.edu wrote:
> On Thu, 03 Apr 2003 18:22:11 EST, Pierre Abbat <phma@webjockey.net>  said:
> > What's LSM? This sounds like it can do what I want with rsync. Is it
> > possible
> >
> > to add a new key token to init and have it propagate to all processes?
>
> If that's the semantics you *REALLY* want, a better idea would probably be
> to use loop-AES to encrypt an entire partition.
>
> Note that this only works if your threat model reduces to "US vs THEM"
> (i.e. "me vs whoever stole the laptop".  If you have more than one class of
> users involved, you can't do it this way (and yes, there *do* exist threat
> models where you want to make sure that even if the attacker manages to
> bypass the file system permissions and get the contents of the file,
> they're still useless...)

That's a semantic that I'd like to be *possible*. It's not the one I want to 
use with rsync. For that I want to set the key in one process (the sshd on 
the backup server Bob that is forked when Alice starts rsync) and have all 
its children (which will just be rsync) but no one else be able to read the 
files.

But I'd also like to be able to have several encrypted directories on one 
partition, with different keys, such that when I give the key any process 
with the right UID can access them. I might have a cron job that needs access 
to encrypted data.

phma
-- 
.i toljundi do .ibabo mi'afra tu'a do
.ibabo damba do .ibabo do jinga
.icu'u la ma'atman.
