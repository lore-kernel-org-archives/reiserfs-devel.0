From: Pierre Abbat <phma@webjockey.net>
Subject: Re: Proposal for keying encrypted filesystem
Date: Sun, 30 Mar 2003 11:30:23 -0500
Message-ID: <200303301130.24136.phma@webjockey.net>
References: <200303282026.23543.phma@webjockey.net> <200303291155.40419.phma@webjockey.net> <3E85E338.CEAA7DC7@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13448-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E85E338.CEAA7DC7@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Saturday 29 March 2003 13:17, Edward Shushkin wrote:
> Any collision can be used by attacker for access to remained decrypted data
> in memory, so you should assign the *whole* output of any crypto-stable
> hash function (20 bytes for SHA1). If you use 19 bytes for ID, there is no
> any guarantee that someone can not find a collision easy.
> Edward.

There isn't any guarantee with all 20 either, it's just 256 times as hard to 
find one and practically impossible. What about using the MD5 of the 
passphrase for the key ID, and the SHA1 of the passphrase for the key?

phma
-- 
.i toljundi do .ibabo mi'afra tu'a do
.ibabo damba do .ibabo do jinga
.icu'u la ma'atman.
