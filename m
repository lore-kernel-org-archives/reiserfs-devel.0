From: "David Dabbs" <david@dabbs.net>
Subject: Re: fsck.reiser4 problem (was: reiser4 corruption problem)
Date: Tue, 31 Aug 2004 01:24:46 -0000
Message-ID: <20040831012446.631CB15E2E@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21136-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Weissenbacher <webmaster@dermichi.com>, reiserfs-list@namesys.com


| Michael Weissenbacher 
> David Dabbs wrote:
> Even though both file sets contain umlauts, or perhaps more accurately extended
> ASCII chartacters, there is something distinctive in the "failure" set: the 
> umlauts/extended characters appear after the 15th character. If you are using 
> REISER4_LARGE_KEYS, the first fifteen characters will be shifted into the second
> and third key elements with the final key el containing the hash of the remaining
> characters 
| exactly! the problem occurs when using extended characters that appear
| after the 15th character!

> Code in fs/reiser4/kassign.c assembles the key and uses your chosen hash, R5 
> being the default. If you created the files without failure, could read/opened
> them okay but then FSCK reported problems, could this point to a difference in
> the hash code (w.r.t. extended ASCII)? I'm on holiday now, so cannot check 
> to see if this suspicion holds any water. 

| yes, create/read/open works ok, a diff shows no difference. after my 
| first tests i panicked because fsck.reiser4 reported "fatal corruptions" 
| and used --build-fs as suggested. fsck.reiser4 then moved these files to 
| the lost+found directory. fsck.reiser4 didn't report corruoption after 
| that, but there was no way of finding out where the files were before or 
| what their names were. so with this bug fsck.reiser4 is unusable for my 
| situation.
| 
| would it do any good trying without the REISER4_LARGE_KEYS option?
| 

Probably not. All that will do is drop the third key element, so you will then likely see problems with names where the extended character(s) appear after the seventh character. If you feel energetic and want to do it, try disabling LARGE_KEY, and retesting. Before doing so, however, try setting the filesystem's default fibration plugin to none or whatever the 'no fibration' option is. This will remove fibration code from the suspect list if the retest is successful. 

| thanks for your time,
| Michael

My pleasure. Thank /you/ for helping to debug!

David D.
