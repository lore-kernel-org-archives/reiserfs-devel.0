From: Michael Weissenbacher <webmaster@dermichi.com>
Subject: Re: fsck.reiser4 problem (was: reiser4 corruption problem)
Date: Tue, 31 Aug 2004 02:02:36 +0200
Message-ID: <4133C01C.90306@dermichi.com>
References: <20040830210735.6104715C98@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21129-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040830210735.6104715C98@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>
Cc: David Dabbs <david@dabbs.net>

> Even though both file sets contain umlauts, or perhaps more accurately extended ASCII chartacters, there is something distinctive in the "failure" set: the umlauts/extended characters appear after the 15th character. If you are using REISER4_LARGE_KEYS, the first fifteen characters will be shifted into the second and third key elements with the final key el containing the hash of the remaining characters 
exactly! the problem occurs when using extended characters that appear 
after the 15th character!
> Code in fs/reiser4/kassign.c assembles the key and uses your chosen hash, R5 being the default. If you created the files without failure, could read/opened them okay but then FSCK reported problems, could this point to a difference in the hash code (w.r.t. extended ASCII)? I'm on holiday now, so cannot check to see if this suspicion holds any water. 
yes, create/read/open works ok, a diff shows no difference. after my 
first tests i panicked because fsck.reiser4 reported "fatal corruptions" 
and used --build-fs as suggested. fsck.reiser4 then moved these files to 
the lost+found directory. fsck.reiser4 didn't report corruoption after 
that, but there was no way of finding out where the files were before or 
what their names were. so with this bug fsck.reiser4 is unusable for my 
situation.

would it do any good trying without the REISER4_LARGE_KEYS option?

thanks for your time,
Michael
