From: Pierre Abbat <phma@webjockey.net>
Subject: Re: Proposal for keying encrypted filesystem
Date: Fri, 4 Apr 2003 09:57:55 -0500
Message-ID: <200304040957.55182.phma@webjockey.net>
References: <200303282026.23543.phma@webjockey.net> <200304040930.29884.phma@webjockey.net> <200304041447.h34Eluli004869@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13572-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304041447.h34Eluli004869@turing-police.cc.vt.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

On Friday 04 April 2003 09:47, Valdis.Kletnieks@vt.edu wrote:
> Properly applied, you can even leverage it further - for instance, if your
> backup process doesn't have the key tokens, you can safely let it have
> access to all the files - it can read the 127 meg of data to back it up in
> a bitwise manner, but it can't actually DO anything with the data - this is
> something that you can't do in the "give everything the token" model....

Are you talking about the rsync process on Alice, the rsync process on Bob, or 
the process that Bob uses to make backups of all the encrypted backups that 
Alice and others entrust him with?

If a process that has no key tokens attempts to read an encrypted file with 
the ordinary syscalls, does it get an error or the ciphertext? Should there 
be a token that allows a process to read and write the ciphertext of an 
encrypted file? Will rsync need to be modified to be able to r/w the key ID 
of an encrypted file?

phma
-- 
.i toljundi do .ibabo mi'afra tu'a do
.ibabo damba do .ibabo do jinga
.icu'u la ma'atman.
