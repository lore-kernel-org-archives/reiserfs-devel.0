From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: Proposal for keying encrypted filesystem
Date: Mon, 31 Mar 2003 11:15:49 +0200
Message-ID: <20030331091549.GE8452@hvs.envisage.co.za>
References: <200303282026.23543.phma@webjockey.net> <200303291549.08160.phma@webjockey.net> <20030330101226.GB3520@hvs.envisage.co.za> <200303301200.53330.phma@webjockey.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13468-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200303301200.53330.phma@webjockey.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list@namesys.com

On Sun, Mar 30, 2003 at 12:00:53PM -0500, Pierre Abbat wrote:
> On Sunday 30 March 2003 05:12, Hendrik Visage wrote:
> > In this whole discussion I'm still missing some references to research
> > papers on this technique, as it still sounds to me like security by
> > obscurity.
> 
> I didn't find this in research papers. I thought of it in the bathtub. The 

*red*red*lights*flashing*
*smelling*snake*oil*

Seriously:

 I'm not saying this is good not bad, just that I will not trust it
until some decent peer review from people that worked with key management
ala kerberos etc.

> 1. A script can run, and it and all of its children can access the encrypted 
> files, whereas no other process can. This would be used by an encrypted 
> backup server, so that the operator of the backup server cannot read the 
> backups, even while they are being backed up. It could also be used on 
> multiuser workstations; if a user logs in twice, he would also have to key 
> the filesystem twice.

still doable with decent keys & public/private keys

> 2. A computer can have an encrypted /home directory, which is keyed once, and 
> then every user can access files in it, subject to the permission bits.

This is done with inheritance etc. and then giving the computer the key
to the keys (Though it must be protected really well).

> > On the key: I'd prefer it to be  "truely" randomly generated
> > (ie. /dev/random and not /dev/urandom), and then it be encrypted.
> > I'd prefer it to be encrypted with the public keys of all those that
> > would need access to it.
> 
> If each file has a different key, and each key is generated with /dev/random 
> and encrypted with public keys, making a directory containing thousands of 
> files is going to be *very* slow.

Agreed. But then you have directory which could/would share a common key etc.


The issue I have is that I want the key management to be secure, and not like
the historical Microsoft etc. key systems that get compromised by just
thinking twice. Your method I'd like to see a review or two by people that
have worked with key management before, as I get the feeling that it's
more about obscurity rather than security (It's a very subjective view though)

And the hashing part is what I'm cautious about as I would prefer it to be
real keys (encrypted with real keys) used in real Algorithms, rather than
just obscuring I am going to safe sensitive data in these files/directories.

Hendrik
