From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: Reiser4 crypto-compression design
Date: Wed, 26 Mar 2003 20:53:23 +0200
Message-ID: <20030326185323.GC9317@hvs.envisage.co.za>
References: <3E80B384.2190B074@namesys.com> <20030325202319.GT9317@hvs.envisage.co.za> <3E81DD6C.AA9B5A92@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13397-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E81DD6C.AA9B5A92@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shushkin <edward@namesys.com>
Cc: Hendrik Visage <hvisage@envisage.co.za>, reiserfs-list@namesys.com, reiserfs-dev@namesys.com, Pierre Abbat <phma@webjockey.net>, reiser@namesys.com

On Wed, Mar 26, 2003 at 08:03:40PM +0300, Edward Shushkin wrote:
> Hendrik Visage wrote:
> > >   When user creates a crypto-file, the file system asks for a secret
> > > key and calculates its id (128-bit word) which supposed to be stored
> > > in file's stat-data on disk.
> > 
> > What about Public-Private key setups?
> 
> Hans, do we need public-private interface in reiser4?

Without it (Even W2K uses a public private setup of some sort) the
whole shared[1] key you've described below, would be missing some features.

> > Ie. using a Public key to encrypt the data (Or at least encrypt the
> > shared key with the public key).
> 
>   You mean whether Alice can read a file, which Bob created by Alice's
> public key? 

Partly yes, but typically you use the public keys of groups of users
to encrypt the shared key of the file for them to later be able to
decrypt the shared key independently.

>   I want to specify precisely, what is 128-bit key-id. 
> Our private(secret) key consists from two parts: 
> 1) key required by crypto algorithm to decrypt data

Isn't 128bit a bit "weak"? I'd prefer a *minimum* 128bit, with it being
extensible (It offcourse depends on the file and user choices)

> 2) special random string which was created during key generation procedure.
>   In order to calculate key-id we decrypt (2) by (1) and apply to the result 
> a crypto-stable hash function. This key-id supposed to be stored in stat-data
> and is used by the FS to identify private key. Also this key-id is a part of
> public key which is a pair:

Hmmmm.... 
 Could you refer me to the references you've used for this system?

> a) key required by crypto algorithm to encrypt data
> b) key-id
> Obviously, public key makes sense only for asymmetric crypto algorithms.

No, you'll have the generate the public-private keys for the asymmetric crypto
algorithms based on the specific algorithm's methods.

> > Also, there might/would be the need for
> > escrow(Right term?) keys. Ie. keys that the Security Officer 
> 
> is it a kind of shared key?

It means that the key used for the encryption/decryption, is accesible
to the security officers. 

also, what about integration with Kerberos for the keys? Or should I rather ask
How would I be able to interact via a process to give/deny access to keys?
 
> > could use to decrypt data (In case of bus accident or dismissal etc.)
> > 
> > Or rather, how will the FS "ask"/request a key for decryption in a secure way?
> 
> So when user creates new crypto-file and writes into it, the FS requires only a 
> public key (his own, or someone's else). For all future accesses to this crypto-file
> the FS will require both keys (private key for access and read, and public key 
> for write); it may be the same key if crypto algorithm is symmetric).

The description above is correct, but public-private key algorithms are 
too slow for any usefull "realtime" data/communication en/decryption, and
that's why they are mostly only used for the shared/secret key exchange.

> Thanks for interesting question, 
> Edward.

Note [1]: 
 Public-Private (asymetric) encryption is usualy only used for the
 setup of shared keys. Shared keys are sometimes called secret keys
 and is the keys used in a symetric algorithm (typically the algorithm
 used in a block mode to encrypt the file data).

 The difference is that private keys are only known to the owner, (public
offcourse known to all and that's what get "certified" in certificates)
while the shared/secret is known/accesible by all that have a need to the
communication/data.

 Ie. AFAIK, pgp/gnupg encrypts the data with a "secret" key using an algorithm
like des/idea/rc4/blowfih/aes. This secret/shared key is then seperately
encrypted with the public keys of everybody that the data data is destined for.
Thus for twenty users, there will be twenty encrypted shared keys (one for 
each user) that's encrypted with each of their public keys. Each user would
then decrypt the key encrypted with his public key, and use that to 
decrypt the file.
