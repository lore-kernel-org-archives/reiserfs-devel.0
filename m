From: Edward Shushkin <edward@namesys.com>
Subject: Re: Proposal for keying encrypted filesystem
Date: Sat, 29 Mar 2003 21:17:28 +0300
Sender: edward
Message-ID: <3E85E338.CEAA7DC7@namesys.com>
References: <200303282026.23543.phma@webjockey.net> <3E85CDEF.7B6BD323@namesys.com> <200303291155.40419.phma@webjockey.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13437-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list@namesys.com

Pierre Abbat wrote:
> 
> On Saturday 29 March 2003 11:46, Edward Shushkin wrote:
> > Never trust 4-byte ID. The first collision that provides any assigned 4
> > bytes in SHA1 output can be found very easy..
> 
> How many bytes of key ID would you use? A 4-byte key ID would mean that if
> about 92682 different keys were in use, there would be half a chance of a
> collision.
> 

Any collision can be used by attacker for access to remained decrypted data
in memory, so you should assign the *whole* output of any crypto-stable hash 
function (20 bytes for SHA1). If you use 19 bytes for ID, there is no any
guarantee that someone can not find a collision easy.
Edward.
 
> By the way, I am on the list.
