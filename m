From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: reiserfsck not fixing vs-5150/vs-13070
Date: Fri, 30 Aug 2002 13:09:29 +0200
Message-ID: <m3bs7k4n86.fsf@merlin.emma.line.org>
References: <20020828203754.GA11894@merlin.emma.line.org>
	<20020829111237.GO21461@suse.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11350-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020829111237.GO21461@suse.de> (Hubert Mantel's message of
 "Thu, 29 Aug 2002 13:12:37 +0200")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hubert Mantel <mantel@suse.de> writes:

> This is an unofficial kernel with lots of new features and work in
> progress. The README file explicitly warns not to use this one on a
> production system yet. Depending on the version you are using, there
> exists even a random memory corruption bug that only recently got fixed.

Thanks for the heads-up. I'm aware that your unofficial kernel is WIP,
and that it can undeliberately eat my lunch, burn my house and exhume my
grandmother -- and even memory corruptions /could/ serve to improve
fsck.*.

Still, it looks as though the problems really escaped reiserfsck v3.6.3
but no more v3.6.4-pre1.

I'll check your kernel's changelog to get the fix though.

-- 
Matthias Andree
