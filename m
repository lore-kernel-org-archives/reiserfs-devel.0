From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: Proposal for keying encrypted filesystem
Date: Sun, 30 Mar 2003 12:12:26 +0200
Message-ID: <20030330101226.GB3520@hvs.envisage.co.za>
References: <200303282026.23543.phma@webjockey.net> <200303291155.40419.phma@webjockey.net> <3E85E338.CEAA7DC7@namesys.com> <200303291549.08160.phma@webjockey.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13446-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200303291549.08160.phma@webjockey.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list@namesys.com

On Sat, Mar 29, 2003 at 03:49:07PM -0500, Pierre Abbat wrote:
> On Saturday 29 March 2003 13:17, Edward Shushkin wrote:
> > Any collision can be used by attacker for access to remained decrypted data
> > in memory, so you should assign the *whole* output of any crypto-stable
> > hash function (20 bytes for SHA1). If you use 19 bytes for ID, there is no
> > any guarantee that someone can not find a collision easy.
> > Edward.
> 
> If you use all 20 bytes as the key ID, what do you use as the key?? Using 4 

In this whole discussion I'm still missing some references to research papers
on this technique, as it still sounds to me like security by obscurity.

On the key: I'd prefer it to be  "truely" randomly generated
(ie. /dev/random and not /dev/urandom), and then it be encrypted.
I'd prefer it to be encrypted with the public keys of all those that 
would need access to it.

