From: Edward Shushkin <edward@namesys.com>
Subject: Re: Reiser4 crypto-compression design
Date: Thu, 27 Mar 2003 19:15:15 +0300
Sender: edward
Message-ID: <3E832393.547E8444@namesys.com>
References: <3E80B384.2190B074@namesys.com> <20030325202319.GT9317@hvs.envisage.co.za> <3E81DD6C.AA9B5A92@namesys.com> <20030326185323.GC9317@hvs.envisage.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13406-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hendrik Visage <hvisage@envisage.co.za>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com, Pierre Abbat <phma@webjockey.net>, reiser@namesys.com

Hendrik Visage wrote:
> 
> On Wed, Mar 26, 2003 at 08:03:40PM +0300, Edward Shushkin wrote:
> > Hendrik Visage wrote:
> > > >   When user creates a crypto-file, the file system asks for a secret
> > > > key and calculates its id (128-bit word) which supposed to be stored
> > > > in file's stat-data on disk.
> > >
> > > What about Public-Private key setups?
> >
> > Hans, do we need public-private interface in reiser4?
> 
> Without it (Even W2K uses a public private setup of some sort

Huh? W2K has a file system with transparent encrypton/compression?

) the
> whole shared[1] key you've described below, would be missing some features.
> 
> > > Ie. using a Public key to encrypt the data (Or at least encrypt the
> > > shared key with the public key).
> >
> >   You mean whether Alice can read a file, which Bob created by Alice's
> > public key?
> 
> Partly yes, but typically you use the public keys of groups of users
> to encrypt the shared key of the file for them to later be able to
> decrypt the shared key independently.
> 
> >   I want to specify precisely, what is 128-bit key-id.
> > Our private(secret) key consists from two parts:
> > 1) key required by crypto algorithm to decrypt data
> 
> Isn't 128bit a bit "weak"? I'd prefer a *minimum* 128bit, with it being
> extensible (It offcourse depends on the file and user choices)

Yes, 128 bit (md5 output) is a minimum.
User should assign the hash function to make key-id.

> 
> > 2) special random string which was created during key generation procedure.
> >   In order to calculate key-id we decrypt (2) by (1) and apply to the result
> > a crypto-stable hash function. This key-id supposed to be stored in stat-data
> > and is used by the FS to identify private key. Also this key-id is a part of
> > public key which is a pair:
> 
> Hmmmm....
>  Could you refer me to the references you've used for this system?

There is no any reference, this is our decision which is based on difficulty
of finding of hash collisions. We need a public fingerprint of private key
to identify it. Actually this is a file system who needs this identification, 
but it lives on disk, and everything on disk is "public".

> 
> > a) key required by crypto algorithm to encrypt data
> > b) key-id
> > Obviously, public key makes sense only for asymmetric crypto algorithms.
> 
> No, you'll have the generate the public-private keys for the asymmetric crypto
> algorithms based on the specific algorithm's methods.
> 
> > > Also, there might/would be the need for
> > > escrow(Right term?) keys. Ie. keys that the Security Officer
> >
> > is it a kind of shared key?
> 
> It means that the key used for the encryption/decryption, is accesible
> to the security officers.
> 
> also, what about integration with Kerberos for the keys? Or should I rather ask
> How would I be able to interact via a process to give/deny access to keys?

But I know that Kerberos uses stream crypto modes which is to detect transfer errors 
for large flows, I am not sure if it is compatible with our transparent encryption
which deals with small clusters (4-32)K..

> > > could use to decrypt data (In case of bus accident or dismissal etc.)

>  Ie. AFAIK, pgp/gnupg encrypts the data with a "secret" key using an algorithm
> like des/idea/rc4/blowfih/aes.

Btw, des packs 48 bits into double cpu word, which is suboptimal, 
blowfish seems to be better..

Thanks, 
Edward.

 This secret/shared key is then seperately
> encrypted with the public keys of everybody that the data data is destined for.
> Thus for twenty users, there will be twenty encrypted shared keys (one for
> each user) that's encrypted with each of their public keys. Each user would
> then decrypt the key encrypted with his public key, and use that to
> decrypt the file.
