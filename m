From: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Subject: Re: Linux 2.4 -> 2.6 migration
Date: Sat, 08 Nov 2003 13:21:37 +0100
Message-ID: <m3u15fqcdq.fsf@merlin.emma.line.org>
References: <m3ptg42t8l.fsf@toyland.sauerland.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16018-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3ptg42t8l.fsf@toyland.sauerland.de> (Sebastian Kaps's message
 of "Fri, 07 Nov 2003 14:39:06 +0100")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Kaps <seb-keyword-reiserfs.0462a0@toyland.sauerland.de>
Cc: reiserfs-list@namesys.com

Sebastian Kaps <seb-keyword-reiserfs.0462a0@toyland.sauerland.de> writes:

> Is there something concerning ReiserFS I should know when migrating from
> Linux 2.4 to Linux 2.6?

No. Make sure the file system is fine before booting a new kernel, using
a CURRENT reiserfsprogs is essential. Namesys have made lots of fixes
recently.

-- 
Matthias Andree

Encrypt your mail: my GnuPG key ID is 0x052E7D95
