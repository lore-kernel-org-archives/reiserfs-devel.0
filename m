From: Hans Reiser <reiser@namesys.com>
Subject: Re: Behavior of tails with respect to shred, wipe,
 etc
Date: Sat, 26 Oct 2002 17:53:52 +0400
Message-ID: <3DBA9E70.4040703@namesys.com>
References: <HDEFILEPHCPLCAGPLCEMIELIDFAA.icycle@charter.net> <15801.26994.705639.374241@laputa.namesys.com>            <3DB9F2B6.6000701@namesys.com> <200210260709.g9Q79N8Q012571@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11799-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: Reiserfs-List <reiserfs-list@namesys.com>

Valdis.Kletnieks@vt.edu wrote:

>On Sat, 26 Oct 2002 05:41:10 +0400, Hans Reiser said:
>
>  
>
>>Use encryption.  Encryption still leaves you vulnerable to those who can 
>>extract the key out of the owner though.
>>    
>>
>
>If you have multiple users on the same filesystem, key management becomes...
>umm... "interesting".  Projects like loop-AES usually finesse it by only
>having one key per filesystem.
>
>It's 3AM, I'm going to avoid thinking about what's involved if *one* user on
>a multi-user partition needs to change a compromised key.... ;)
>  
>
Try thinking about what happens if you build a distributed filesystem 
with security based on keys, and you want to remove one user from access 
to a file.

;-)


This may be an inherent limitation on key based security.

We are going to allow users to supply whatever key they want to for 
encrypting a file in reiser4.1.  Unfortunately, due to  Halloween, it 
looks like reiser4.0 will have little in the way of new features, and 
all the new stuff will be delayed until 4.1, which will hopefully come 
out sometime around January.

Hans


