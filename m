From: Pierre Abbat <phma@webjockey.net>
Subject: Re: Proposal for keying encrypted filesystem
Date: Sat, 29 Mar 2003 15:49:07 -0500
Message-ID: <200303291549.08160.phma@webjockey.net>
References: <200303282026.23543.phma@webjockey.net> <200303291155.40419.phma@webjockey.net> <3E85E338.CEAA7DC7@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13441-reiserfs=m.gmane.org@namesys.com>
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

If you use all 20 bytes as the key ID, what do you use as the key?? Using 4 
bytes as the key ID and 16 bytes as the key, if an attacker produces a 
collision and tries to use it to access data, he will get gibberish, as the 
key he is using is different from the key used to encrypt the data.

Please do not send a message to both me and the list. I am on the list.

