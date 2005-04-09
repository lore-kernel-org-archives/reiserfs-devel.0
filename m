From: Nicolae Mihalache <mache@abcpages.com>
Subject: Re: corrupted files
Date: Sat, 09 Apr 2005 20:04:59 +0200
Message-ID: <4258194B.6090708@abcpages.com>
References: <425704EA.7020707@abcpages.com> <4257D20B.3030302@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23826-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4257D20B.3030302@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christian <evilninja@gmx.net>, reiserfs-list@namesys.com

Christian wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Nicolae Mihalache wrote:
> 
>>Hi,
>>
>>I have experience some weird problems on a reiserfs partition. I tried
>>to copy a big archive (6.9GB) from another computer using scp or ftp and
>>it seems that the file gets somehow corrupted. Right now I manage to
>>reproduce the problem even locally, I copy the file in the same
>>directory, no error, still cmp tells they are different:
> 
> 
> when does the corruption kicks in? are small plaintext files also
> corrupted? or only if you copy files of a certain amount of filesize?
> if textfiles are also affacted, maybe "diff" could show us exactly *what*
> differs.
> 

small files seem to be ok. The smallest one for which I observed the 
problem was about 600MB. For the one of 6GB is always repeatable: cp 
folowed by cmp reports always differences in the files.


>>It may be a hardware problem but I somehow doubt it.
> 
> 
> /var/log/messages?
nothing relevant, the hard-disk does not seem to have bad sectors or 
something like that.

> 
> 
>>reiserfsck says No corruptions found.
>>The system is SuSE 9.0, kernel 2.4.21-273-smp4G (it is a dell poweredge
> 
> 
> so, this is reiserfs3, right? did you use the current reiserfsprogs?

yes, reiserfs3. I use reiserfs 3.6.9 delivered with SuSE 9.0. Do you 
think a newer version would help? To me the problem seems to be in the 
kernel not in the utility programs.

Anyway is anybody interested in investigating this problem further? I 
can make a complete dump of the partition (it's about 80GB), such that 
it can be used in loop mode for test. I will also make some tests with 
the parition in the loop mode on another computer.

Otherwise I inted to reformat completely that partition (should I still 
use reiserfs3? somehow I don't trust it anymore).


mache
